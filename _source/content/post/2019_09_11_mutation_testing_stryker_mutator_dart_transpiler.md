+++
showonlyimage = false
draft = true
image = "img/post/dart_strykermutator.svg"
date = "2019-09-11T19:13:12+06:00"
title = "Mutation Testing: Dart Transpiler for Stryker-Mutator"
weight = 0
categories = ["software testing", "software development", "mutation testing", "test framework", "javascript", "typescrpit", "dart", "programming"]
+++

reference: https://stryker-mutator.io/

- stryker-mutator allows mutation testing for javascript and things that can be turned into javascript
- haven't been able to find a mutation testing framework for dart
- dart can be turned into javascript

# Pros
- can use all the mutators build for javascript
- stryker-mutator already has great reporting, plugin handling, execution, etc.

# Cons
- slower because transpiling has to happen
- likely cryp
