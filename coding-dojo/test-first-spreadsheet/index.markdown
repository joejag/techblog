---
layout: page
status: publish
published: true
title: 'Coding Dojo: Test First Spreadsheet'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 219
wordpress_url: http://code.joejag.com/?page_id=219
date: '2009-09-07 12:42:15 +0100'
date_gmt: '2009-09-07 12:42:15 +0100'
categories: []
tags: []
comments: []
---
<h1>Test First Spreadsheet</h1>

<p>During this dojo we will be implementing a Spreadsheet from scratch.  We will start with the formula engine and write a GUI if there is time.</p>

<h2>Specification</h2>
<p>You are given a set of existing tests that have no current implementation.  You will need to work your way through the tests implementing the expected functionality.</p>

<ul>
<li>Implement each test before going onto the next one</li>
<li>Split tests if you want to</li>
<li>Refactor between passing tests if needed</li>
<li>You can make up additional intermediate test cases to drive your code</li>
<li>You can complete the tests in a different order if it makes sense</li>
</ul>

<p>Starting codebase: <a href="{{ site.url }}/assets/spreadsheet_dojo.zip">spreadsheet_dojo.zip</a></p>

<h2>Background Reading</h2>
<p>You may find the following links helpful for parsing formulas:</p>
<p><a href="http:&#47;&#47;en.wikipedia.org&#47;wiki&#47;Reverse_Polish_notation" rel="nofollow">Wikipedia: Reverse Polish Notation</a><br />
<a href="http:&#47;&#47;en.wikipedia.org&#47;wiki&#47;Shunting-yard_algorithm" rel="nofollow">Wikipedia: Shunting Yard Algorithm</a></p>
<p>Googling <a href="http:&#47;&#47;www.google.com&#47;search?q=Operator+Precedence" rel="nofollow">operator precedence</a> or <a href="http:&#47;&#47;www.google.com&#47;search?q=recursive+descent" rel="nofollow">recursive descent</a> will give you an idea of an established way of parsing formulas.</p>
