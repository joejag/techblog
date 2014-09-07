---
layout: post
status: publish
published: true
title: Everyday Git Aliases
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 903
wordpress_url: http://code.joejag.com/?p=903
date: '2013-04-01 10:12:18 +0100'
date_gmt: '2013-04-01 10:12:18 +0100'
categories:
- Uncategorized
tags: []
comments:
- id: 160
  author: Jonathan Knapp
  author_email: jon@coffeeandcode.com
  author_url: http://coffeeandcode.com
  date: '2013-04-07 22:02:12 +0100'
  date_gmt: '2013-04-07 21:02:12 +0100'
  content: |-
    I've updated your "standup" alias a bit so you don't have to hardcode your name or email.

        standup = "!git log --since yesterday --author `git config user.email` --pretty=short"
- id: 161
  author: Leandros
  author_email: dev@arvid-g.de
  author_url: http://arvid-gerstmann.de
  date: '2013-04-07 22:29:30 +0100'
  date_gmt: '2013-04-07 21:29:30 +0100'
  content: "My favorite git alias? Hmm. \n\nyolo = 'git add -A &amp;&amp; git commit
    -am \"#YOLO\" &amp;&amp; git push origin master'\n\n:D\n\nThough, I never used
    it, but it's funny."
- id: 162
  author: lahwran
  author_email: lahwran0@gmail.com
  author_url: ''
  date: '2013-04-07 23:07:10 +0100'
  date_gmt: '2013-04-07 22:07:10 +0100'
  content: |-
    based on http://stackoverflow.com/questions/466764/show-ignored-files-in-git I have this aliased:

    ignored = ls-files --others -i --exclude-standard

    so you can simply say "git ignored" and see a listing of all files that are being ignored!
- id: 163
  author: Tod
  author_email: nope@mailinator.com
  author_url: ''
  date: '2013-04-07 23:21:37 +0100'
  date_gmt: '2013-04-07 22:21:37 +0100'
  content: |-
    # Oh screw all that, start over.
    wipe = reset --hard HEAD
