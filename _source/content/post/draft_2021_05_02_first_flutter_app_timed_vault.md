+++
showonlyimage = false
draft = true
title = "First Flutter App - Timed Vault"
image = "img/post/flutter.png"
cover = "/img/post/flutter.png"
author = "Adam Knox"
avatar = "/img/adam_avatar.jpeg"
date = "2021-05-02T19:13:12+06:00"
weight = 0
categories = ["flutter", "software dev.", "productivity"]
tags = ["flutter", "software", "mobile", "programming", "dev", "development", "web", "dart", "language", "productivity"]
+++

Testing out flutter by building a timed password vault for locking down phone app access
<!--more-->

# Motivation
### For the Platform
I've heard flutter is a great platform for mobile development, and the ability to also serve the application on the web is a pretty big draw. Working for Workiva also means Dart experience will hopefully both make this more approachable than other options & inform future projects at work.
### For the Project
The reason for investigating mobile development is to build a timed password management system. I've started using my phones screen time management system and it has the ability to require a password to change preferences. This has been helpful for improving productivity, but I want to keep myself from changing these willy nilly to make it even more effective. 
# The Plan
### Improving Productivity
To improve the effectiveness of the screen time system I've decided to have an on-phone app that is exempt from the screen time system. This app will generate a number and only allow it to be viewed for x min every y hours.
### Contingencies
#### Access
I wanted this on-phone because it reduces the chances of problems with the system. If I need to get in, but it's remotely hosted when the window comes up, then it could be missed.
#### Corruption
To ensure access to the code is never permanently lost, it will backup the encrypted data to google drive to be downloaded to another device. 
#### Loopholes
Unlocking information is stored inside the encrypted file and loaded with the key to ensure there isn't an (easy) access loophole via the backup file.
# Setting up a new project
### Install Flutter
What a clean and easy experience! See the [[Flutter setup instructions|https://flutter.dev/docs/get-started/install]] to do this process yourself. 
### Access Examples
Once I had flutter, I then ran this in the root flutter directory to get the gallery of examples loaded.
> `git submodule add https://github.com/flutter/gallery.git`
### Add Timed Password Vault Project
