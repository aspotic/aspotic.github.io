+++
showonlyimage = false
draft = false
title = "Hosting a Static Site with Hugo"
image = "img/post/hugo_static_site_generator.jpg"
cover = "/img/post/hugo_static_site_generator.jpg"
author = "Adam Knox"
avatar = "/img/adam_avatar.jpeg"
date = "2019-09-23T19:41:00+06:00"
weight = 0
categories = ["Software Dev", "Productivity"]
tags = ["hugo","static site generator", "github", "github pages", "web hosting", "blog", "jekyll", "google appengine", "buttercms", "git", "wordpress"]
+++

Dynamic sites are all the rage these days, but static sites have their own advantages. I decided to try out Hugo to generate this one, and this is what I learned.
<!--more-->

## What is Hugo?
[Hugo](https://gohugo.io/) is an open source static site generator. What's a static site generator you ask? It's something that lets you create an easily extensible website (be it changing themes or adding content) without having to deal with any server side scripting.

An example workflow could look like this: 

 1. write article using a markup language like markdown (what I'm using here, but others are supported by Hugo)
 2. run the development server to see what it looks like live while making changes
 3. build the website
 4. commit the all changes to git
 5. for github pages, deploy the new article by adding the build output to the root directory of master and pushing

There are other options out there like [Jekyll](https://jekyllrb.com/), but I found Hugo to be the better fit for my needs and experience.

## Why use a static site generatort?
Static site generators have the big pro of being very easy to host. I've quite liked using [Google Appengine](http://appengine.google.com) in the past because of its freemium model and fee model, but the purpose of this site is to host blog posts which shouldn't require the power and complexity of an Appengine backed site. A static site can easily be hosted on something like [Github Pages](https://pages.github.com/) for next to nothing. Going a route like [Wordpress](https://wordpress.com/) would mean either a monthly fee for a wordpress host, or managing my own backend PHP/MySQL server. The final option I've looked into is a headless CMS, In my case [ButterCMS](https://buttercms.com/) (though there are a plethora out there). This could be something to look into in the future since it technically could interact nicely with static site generator for things like comments that can't be generated statically.

## How I set up Hugo
As I have alluded to, I decided to use Github pages for hosting my content. There are a number of different ways to combine Hugo/Github/Github-Pages, but what ultimately has worked best for me so far is to:

 1. Create a Github Pages repo. Create a regular repo, but give it the name `<username>.githube.io`. Now when you browse to the web address `<username>.github.io`, you'll be served with the  contents of that repo.
 2. Create the folder `_source` in the root directory of the repo `<username>.github.io`. Prepending an underscore means github pages will not serve the file/directory.
 3. Create a [Hugo project](https://gohugo.io/getting-started/quick-start/) inside this `_source` folder
 4. Open `_source/config.toml` and set this value: `publishDir = ".."`
 
 Now when you run the command `hugo` from inside `_source`, it will build the website and place it inside the root of the repo, and since the source is in a folder prependend with an underscore, only the generated site will be visible on a push of master to github

