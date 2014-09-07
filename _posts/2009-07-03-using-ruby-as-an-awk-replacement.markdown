---
layout: post
status: publish
published: true
title: Using Ruby as an AWK replacement
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 1055
wordpress_url: http://code.joejag.com/?p=3
date: '2009-07-03 18:47:25 +0100'
date_gmt: '2009-07-03 18:47:25 +0100'
categories:
- ruby
- unix
tags: []
comments:
- id: 3
  author: John Gallagher
  author_email: john@synapticmishap.co.uk
  author_url: http://www.synapticmishap.co.uk
  date: '2009-08-21 18:42:08 +0100'
  date_gmt: '2009-08-21 18:42:08 +0100'
  content: Thanks, Joe, that's really interesting. Just another choice in the myriad
    of options we have!
- id: 4
  author: Joejag
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-08-21 19:38:21 +0100'
  date_gmt: '2009-08-21 19:38:21 +0100'
  content: Cheers John.  A colleague at work was bemoaning AWK so I thought this would
    be useful.
- id: 5
  author: mcosta
  author_email: m.costacano@gmail.com
  author_url: ''
  date: '2009-11-29 03:04:05 +0000'
  date_gmt: '2009-11-29 03:04:05 +0000'
  content: |-
    We can name that rawk.

    BTW, I would not expect ruby outperform any tool.
- id: 6
  author: Todd Wei
  author_email: weidagang@gmail.com
  author_url: ''
  date: '2010-01-19 13:54:26 +0000'
  date_gmt: '2010-01-19 13:54:26 +0000'
  content: in fact, perl was invented as a more powerful awk, and ruby inherits a
    lot from perl, so it's not surprising to achieve it with ruby.
- id: 7
  author: Adrian Mowat
  author_email: adrian.mowat@gmail.com
  author_url: https://github.com/mowat27
  date: '2011-08-14 21:29:31 +0100'
  date_gmt: '2011-08-14 21:29:31 +0100'
  content: Joe, I told you the other day I was working on this, but I have published
    a ruby implementation of rawk at https:/&#47;github.com&#47;mowat27&#47;rawk
---
<p>Someone at work asked if you could use Ruby like AWK.&nbsp; I did a little digging and found that you can.</p>
{% highlight bash %}
cat file | ruby -n -a -e 'puts "#{$F[0] $F[1]}"'
{% endhighlight %}
<p>'-n' makes the Ruby iterate over all lines successively assigning them to $_<br />
'-a' makes Ruby split $_ into its parts assigning the result to $F which is an array of strings<br />
'-e' means that what follows is code to be executed.<br />
'-F' specifies the column separator</p>
<p>
I performed a speed comparison on some different size files and operations.  For files under 500kb lines Ruby has comparable performance to AWK.  For anything larger then Ruby (1.8.6) is at best twice as slow.  Though I wouldn't expect a general purpose language to outperform a specialist tool.<br />
</p>
