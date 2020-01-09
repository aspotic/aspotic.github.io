+++
showonlyimage = false
draft = true
image = "img/post/dart_in_node.svg"
date = "2019-09-27T11:11:11+06:00"
title = "Creating a Dart package in NodeJS"
weight = 0
categories = ["software development", "node", "javascript"]
+++

reference: https://x-team.com/blog/a-guide-to-creating-a-nodejs-command/

# Create a NodeJS Package
Create an empty package directory.
Run `npm init` from inside the new directory.

# Create the NodeJS Script
- can execute a script by running `node <your js filename>`
- put this at the top of the script file to run `/usr/bin/env node` no get it to run with node
- make the script file executable by running `chmod +x <your js filename>`
- test the script by running ./<your js filename>

# Give the script a nice name
- use the "bin" category in package.json to give the command a name
- make sure the name isn't already in use
- `{"bin": {"<cmd name>": "./<your js filename>"}}`

# Make the command available
- use `npm link` to make all bin commands accessible globally
- to make it no longer available globally, run `npm unlink`