- id: 164
  author: Ricardo
  author_email: ricardobeat@gmail.com
  author_url: ''
  date: '2013-04-08 03:48:42 +0100'
  date_gmt: '2013-04-08 02:48:42 +0100'
  content: |-
    Remember that a pull --rebase does not preserve merge commits, so if you have merged a branch into your working one, you have to `git fetch &amp;&amp; git rebase -p`.

    I use `git up` for that (https://github.com/aanand/git-up), wish it didn't depend on Ruby but works fine.
- id: 165
  author: Alex
  author_email: alexsmith@gmail.com
  author_url: ''
  date: '2013-04-09 10:49:26 +0100'
  date_gmt: '2013-04-09 09:49:26 +0100'
  content: "praise = blame \n\nSo you can praise your colleagues for that wonderful
    and glorious code they are producing. They always do, don't they?"
- id: 166
  author: Alexander
  author_email: alexander@dietrich.cx
  author_url: ''
  date: '2013-04-24 11:45:13 +0100'
  date_gmt: '2013-04-24 10:45:13 +0100'
  content: I like the "git standup" alias. But on Mondays it should switch to "what
    the hell did I do on Friday again?". :)
---

<p>Git gives you as much flexibility in how you construct your VCS workflow as it does for the commands you use on your local repo. In your gitconfig file you can add alises for your favourite commands, in this article I'll talk about mine. You can see my gitconfig on <a href="https://github.com/joejag/dotfiles/blob/master/git/gitconfig">github</a>.</p>

<h3>git standup</h3>
<em>alias for git log &ndash;&ndash;since yesterday &ndash;&ndash;author joe</em></p>
<p>Just about to head to a standup but you can't remember everything that you did yesterday? This command will come to your rescue. It only lists what you did in the last 24 hours.</p>

{% highlight bash %}
3400455 - fixed the whizzbang (Mon, 1 Apr 2013 13:57:37 +0100) <Joe Wright>
5dae0a0 - whizzbang feature (Mon, 1 Apr 2013 13:57:32 +0100) <Joe Wright>
{% endhighlight %}

<h3>git purr</h3>
<p><em>alias for git pull &ndash;&ndash;rebase</em></p>
<p>In Git you have public and private branches, public branches are the ones on github (or your own git host), private branches are in your local git repo and are setup to be tracking or topic. A tracking branch is linked to a public branch and a topic is only in your local git repo.</p>
<p>You have two options when you want to integrate changes between branches, either you <strong>merge</strong> or <strong>rebase</strong>. By default when you do a <strong>pull</strong> on a tracked branch it performs a <strong>fetch</strong> then a <strong>merge</strong>. If you've made changes locally and someone else has pushed changes to your git host then git will automatically merge these together with a merge commit.</p>

{% highlight bash %}
4ffe733 - Merge branch 'development' of github.com:YourCompany/project into master
{% endhighlight %}

<p>On an active project with other colleagues using <strong>pull</strong> will generate a load of these noisy commits in your projects history. I only like merge commits to be in the history when a topic branch has been reintegrated. Tracking branches should have a linear history.</p>
<p>When you do a <strong>git pull &ndash;&ndash;rebase</strong>, git fetches the changes from your remote repo and then perform a rebase rather than the default merge. A rebase resets the HEAD of your local branch to be the same as the remote HEAD, then replays your local commits back into repo. This means you don't get any noisy merge messages in your history. As well as giving a linear history, this also helps when using <strong>bisect</strong>.</p>

<h3>git st</h3>
<em>alias for git status -sb</em></p>
<p>Git gives a verbose output when you perform a <strong>status</strong> which is excellent when you are getting started with git. As you become used to the output you want a shorter version. The output of this alias shows a single letter that represents the change type and reports how far ahead of the remote branch you are.</p>
{% highlight bash %}
## master...origin/master [ahead 2]
A  g
D  gitignore
{% endhighlight %}

<h3>git ready</h3>
<em>alias for git rebase -i @{u}</em></p>
<p>Once you've committed a few local changes you'll want to share them with your team by pushing to your git host. Before I push I always run the <strong>git ready</strong> alias to see what's going to be pushed so I can reword commit messages and squash related commits together. <strong>git ready</strong> performs an interactive rebase on your unpushed commits.</p>
<p>Let's say I've pushed two commits that are related to a new feature and I have another where I made a spelling mistake in the commit message. When I run <strong>git ready</strong> I get dropped into vim with this input.</p>

{% highlight bash %}
pick 7f06d36 whizzbang feature - adding fizzbuzz
pick ad544d0 whizzbang feature - minor refactoring to fizzbuzz
pick de3083a spelling mizzztake
{% endhighlight %}
<p>I want to squash the two whizzbang feature commits together. So I change <strong>pick</strong> to say <strong>s</strong> to squash the two together into a single commit. I also want to reword the commit with the spelling mistake. To do this I make the file look like:</p>
{% highlight bash %}
pick 7f06d36 whizzbang feature - adding fizzbuzz
s ad544d0 whizzbang feature - minor refactoring to fizzbuzz
r de3083a spelling mizzztake<br />
{% endhighlight %}
<p>This gives me two new commit messages to edit, which I update. Now when I push the remote repo host receives two commits</p>
{% highlight bash %}
3400455 - spelling mistake
5dae0a0 - whizzbang feature
{% endhighlight %}

<h3>git lg</h3>
<em>alias for git log &ndash;&ndash;pretty=format:'%Cred%h%Creset -%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'</em></p>
<p>When I'm viewing history I just want to see the SHA, the commit message, who made the commit and how long ago. This custom log output gives me:</p>
{% highlight bash %}
3400455 - spelling mistake (20 minutes ago) <Joe Wright>
5dae0a0 - whizzbang feature (28 minutes ago) <Joe Wright>
efaea80 - Removing trailing space on save (4 days ago) <Another Person>
c351700 - Copying to system clipboard in vim (5 days ago) <Joe Wright>
{% endhighlight %}
<p>I'd be interested to hear about your favourite git aliases too.</p>
