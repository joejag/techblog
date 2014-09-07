---
layout: post
status: publish
published: true
title: Using Ruby to parse an Excel document
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 45
wordpress_url: http://code.joejag.com/?p=45
date: '2009-08-07 13:12:49 +0100'
date_gmt: '2009-08-07 13:12:49 +0100'
categories:
- ruby
tags: []
comments:
- id: 11
  author: derek
  author_email: dzseymour@gmail.com
  author_url: ''
  date: '2011-09-09 10:32:55 +0100'
  date_gmt: '2011-09-09 10:32:55 +0100'
  content: Thanks for that, I am using Ruby to read an Excel spreadsheet...
---
<p>If you work in the finance domain you are often confronted with data in spreadsheets.  I've used a number of ways to read spreadsheets before like Scriptom (Groovy) or POM (Java).  Ruby comes with a windows specific OLE bridge which allows you to use COM to communicate with a number of different MS applications.  The pickaxe has <a href="http:&#47;&#47;www.rubycentral.com&#47;pickaxe&#47;win32.html">more details<&#47;a>.</p>
<p>Here is a 4 line working example of opening an Excel document, choosing a worksheet then printing the values of a range:</p>
<pre class="sh_ruby">require 'win32ole'<br />
excel = WIN32OLE::new('excel.Application')<br />
sheet = excel.Workbooks.Open('c:excel.xls').Worksheets('worksheet')<br />
sheet.Range('A1:A3').columns.each { |col| col.cells.each { |cell| puts cell['Value'] } }<&#47;pre></p>
