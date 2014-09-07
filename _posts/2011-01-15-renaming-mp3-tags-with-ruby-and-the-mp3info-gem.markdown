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
<p>There's a ruby gem which let's you easily edit id3 tags called '<a href="http:&#47;&#47;ruby-mp3info.rubyforge.org&#47;">mp3info<&#47;a>'.</p>
<p>Here is a script to get you started:</p>
<pre class="sh_ruby">
require "mp3info"</p>
<p>dir = '&#47;opt&#47;music&#47;album_name&#47;'<br />
Dir.entries(dir).each do |file|<br />
   next if file !~ &#47;.mp3$&#47; # skip files not ending with .mp3<br />
   Mp3Info.open(dir + file) do |mp3|<br />
      puts mp3.tag.title<br />
      puts mp3.tag.artist<br />
      puts mp3.tag.album<br />
      puts mp3.tag.tracknum</p>
<p>      # You would perform your text transform here, here's a simple change instead<br />
      mp3.tag.title = mp3.tag.title + ' with my change'<br />
      mp3.tag.artist = mp3.tag.artist + ' with my change'<br />
   end<br />
end<br />
<&#47;pre></p>
