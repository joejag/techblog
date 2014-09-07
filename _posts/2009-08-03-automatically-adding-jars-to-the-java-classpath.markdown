---
layout: post
status: publish
published: true
title: Automatically resolving jars for the Java classpath
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 34
wordpress_url: http://code.joejag.com/?p=34
date: '2009-08-03 12:52:42 +0100'
date_gmt: '2009-08-03 12:52:42 +0100'
categories:
- java
- unix
tags: []
comments:
- id: 8
  author: Bruce
  author_email: b.scharlau@abdn.ac.uk
  author_url: http://www.csd.abdn.ac.uk/~bscharla/
  date: '2009-08-03 14:41:52 +0100'
  date_gmt: '2009-08-03 14:41:52 +0100'
  content: |-
    Joe,

    Don't I just want to use Ant instead of doing this jars in the command line stuff?
- id: 9
  author: Joejag
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-08-03 16:17:43 +0100'
  date_gmt: '2009-08-03 16:17:43 +0100'
  content: "Hey Bruce.  For building your software you definitely want to use Ant
    (or another build tool) like you say.  \n\nBut for clients running your distributed
    software you probably won't bundle the build tool with the application.  So they
    will be using the plain 'java' command via a batch&#47;shell script."
- id: 10
  author: Kevin McDonagh
  author_email: kevin@novoda.com
  author_url: http://www.novoda.com
  date: '2009-08-06 01:12:10 +0100'
  date_gmt: '2009-08-06 01:12:10 +0100'
  content: Yay, a tech blog!
---
<p>When you use the Java classpath (pre java 1.6) you have to manually list each jar on your classpath such as:</p>
<pre class="sh_sh">java -cp lib&#47;database.jar:lib&#47;commons.jar:&#47;lib&#47;log.jar com.joejag.Main</pre></p>
<p>On Java 1.6 a little known feature is that you can now use wildcards, so the above command becomes:</p>
<pre class="sh_sh">java -cp lib&#47;*.jar com.joejag.Main</pre></p>
<p>I still have to use an earlier version of Java for some applications I handle.  To save having to list all the jars manually I use the following bash script which allows you to automatically list all the jars in a directory:</p>
<pre class="sh_sh">java -cp `find lib -name *.jar -exec printf :{} ';'` com.joejag.Main</pre></p>
