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
<h1>Converting numeral systems<&#47;h1></p>
<p>During this session we will explore converting between different numeral systems. The numeral system we commonly use in the West (1,2,3 etc) is called Western Arabic. Although it's actually Hindu (Arabic traders brought it to Europe via India), we will refer to it as Arabic. In central Europe this eventually replaced a simplistic system called Urnfield.</p>
<h2>Specification<&#47;h2></p>
<p>We require a program that will convert between 3 different numeral systems; Arabic, Roman, Urnfield.</p>
<p>The following ranges are required:</p>
<ul>
<li>Roman: 1..3499
<li>Urnfield: 1..29<br />
<&#47;ul></p>
<h3>Roman<&#47;h3></p>
<p>Roman numerals are based on seven symbols which can be combined to represent numbers.</p>
<table>
<tr>
<th>Roman Symbol<&#47;th>
<th>Arabic Value<&#47;th><&#47;tr></p>
<tr>
<td>I<&#47;td>
<td>1<&#47;td><&#47;tr></p>
<tr>
<td>V<&#47;td>
<td>5<&#47;td><&#47;tr></p>
<tr>
<td>X<&#47;td>
<td>10<&#47;td><&#47;tr></p>
<tr>
<td>L<&#47;td>
<td>50<&#47;td><&#47;tr></p>
<tr>
<td>C<&#47;td>
<td>100<&#47;td><&#47;tr></p>
<tr>
<td>D<&#47;td>
<td>500<&#47;td><&#47;tr></p>
<tr>
<td>M<&#47;td>
<td>1000<&#47;td><&#47;tr><br />
<&#47;table></p>
<p>Generally, Roman numerals are written in descending order from left to right, and are added sequentially, for example MMVI (2006) is interpreted as 1000 + 1000 + 5 + 1.</p>
<h3>Urnfield<&#47;h3></p>
<p>Urnfield is a simplistic numeral system used around 1200 BC in central Europe. It uses only 2 characters which are both slashes.</p>
<table>
<tr>
<th>Urnfield Symbol<&#47;th>
<th>Arabic Value<&#47;th><&#47;tr></p>
<tr>
<td>&#47;<&#47;td>
<td>1<&#47;td><&#47;tr></p>
<tr>
<td><&#47;td>
<td>5<&#47;td><&#47;tr><br />
<&#47;table></p>
<p>Each forward slash represents 1 and appears first, there is at most 4. After that downward slashes each represent 5. For example &#47;&#47;\ (17) is interpreted as 1 + 1 + 5 + 5 + 5.</p>
<h2>Example input and output<&#47;h2></p>
<pre class="sh_ruby">
Example 1: Arabic -> Urnfield  for 1..10<br />
1, 2, 3, 4, 5, 6, 7, 8, 9, 10<br />
-> &#47;, &#47;&#47;, &#47;&#47;&#47;, &#47;&#47;&#47;&#47;, , &#47;, &#47;&#47;, &#47;&#47;&#47;, &#47;&#47;&#47;&#47;, \</p>
<p>Example 2: Arabic -> Urnfield for 10..29<br />
11, 12, 15, 20, 21, 28, 29<br />
-> &#47;\, &#47;&#47;\, \, \\, &#47;\\, &#47;&#47;&#47;\\, &#47;&#47;&#47;&#47;\\</p>
<p>Example 3: Arabic -> Roman for 1..10<br />
1, 2, 3, 4, 5, 6, 7, 8, 9, 10<br />
-> I, II, III, IV, V, VI, VII, VIII, IX, X</p>
<p>Example 4: Arabic -> Roman for 10..100<br />
11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 25, 40, 50, 69, 99, 100<br />
-> XI, XII, XIII, XIV, XV, XVI, XVII, XVIII, XIX, XX, XXV, XL, L, LXIX, XCIX, C</p>
<p>Example 5: Arabic -> Roman for 101..3499<br />
101, 150, 200, 400, 500, 666, 1000, 1444, 1666, 1999, 2000, 2009, 3000, 3499<br />
-> CI, CL, CC, CD, D, DCLXVI, M, MCDXLIV, MDCLXVI, MCMXCIX, MM, MMIX, MMM,<br />
       MMMCDXCIX</p>
<p>Example 6: Roman -> Arabic (reverse examples 1..2)</p>
<p>Example 7: Urnfield -> Arabic (reverse examples 3..5)</p>
<p>Examples 8: Roman -> Urnfield<br />
I, II, III, IV, V, VI, VII, VIII, IX, X, XXIX<br />
-> &#47;, &#47;&#47;, &#47;&#47;&#47;, &#47;&#47;&#47;&#47;, , &#47;, &#47;&#47;, &#47;&#47;&#47;, &#47;&#47;&#47;&#47;, \, &#47;&#47;&#47;&#47;\\<br />
<&#47;pre></p>
