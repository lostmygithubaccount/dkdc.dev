---
title: "website"
description: "how I built this website"
summary: "see the footer"
date: 2022-12-28T16:39:40-08:00
showToc: true
searchHidden: false
showReadingTime: true
showShareButtons: false
draft: false
---

## why?

Having a website is cool. Hosting it on a custom domain name is cooler.

I want to use this website to:

- motivate myself to learn new things
- improve my writing (and reading) skills
- share my thoughts and ideas publicly on interesting technology topics

## what?

A website! Base requirements:

- allow for N categories of content with templates
- comments via GitHub
- dark mode
- RSS feed

Future ideas:

- comment-based actions (delete comment, delete thread, post content, etc.)
- proper categorization
- automated last-updated-at info
- search

There's a bunch of stuff I could do -- I like having a place I can.

## how?
    
Source code: https://github.com/lostmygithubaccount/lostmygithubaccount.github.io.

Static website defined and built by Hugo using the PaperMod theme. Hosted on GitHub Pages as my user page. CI/CD by GitHub Actions. Custom domain used with a CNAME record. Giscus for comments (embedded via Hugo shortcodes, which are cool).

## learnings

- GitHub pages are still a bit annoying
- I need to stop restarting from scratch
- I still really dislike front-end development

I'm basically back in the same place as my last website attempt with slightly less custom code and slightly faster build times. I do like the theme a bit better and feel like I have a clearer grasp on the overall tech stack and limitations. 

Hugo is nice compared to mkdocs and the Python families of static website frameworks and themes. Static vs dynamic can still be a blurry line with clever use of GitHub. Go's templating is interesting for other reasons. You probably still need to write a bit of HTML and JavaScript for anything custom, unfortunately. The Hugo shortcuts make this cleaner.

It's incredibly easy to fiddle with front-end elements and GUI considerations for hours without accomplishing anything meaningful.

I didn't get Hugo modules at first, once I realized they were Go modules (and how that'd interact with themes) that made a lot of sense.

Most of the things I think of and lean toward (re)inventing I come to find out already exist as mature OSS on GitHub. Still, some customization or additional work is needed to fit it to my needs.

## comments

{{< comments >}}
