---
layout: post
status: publish
published: true
title: How to get started with Continuous Integration
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 992
wordpress_url: http://code.joejag.com/?p=992
date: '2013-10-13 23:26:09 +0100'
date_gmt: '2013-10-13 22:26:09 +0100'
categories:
- Uncategorized
tags: []
comments: []
---
<p>Recently a friend asked me how they could get started using Continuous Integration (CI). I've written about the theory and practice  behind CI <a href="http:&#47;&#47;code.joejag.com&#47;2009&#47;continuous-integration&#47;">before<&#47;a>.</p>
<p>Here is my checklist for getting your application and team going with CI:</p>
<ol>
<li> Find the main integration branch in your VCS (trunk, master or an integration branch)
<li> Work out how to build the application locally
<li> Automate this build in a single script
<li> Choose and setup your CI software (i.e. Jenkins, TeamCity, TravisCI)
<li> Get the application building on the CI (first get the version control checkout, then use the build script)
<li> Let everyone on your team know where the CI job is
<li> Inform your team about the options for notification of broken builds (email, IDE plugins, desktop notifiers, TV with dashboard)
<li> Encourage everyone to commit at least once a day
<li> Make sure the team know they have to keep the build <span style='color: green'>green<&#47;span><br />
<&#47;ol></p>
<p>If you are looking to use a TV dashboard I highly recommend <a href="http:&#47;&#47;shopify.github.io&#47;dashing&#47;">Dashing<&#47;a>, which is a lovely Metro-like dashboard that runs in your web browser.</p>
