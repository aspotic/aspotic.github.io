+++
showonlyimage = false
draft = true
title = "First Flutter App - Timed Vault"
image = "img/post/cover/flutter.png"
cover = "/img/post/cover/flutter.png"
author = "Adam Knox"
avatar = "/img/adam_avatar.jpeg"
date = "2021-05-25T00:01:01+06:00"
weight = 0
categories = ["Software Dev"]
tags = ["Flutter", "Software", "Mobile", "Programming", "Dev", "Development", "Web", "Dart", "Language", "Productivity"]
+++

Testing out flutter by building a timed password vault for locking down phone app access
<!--more-->

## Motivation
### For the Platform
I've heard flutter is a great platform for mobile development, and the ability to also serve the application on the web is a pretty big draw. Working for Workiva also means Dart experience will hopefully both make this more approachable than other options & inform future projects at work.
### For the Project
The reason for investigating mobile development is to build a timed password management system. I've started using my phones screen time management system and it has the ability to require a password to change preferences. This has been helpful for improving productivity, but I want to keep myself from changing these willy nilly to make it even more effective. 
## The Plan
### Improving Productivity
To improve the effectiveness of the screen time system I've decided to have an on-phone app that is exempt from the screen time system. This app will generate a number and only allow it to be viewed for x min every y hours.
### Contingencies
#### Access
I wanted this on-phone because it reduces the chances of problems with the system. If I need to get in, but it's remotely hosted when the window comes up, then it could be missed.
#### Corruption
To ensure access to the code is never permanently lost, it will backup the encrypted data to google drive to be downloaded to another device. 
#### Loopholes
Unlocking information is stored inside the encrypted file and loaded with the key to ensure there isn't an (easy) access loophole via the backup file.
## Setting up a new project
### Install Flutter
What a clean and easy experience! See the [[Flutter setup instructions|https://flutter.dev/docs/get-started/install]] to do this process yourself. 
### Access Examples
Once I had flutter, I then ran this in the root flutter directory to get the gallery of examples loaded.
> `git submodule add https://github.com/flutter/gallery.git`
and now the gallery can be perused after running
> `flutter run`
Flutter widget examples can also be found [here|https://flutter.dev/docs/development/ui/widgets]
### Create Timed Password Vault Project
Flutter has a [new project tutorial|https://flutter.dev/docs/get-started/codelab] that can be used to create a project. I had to run 
> `flutter create .`

to make it work for the web at which point 

> `flutter run` 

works to get the hello world service up.

## Figure out UI design

### Select Components
Flutter comes with many UI widgets, and has a [catalog|https://flutter.dev/docs/development/ui/widgets] that lists them out. These widgets nest into each other to build out the UI, with each being configurable to adjust design and interaction elements. In my case, I just need a date/time picker and elevatedButton for generating a new code that will stay hidden until the submitted date/time, and a list of existing codes displayed on cards that may or may not be censored. The code should also stay visible for 5 minutes after initial creation. I used the material gallery examples for the date and time pickers.

### Lay out Components
Flutter has a number of [layout widgets|https://flutter.dev/docs/development/ui/widgets/layout] than can be used for placing the components. Organization widgets that worked for me were a combination of Flexible, Column, Row, and ListView. To get them lookin nicely, mainAxisAlignment set too MainAxisAlignment.spaceEvenly worked for me.

### Do things
So the UI is there, but it doesn't do anything yet. For that I'll need to wire up the submit button, list, and set a timer up for hiding the data.

### Save things
This app will be an awful idea if the data doesn't persist somewhere, so now the functional UI needs to be set up to interact with the persistent datastore.

### Create Some Tests
