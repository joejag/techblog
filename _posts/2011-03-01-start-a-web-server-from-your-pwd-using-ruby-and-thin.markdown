---
layout: post
status: publish
published: true
title: Start a web server from your pwd using Ruby and Thin
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 521
wordpress_url: http://code.joejag.com/?p=521
date: '2011-03-01 13:06:07 +0000'
date_gmt: '2011-03-01 13:06:07 +0000'
categories:
- ruby
- unix
tags: []
comments: []
---
<p>Occasionally I'm interested in grabbing files from a directory on a remote host.  This could be for another process to consume or to look at on my local work station.</p>
<p>The standard way of doing this is using scp, ftp or a file share.  I prefer to start a short-lived web server that shares the file system.  </p>
<p>To make this simple I use a ruby script to allow me to start a webserver from the directory I'm currently in.</p>
<pre class="sh_ruby">
['rubygems', 'thin', 'rack', 'socket'].each {|file| require file }<br />
Thin::Server.start(IPSocket.getaddress(Socket.gethostname), 7777) do<br />
  use Rack::CommonLogger<br />
  run Rack::Directory.new(Dir.pwd)<br />
end<br />
</pre></p>
<p>As an alias for ~&#47;.bashrc it looks like this:</p>
<pre class="sh_sh">
alias rshare="ruby -rubygems -e "['thin', 'rack', 'socket'].each {|file| require file };"<br />
" Thin::Server.start(IPSocket.getaddress(Socket.gethostname), 7777) {"<br />
" use Rack::CommonLogger; run Rack::Directory.new(Dir.pwd) }""<br />
</pre></p>
<p>This allows you to go to port 7777 on the host and retrieve the files you're interested in.</p>
<pre class="sh_sh">
@joejag &#47;tmp $ rshare<br />
>> Thin web server (v1.2.7 codename No Hup)<br />
>> Maximum connections set to 1024<br />
>> Listening on 10.0.0.2:7777, CTRL+C to stop<br />
10.0.0.8 - - [01&#47;Mar&#47;2011 07:45:15] "GET &#47; HTTP&#47;1.1" 200 2153 0.0038<br />
</pre></p>
<p>You will need to have the 'thin' and 'rack' gems installed to do this.</p>
