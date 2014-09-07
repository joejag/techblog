---
layout: post
status: publish
published: true
title: 'Adding colour to your unix prompt (PS1) and some handy ls aliases '
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 406
wordpress_url: http://code.joejag.com/?p=406
date: '2011-01-12 18:51:06 +0000'
date_gmt: '2011-01-12 18:51:06 +0000'
categories:
- Uncategorized
tags: []
comments: []
---
<p>This is my standard .bashrc that I use on all my boxes with a bash prompt.  It gives you colourful listings when you use 'ls' and some shorthand versions of common 'ls' parameters.</p>
<p>The PS1 is set to just show the username, directory and the command in a brighter colour than the output from commands:</p>

{% highlight bash %}
# ls aliases that use colour
alias la='ls -a --color=auto'
alias lla='ls -la --color=auto'
alias lt='ls -ltr --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias lsh='ls -lSh --color=auto'</p>

# Unix prompt: /user /directory $
PS1='[e[0;32m]u[e[m] [e[1;34m]w[e[m] [e[1;32m]$[e[m] [e[1;37m]'</p>

# start a web server in this directory
alias rshare="ruby -rubygems -e "['thin', 'rack', 'socket'].each {|file| require file };"
" Thin::Server.start(IPSocket.getaddress(Socket.gethostname), 7777) {"
" use Rack::CommonLogger; run Rack::Directory.new(Dir.pwd) }""
{% endhighlight %}
<p>Example in &#47;bin:<br />
<img src="{{ site.url }}/assets/2011/ps1.png" alt="ps1" title="ps1" width="364" height="78" class="alignnone size-full wp-image-410" /></p>
