+++
showonlyimage = false
draft = true
image = "img/post/.svg"
date = "2019-10-30T01:01:01+06:00"
title = "Splunk Time Windows"
weight = 0
categories = []
tags = []
+++
https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/streamstats

index="<index-name>" "<some optional filtering term>" 
| search "<field>"=<field value>
| rex field=_raw "^(?<variableName>[0-9]*)$" 
| sort _time
| eval <finalVar>=<process variableName>
| streamstats time_window=1h sum(<finalVar>) as <finalVarSumInWindow> 
| timechart cont=FALSE last(<finalVarSumInWindow>) span=1s

time_window: the moving window used for calculating sum
span: the granularity of the time chart
cont: set to false so that zero values are compressed. This also breaks continuity, but makes sparsly filled plots easier to read
