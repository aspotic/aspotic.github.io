+++
showonlyimage = false
draft = true
image = "img/post/.svg"
date = "2019-10-30T01:01:01+06:00"
title = "Splunk Querying"
weight = 0
categories = []
tags = []
+++
https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/streamstats

# Building a list of indices
```
| eventcount summarize=false index=* 
| stats sum(count)  as count by index 
| sort -count
```

# Running Time Window Chart
```
index="<index-name>" "<some optional filtering term>" 
| search "<field>"=<field value>
| rex field=_raw "^(?<variableName>[0-9]*)$" 
| sort _time
| eval <finalVar>=<process variableName>
| streamstats time_window=1h sum(<finalVar>) as <finalVarSumInWindow> 
| timechart cont=FALSE last(<finalVarSumInWindow>) span=1s
```
time_window: the moving window used for calculating sum
span: the granularity of the time chart
cont: set to false so that zero values are compressed. This also breaks continuity, but makes sparsly filled plots easier to read

# Analysis of Timespans docker containers ran
```
index="<index-name>" "<some optional filtering term>"
| search "<field>"=<field value>
| stats min(timestamp) as minTime, max(timestamp) as maxTime by container.id
| eval minTime=strptime(minTime, "%Y-%m-%dT%H:%M:%S.%6QZ") 
| eval maxTime=strptime(maxTime, "%Y-%m-%dT%H:%M:%S.%6QZ")
| eval diff_in_minutes=(maxTime-minTime)/60
| stats median(diff_in_minutes), p95(diff_in_minutes), p96(diff_in_minutes), p97(diff_in_minutes), p98(diff_in_minutes), p99(diff_in_minutes), max(diff_in_minutes)
```
