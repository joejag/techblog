---
layout: page
status: publish
published: true
title: 'Coding Dojo: Converting between different numeral systems'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 212
wordpress_url: http://code.joejag.com/?page_id=212
date: '2009-09-07 12:35:48 +0100'
date_gmt: '2009-09-07 12:35:48 +0100'
categories: []
tags: []
comments:
- id: 2
  author: Scot Alt.Net Blogs &raquo; Coding Dojo, The results
  author_email: ''
  author_url: http://scotalt.net/blog/2009/10/02/coding-dojo-result/
  date: '2009-10-02 22:41:50 +0100'
  date_gmt: '2009-10-02 22:41:50 +0100'
  content: '[...] Last Thursday (1st of October 2009) Joe Wright was kind enough to
    take one of his coding dojo on Converting Numeral Systems. [...]'
---
<h1>Converting numeral systems</h1>

<p>During this session we will explore converting between different numeral systems. The numeral system we commonly use in the West (1,2,3 etc) is called Western Arabic. Although it's actually Hindu (Arabic traders brought it to Europe via India), we will refer to it as Arabic. In central Europe this eventually replaced a simplistic system called Urnfield.</p>

<h2>Specification</h2>
<p>We require a program that will convert between 3 different numeral systems; Arabic, Roman, Urnfield.</p>
<p>The following ranges are required:</p>
<ul>
<li>Roman: 1..3499</li>
<li>Urnfield: 1..29</li>
</ul>

<h3>Roman</h3>
<p>Roman numerals are based on seven symbols which can be combined to represent numbers.</p>
<table>
<tr>
<th>Roman Symbol</th>
<th>Arabic Value</th></tr>
<tr>
<td>I</td>
<td>1</td></tr>
<tr>
<td>V</td>
<td>5</td></tr>
<tr>
<td>X</td>
<td>10</td></tr>
<tr>
<td>L</td>
<td>50</td></tr>
<tr>
<td>C</td>
<td>100</td></tr>
<tr>
<td>D</td>
<td>500</td></tr>
<tr>
<td>M</td>
<td>1000</td></tr>
</table>
<p>Generally, Roman numerals are written in descending order from left to right, and are added sequentially, for example MMVI (2006) is interpreted as 1000 + 1000 + 5 + 1.</p>

<h3>Urnfield</h3>
<p>Urnfield is a simplistic numeral system used around 1200 BC in central Europe. It uses only 2 characters which are both slashes.</p>
<table>
<tr>
<th>Urnfield Symbol</th>
<th>Arabic Value</th></tr>
<tr>
<td>/</td>
<td>1</td></tr>
<tr>
<td>\</td>
<td>5</td></tr>
</table>
<p>Each forward slash represents 1 and appears first, there is at most 4. After that downward slashes each represent 5. For example //\\\ (17) is interpreted as 1 + 1 + 5 + 5 + 5.</p>

<h2>Example input and output</h2>

{% highlight bash %}
Example 1: Arabic -> Urnfield  for 1..10
1, 2, 3, 4, 5, 6, 7, 8, 9, 10
-> /, //, ///, ////, \, /\, //\, ///\, ////\, \\

Example 2: Arabic -> Urnfield for 10..29
11, 12, 15, 20, 21, 28, 29
-> /\\, //\\, \\\, \\\\, /\\\\, ///\\\\\, ////\\\\\

Example 3: Arabic -> Roman for 1..10
1, 2, 3, 4, 5, 6, 7, 8, 9, 10
-> I, II, III, IV, V, VI, VII, VIII, IX, X

Example 4: Arabic -> Roman for 10..100
11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 25, 40, 50, 69, 99, 100
-> XI, XII, XIII, XIV, XV, XVI, XVII, XVIII, XIX, XX, XXV, XL, L, LXIX, XCIX, C

Example 5: Arabic -> Roman for 101..3499
101, 150, 200, 400, 500, 666, 1000, 1444, 1666, 1999, 2000, 2009, 3000, 3499
-> CI, CL, CC, CD, D, DCLXVI, M, MCDXLIV, MDCLXVI, MCMXCIX, MM, MMIX, MMM,
       MMMCDXCIX

Example 6: Roman -> Arabic (reverse examples 1..2)

Example 7: Urnfield -> Arabic (reverse examples 3..5)

Examples 8: Roman -> Urnfield
I, II, III, IV, V, VI, VII, VIII, IX, X, XXIX
-> /, //, ///, ////, \, /\, //\, ///\, ////\, \\, ////\\\\\
{% endhighlight %}
