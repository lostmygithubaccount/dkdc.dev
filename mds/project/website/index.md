---
title: "website"
description: "how I built this website"
summary: "see the footer"
date: 2022-12-28
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

Update: see [my first post](/post/im-a-blogger-now) for more details on why I re-created this website.

## what?

A website! Base requirements:

- allow for N categories of content with templates
- comments via GitHub
- dark mode
- RSS feed

## how?
    
Source code: https://github.com/lostmygithubaccount/lostmygithubaccount.github.io.

Static website defined and built by Hugo using the PaperMod theme. Hosted on GitHub Pages as my user page. CI/CD by GitHub Actions. Custom domain used with a CNAME record. Giscus for comments (embedded via Hugo shortcodes, which are cool).

### customization

The footer is customized slightly. The general pattern for customizing a theme is copying its layout over into your own `layouts/` and modifying them as needed.

I initially used a shortcode for adding "Last updated", but this seemed prone to error. Fortunately I found [this post by some random retired judge](https://www.jacksonlucky.net/posts/use-lastmod-with-papermod/) that showed me a better way! I probably could have figured this out on my own, but I'm glad I didn't have to. Little customizations like that can take a lot of time.

## learnings

- GitHub pages are still a bit annoying
- I need to stop restarting from scratch
- I still really dislike front-end development

I'm basically back in the same place as my last website attempt with slightly less custom code and slightly faster build times. I do like the theme a bit better and feel like I have a clearer grasp on the overall tech stack and limitations. 

Hugo is nice compared to mkdocs and the Python families of static website frameworks and themes. Static vs dynamic can still be a blurry line with clever use of GitHub. Go's templating is interesting for other reasons. You probably still need to write a bit of HTML and JavaScript for anything custom, unfortunately. The Hugo shortcuts make this cleaner.

It's incredibly easy to fiddle with front-end elements and GUI considerations for hours without accomplishing anything meaningful.

I didn't get Hugo modules at first, once I realized they were Go modules (and how that'd interact with themes) that made a lot of sense.

Most of the things I think of and lean toward (re)inventing I come to find out already exist as mature OSS on GitHub. Still, some customization or additional work is needed to fit it to my needs.

### future ideas

- comment-based actions (delete comment, delete thread, post content, etc.)
- proper categorization
- automated last-updated-at info
- search

There's a bunch of stuff I could do -- I like having a place I can.

## comments

{{< comments >}}
