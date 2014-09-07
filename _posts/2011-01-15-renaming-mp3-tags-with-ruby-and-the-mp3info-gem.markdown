---
layout: post
status: publish
published: true
title: Renaming MP3 tags with Ruby and the mp3info gem
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 419
wordpress_url: http://code.joejag.com/?p=419
date: '2011-01-15 22:14:06 +0000'
date_gmt: '2011-01-15 22:14:06 +0000'
categories:
- Uncategorized
tags: []
comments: []
---
<p>Occasionally you get MP3s which have unconventional tags.  I usually get this problem with compilation albums and it's a bit dull to rename them in iTunes.</p>
<p>There's a ruby gem which let's you easily edit id3 tags called '<a href="http:&#47;&#47;ruby-mp3info.rubyforge.org&#47;">mp3info</a>'.</p>
<p>Here is a script to get you started:</p>

{% highlight ruby %}
require "mp3info"

dir = '/opt/music/album_name/'
Dir.entries(dir).each do |file|
   next if file !~ /.mp3$/ # skip files not ending with .mp3
   Mp3Info.open(dir + file) do |mp3|
      puts mp3.tag.title
      puts mp3.tag.artist
      puts mp3.tag.album
      puts mp3.tag.tracknum

      # You would perform your text transform here, here's a simple change instead
      mp3.tag.title = mp3.tag.title + ' with my change'
      mp3.tag.artist = mp3.tag.artist + ' with my change'
   end
end
{% endhighlight %}
