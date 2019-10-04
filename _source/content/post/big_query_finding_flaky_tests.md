+++
showonlyimage = false
draft = true
image = "img/post/.svg"
date = "2019-10-30T01:01:01+06:00"
title = "Using Big Query to Find Flaky Tests"
weight = 0
categories = []
tags = []
+++

# Process
- look at retries
- take into account no tests running
- ...

```
WITH  -- Group together all run attempts to find the number of executions
  test_run_summaries AS (
    SELECT
      repo_name,
      repo_owner,
      configuration_name,
      git_reference, 
      git_hash,
      run_id_without_attempt,
      run_count_for_build,
      (SELECT COUNT(*) = 1 FROM (SELECT x FROM UNNEST(num_tests_run) AS x GROUP BY x)) AS consistent_test_count
    FROM (
      SELECT
        repo_name,
        repo_owner,
        configuration_name,
        git_reference, 
        git_hash,
        REGEXP_EXTRACT(run_id, "(.*:.*)\\.[0-9]*") AS run_id_without_attempt,
        COUNT(*) AS run_count_for_build,
        ARRAY_AGG(num_tests_run) AS num_tests_run
      FROM `test_run_complete`
      GROUP BY 
        repo_owner, 
        repo_name, 
        configuration_name, 
        git_reference, 
        git_hash, 
        run_id_without_attempt)
        ),  -- Filter out any test runs that ran a different number of tests 
  -- since there is no way to know if the failing test was run in this case
  -- Also filter out runs that didn't retry since there's no way to know if a failure was flaky
  test_run_summaries_with_consistent_test_counts_and_retries AS (
    SELECT *
    FROM test_run_summaries
    WHERE 
      run_count_for_build > 1  
      AND consistent_test_count = true
  ),  -- Collect all test failures
  -- Group test failures by build group
  failed_tests AS (
    SELECT
      repo_name,
      repo_owner,
      configuration_name,
      git_reference, 
      git_hash,
      REGEXP_REPLACE(test_name, "=[0-9]*", "=XX") AS test_name,
      REGEXP_EXTRACT(run_id, "(.*:.*)\\.[0-9]*") AS run_id_without_attempt,
      ARRAY_AGG(STRUCT(test_failure_url, stack_trace)) AS failure_details,
      ARRAY_AGG(test_failure_url) AS failure_url,
      MAX(DATE(completed_date)) AS final_complete_date,
      COUNT(*) AS failure_count_for_build
    FROM `test_failure`
    GROUP BY 
      repo_name,
      repo_owner,
      configuration_name,
      git_reference, 
      git_hash,
      run_id_without_attempt, 
      test_name),  -- Associate test failure information with test run summaries
  -- Find out if tests are flaky (test suite ran more times than the test failed i.e the test passed and failed)
  test_failure_summaries AS (
    SELECT
      failed_tests.*,
      failed_tests.failure_count_for_build < filtered_test_summaries.run_count_for_build AS flaky_test
    FROM failed_tests
    INNER JOIN test_run_summaries_with_consistent_test_counts_and_retries AS filtered_test_summaries
    ON
      failed_tests.repo_name = filtered_test_summaries.repo_name
      AND failed_tests.repo_owner = filtered_test_summaries.repo_owner
      AND failed_tests.configuration_name = filtered_test_summaries.configuration_name
      AND failed_tests.git_reference = filtered_test_summaries.git_reference
      AND failed_tests.git_hash = filtered_test_summaries.git_hash
      AND failed_tests.run_id_without_attempt = filtered_test_summaries.run_id_without_attempt
  )
SELECT
  repo_name,
  repo_owner,
  configuration_name,
  git_reference, 
  git_hash,
  test_name,
  final_complete_date AS complete_date,
  failure_count_for_build,
  failure_url,
  run_id_without_attempt
--   ARRAY_AGG(failure_details) AS failure_details
FROM 
  test_failure_summaries -- , UNNEST(failure_details) AS failure_details
WHERE 
  flaky_test IS True
```
