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

# Analysis of event time spans
```
index="<index-name>" "<some optional filtering term>"
| search "<field>"=<field value>
| stats min(timestamp) as minTime, max(timestamp) as maxTime by container.id
| eval minTime=strptime(minTime, "%Y-%m-%dT%H:%M:%S.%6QZ") 
| eval maxTime=strptime(maxTime, "%Y-%m-%dT%H:%M:%S.%6QZ")
| eval diff_in_minutes=(maxTime-minTime)/60
| stats median(diff_in_minutes), p95(diff_in_minutes), p96(diff_in_minutes), p97(diff_in_minutes), p98(diff_in_minutes), p99(diff_in_minutes), max(diff_in_minutes)
```

# Appengine query task times
```
index=*
| rex field=logMessage "cursor_depth: (?<count>[0-9]*)"
| eval minTime=strptime(startTime, "%Y-%m-%dT%H:%M:%S.%6QZ") 
| eval maxTime=strptime(endTime, "%Y-%m-%dT%H:%M:%S.%6QZ")
| eval diff_in_minutes=(maxTime-minTime)/60
| stats 
     max(diff_in_minutes) as maxTaskTime, 
     p95(diff_in_minutes) as p95TaskTime, 
     p98(diff_in_minutes) as p98TaskTime, 
     median(diff_in_minutes) as medianTaskTime, 
     median(count) as medianCursorCount, 
     p95(count) as p95CursorCount, 
     p98(count) as p98CursorCount, 
     max(count) AS maxCursorCount
| eval maxQueryTime=maxTaskTime*maxCursorCount
| eval p95QueryTime=p95TaskTime*p95CursorCount
| eval p98QueryTime=p98TaskTime*p98CursorCount
| eval medianQueryTime=medianTaskTime*medianCursorCount
| table 
     medianCursorCount,
     p95CursorCount,
     p98CursorCount,
     maxCursorCount,
     medianTaskTime,
     p95TaskTime,
     p98TaskTime,
     maxTaskTime,
     medianQueryTime,
     p95QueryTime,
     p98QueryTime, 
     maxQueryTime
```
