---
layout: post
status: publish
published: true
title: 'Continuous Integration: An Introduction'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 54
wordpress_url: http://code.joejag.com/?p=54
date: '2009-08-21 16:48:21 +0100'
date_gmt: '2009-08-21 16:48:21 +0100'
categories:
- process
tags: []
comments: []
---
<p><i>Have you experienced Integration Hell?  Do you find that sometimes broken code gets into the mainline without anyone noticing?</i></p>
<p>These practices can occur frequently.  A way to combat this is to adopt the mindset of Continuous Integration (CI).</p>

<h3>Background</h3>
<p>CI is a development methodology involving daily developer integrations verified by automated builds.  Martin Fowler wrote the original article on CI:</p>
<p><i>"Continuous Integration is a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly" <a href="http://www.martinfowler.com/articles/continuousIntegration.html">martinfowler.com</a></i></p>
<p>The Fowler article highlights that adopting CI represents a sizable shift in the process of building software.  Integration usually happens infrequently, resulting in a small effort today being replaced with a lot of pain later.</p>
<p>CI changes the developer approach by encouraging frequent integration as part of their daily activities. </p>

<h3>Risks of not doing CI</h3>
<ul>
<li>Without CI the team can lack cohesion (incompatible conflicts, different libraries in use, "I thought you fixed that bug 3 months ago!").</li>
<li>Lack of Visibility: Not knowing when a build fails or your code coverage.</li>
<li>Isolation: <a href="http://www.buildsonmymachine.com/">"It works on my machine!"</a>.</li>
<li>Integrating late means fixing bugs late, which is costly.</li>
</ul>

<h3>Benefits of CI</h3>
<ul>
<li>CI allows you to develop software faster, better and cheaper.</li>
<li>Faster: No integration points.  Release builds become a non-event.</li>
<li>Better: Tested early and often.  Consolidated metrics though a CI Server.</li>
<li>Cheaper: Identify defects earlier and fix when least costly.</li>
<li>Easily repeatable testing.</li>
</ul>

<h3>Prerequisites to adopting CI</h3>
<p>In order to take advantage of CI you will need to already have your source code in a repository such as Subversion or Clearcase.  You will also need to have adopted an automated build tool such as make, maven or an equivalent. </p>
<p>The biggest benefit you can get from CI is when you have a suite of automated unit tests.  If you don't have unit tests then you will only have the validation that your code can compile, not that it functions as expected.</p>
<p>CI will not work if you want to use:</p>

<ul>
<li>Nightly Builds.</li>
<li>Developer Branches.</li>
<li>Scheduled Integration.</li>
<li>Building via an IDE.</li>
</ul>

<p>If you can match these prerequisites then you will be able to take advantage of a CI with a CI Server. </p>

<h3>CI Servers</h3>
<p>A CI Server acts as a centralised build machine for your project.  It is possible to practice CI without a CI Server but it isn't advised.  CI Servers give you a web interface that allows you to see the status of your project within different environments.</p>
<p>To get started with a CI server you make a job which knows where your codebase lives.  You then give it a simple script which can be run from the command line.  The CI Server will then continuously poll your source code repository for changes, if it detects a change then it will check out your codebase and run your build tool.  It will then report back the result of the build including if anything has broken. </p>
<p>CI Servers offer different mechanisms for reporting feedback on builds.  A few common options are email, instant messaging, RSS, IDE integration and tray icons.</p>
<p>This feedback gives developers confidence that their changes are working with everyone else's and allows them to continue to develop with that reassurance.  This is especially important when a developer is performing a large refactoring task.</p>

<h3>Rules for CI</h3>
<p>In order to get the most out of CI, there are some rules that you need to follow:</p>

<ul>
<li>Commit early and commit often.</li>
<li>Never commit broken code.</li>
<li>Fix build failures immediately.</li>
<li>Ensure your builds run fast, and fail fast.</li>
<li>Avoid known <a href="http://www.ibm.com/developerworks/java/library/j-ap11297/">CI Anti Patterns</a>.</li>
</ul>

<h3>CI within organizations today</h3>
<p>CI is a development methodology which takes getting used to, but it allows you to develop software faster, better and cheaper.  Teams within organizations are building software in a CI Server as you read this.</p>
<p>While the choice of CI Server differs within organizations, <a href="https://hudson.dev.java.net/">Hudson</a> is getting a lot of support as it is free and has a large community creating extensions.</p>
