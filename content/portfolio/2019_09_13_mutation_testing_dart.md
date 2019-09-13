Mutation analysis for dart

- stryker-mutator is a mutation testing framework for javascript (written in typescript) that allows creating plugins
- created a stryker-mutator plugin for a dart mutator. mutation dart code requires being able to parse dart code. This can be done with the dart library "analyzer"
- create a dart project that can use the "analyzer" package to mutate dart code, then use "node_interop" and "build_node_compilers" to wrap it in a node package that can be called by the stryker-mutator plugin
- use stryker-mutator with a stryker-dart-mutator plugin that passes the dart code to a dart-mutator package that is able to mutate it and return all the mutations
