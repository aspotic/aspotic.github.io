+++
showonlyimage = false
draft = false
title = "Hosting a TiddlyWiki on GitHub pages"
image = "img/post/tiddlywiki.jpg"
cover = "/img/post/tiddlywiki.jpg"
author = "Adam Knox"
avatar = "/img/adam_avatar.jpeg"
date = "2021-04-24T01:01:01+06:00"
weight = 0
categories = ["Software Dev", "Productivity"]
tags = ["tiddlywiki","tiddly", "wiki", "github", "github pages", "web hosting", "blog", "productivity", "organization", "encryption"]
+++

These days we have so much information being thrown at us from all directions that it's hard to figure out what to do with it. I decided to try hosting an encrypted tiddlywiki with github pages for organizing my life, read on to find out how it's gone.
<!--more-->
## What is TiddlyWiki?
[TiddlyWiki](https://tiddlywiki.com/) is a single page wiki. It excels at connecting together complicated 
data in an easy to consume format. It's also extensible and has a number of useful plugins already available.
## Why I wanted a wiki
This lovely pandemic year has resulted in some difficulty staying on task and have been a bit scatter brained. I was hoping a wiki would be a good way to rein in this scatterbrained and distracted state because it's easy to drop in some info and forget about things until they can be dealt with properly because they're now written down and can be filed away for later.
## How I set up my Tiddlywiki
There were just 4 things I needed to do to get my wiki up and available when/where I want it in a secure fashion. An empty wiki, github pages, and a couple configurations
### Getting your own
TiddlyWiki itself is about as easy as it comes when dealing with installations. Since it's a single html page, all you need to do is go to [this tiddler](https://tiddlywiki.com/#GettingStarted) and click "download empty", then open the file and that's your tiddlywiki!
### Hosting on GitHub Pages
The great thing about this being a simple html page is that it's dead simple to host!. This means [github pages](https://pages.github.com/) is a great place to keep it. Just throw it into your <username>.github.io repo (or another repo with pages set up on it).
### Keep it secret. Keep it safe.
I'd personally rather keep my wiki contents to myself, and there happens to be a [handy tool](https://tiddlywiki.com/static/Encryption.html) already in available that will enable encryption for your html page. Follow those instructions, and instead of loading your wiki on open, you'll be greeted with a password field to decrypt the wiki page.
### Updating a github hosted wiki
Where it gets a little bit more interesting (but still pretty easy) is saving. By default, tiddlywiki saves just give you a link to download the html file that has the changes. If this is stored in a github repo, then this system will be pretty cumbersome. Enter the [GitHub Saver](https://tiddlywiki.com/static/Saving%2520to%2520a%2520Git%2520service.html). Follow those instructions and when you hit your save button, the wiki will directly update the github repo with the new wiki file!
## Alternative setups
I took this encrypted github pages approach because I'm not super concerned if someone downloads it and brute forces the encryption and like the convenience of the github pages hosting (also a trusted host). The [Getting Started](https://tiddlywiki.com/#GettingStarted) page includes a plethora of other options to set up a tiddlywiki, so if this method isn't for you, then one of those might be.

## How it's going
### Pros
I've been thrilled with how TiddlyWiki has been working out. So much so, that I now have both a personal one and a work one. The biggest pros for me have been:
* It has made saving information that doesn't really fit cleanly in specific areas a natural process
* I can find information via multiple routes, a nice feature when storing many different types of data. Options include search, history of most recently opened tiddlers, following links in other tiddlers, and tags
* Has been great for time management, tracking task status, meeting notes, learning notes, and linking everything together
* Accessible anywhere with internet and on multiple devices
### Cons
The only real cons I've come across have been that github seems to be rate limited so sometimes I have to wait to make saves, and saves aren't automatic when using the github saver. This is kind of good too though because the method of saving means multiple instances open could cause old data to overwrite new data. An improvement would be to reload when the github repo gets an update.

## Recommendation
Overall, TiddlyWiki has been a great experience. For my use cases the saving issues haven't really cause me much trouble and I've been significantly more organized. It's very easy to setup, so definitely worth giving it a shot!
