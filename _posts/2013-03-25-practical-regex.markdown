---
layout: post
status: publish
published: true
title: An example driven guide to regular expressions
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 897
wordpress_url: http://code.joejag.com/?p=897
date: '2013-03-25 15:42:38 +0000'
date_gmt: '2013-03-25 15:42:38 +0000'
categories:
- Uncategorized
tags: []
comments:
- id: 158
  author: Zen.Master
  author_email: codingninja.co.uk@gmail.com
  author_url: http://www.codingninja.co.uk/
  date: '2013-04-12 12:45:47 +0100'
  date_gmt: '2013-04-12 11:45:47 +0100'
  content: "Good guide Joe. \n\nThe xkcd comic \"stand back I know regex!\"\n\nhttps:&#47;&#47;xkcd.com&#47;208&#47;"
- id: 159
  author: Rashad
  author_email: reecerobert2976@spambog.com
  author_url: http://neutroncitycomix.com/author/hotelrzeszow
  date: '2014-02-20 21:39:17 +0000'
  date_gmt: '2014-02-20 20:39:17 +0000'
  content: 'You can tell James Franco, Mila Kunis, Michelle Williams, and Rachel Weisz
    all respected Sam Raimi''s vision and wanted to do their best to make "Oz: The
    Great and Powerful" a visual experience no one would forget. The good news is
    that following a few choice steps can allow men to really experience joy at their
    fingertips, and while it might never replace the sensations available through
    intimacy with a partner, it might be more fun than anything a man hoped to experience
    during his furtive youth. More recent studies have shown that the death toll may
    have been closer to 12,000 people.'
---
<h3>The problem</h3>
<p>You have a string of text that needs to be checked to see if it fits a validation pattern or to extract information from it. </p>
<p>In the case of validation you might want to know if a given input is a valid currency amount like &pound;100, so you can prompt the user to enter a valid amount before you process a transaction.</p>
<p>For parsing you might want to get the version of a users web browser given from a User Agent string like these:</p>
<pre>
Mozilla&#47;5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit&#47;537.22 (KHTML, like Gecko) Chrome&#47;25.0.1364.172 Safari&#47;537.22
Mozilla&#47;5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko&#47;20100101 Firefox&#47;5.0
Mozilla&#47;4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident&#47;4.0
</pre>
<p>To solve both problems we either need to either split the text and manually check for conditions in our code or we can use a regular expression.</p>

<h3>What is a regular expression?</h3>
<p>Regular expressions are a DSL which consist of two parts, a <strong>target string</strong> and the <strong>regular expression</strong> itself. The regular expression part is kind of like the patterns you use to search for files with wildcards. They look very scary at first but you only need to know a few rules to get the most out of them.</p>
<p>Given a target string of <em>'Mississippi'</em> and a regular expression of <strong>&#47;s&#47;</strong> we would get a match back as the target string contains at least one 's'. Though this is a quite simple example, usually they use a number of regular expression features like: <strong>&#47;^dw[uiop](in|vi)[^a-f]*$&#47;</strong> which matches <em>'driving'</em>.</p>

<h3>How does it work?</h3>
<p>A regular expression is made up of <strong>literal characters</strong>, <strong>metacharacters</strong> and <strong>escape sequences</strong>. </p>
<p>A <strong>literal</strong> is like in the Mississippi example above, the <strong>&#47;m&#47;</strong> literally means this contains an 'm' anywhere in the target string. </p>
<p>A <strong>metacharacter</strong> is used within a regular expression for special characters that don't have a literal meaning, for example a caret sign indicates this regular expression must match from the start of the line. Meaning <strong>&#47;^s&#47;</strong> would no longer match Mississippi but <strong>&#47;^m&#47;</strong> would.</p>
<p>Finally, an <strong>escape sequence</strong> is used to convert a metacharacter into a literal for when the need arrises. For example the dollar sign '$' has a special meaning so to literally search for it we'd escape it by putting a slash at the front like <strong>&#47;$&#47;</strong>. </p>

<h4>Capture groups</h4>
<p>The first metacharacter we'll get to know properly is the capture group, as this is what allows you to extract a substring of text from a target string. </p>
<p>Let's say we wanted to find the version of the IE web browser a visitor was using which has a target string of <em>'Mozilla&#47;4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident&#47;4.0'</em>. In here we are looking for the <em>'8.0'</em> following the MSIE. A simple way to achieve this would be to do <strong>&#47;MSIE (8.0)&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;yNFui6IklJ">See this in action</a></p>

<h4>Boolean 'or'</h4>
<p>If you wanted to search for one string or an alternative. You could do this with a pipe sign allowing you to match two different versions of IE: <strong>&#47;MSIE (8.0|9.0)&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;yNFui6IklJ">See this in action</a></p>

<h4>Matching any single character</h4>
<p>Searching for just 8.0 or 9.0 is quite limiting though, so let's use the dot '.' metacharcter to search for any version number with a length of three characters with <strong>&#47;MSIE (...)&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;I3SILqtd7P">See this in action</a></p>

<h4>Iteration metacharacters</h4>
<p>Matching on exactly three characters using the dot is working well for us here, but we know IE 10.0 is coming soon and many later versions after that. What we want is a variable amount of matching characters. To do this regular expressions allow us to put an iteration metacharacter right after a literal or other metacharacter to say how many times we'd like it to match.</p>
<p>Regular expressions give us curly brackets to do this. Say we expect exactly three occurrences of the previous pattern we could do: <strong>&#47;MSIE (.{3})&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;8wgZVpfry6">See this in action</a></p>
<p>The curly brackets also allow us to use a range to match a minimum or maximum amount using <strong>&#47;MSIE (.{3,4});&#47;</strong>. In this example we've added the literal semi-colon to indicate the end of the version in the target string.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;Kp6KJfi5TM">See this in action</a></p>
<p>In we wanted to future proof to even larger version numbers of IE we could leave the second value blank: <strong>&#47;MSIE (.{3,});&#47;</strong>.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;91WJ05oMJb">See this in action</a></p>
<p>The regular expression creators realised this is quite a common task, so they made metacharacters to support the common ranges:</p>
<ul>
<li>? : Zero or one {0,1}</li>
<li>+ : 1 or more {1,}</li>
<li>* : Zero or more {0,}</li>
</ul>
<p>The question mark is particularly useful when dealing with pluralization. So you could match a target string of 'game' or 'games' with <strong>&#47;games?&#47;</strong>.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;EmN0WWbkhc">See this in action</a></p>

<h4>Positioning</h4>
<p>We've been looking for regular expressions that occur anywhere within a string so far. When you want your expression to match an entire line you use the $ and ^ signs. ^ means from the start of the line and $ means from the end of the line. This prevents your expression matching characters you don't want it to.</p>
<p>For example <strong>&#47;^brown fox$&#47;</strong> matches 'brown fox' but not 'brown fox jumps away'.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;SNItDaTIFR">See this in action</a></p>

<h4>Character classes</h4>
<p>Up to now we've searched for literal matches or used the dot wildcard. Sometimes you want to search for a string that matches a list of possibilites. Square brackets allow you to do this <strong>&#47;[01234556789]&#47;</strong>.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;pYrfgL5QM0">See this in action</a></p>
<p>Within a range the hypen, '-', becomes a metacharacter that allows you to specify a range. So the previous example can become <strong>&#47;[0-9]&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;KE3uuhCpWD">See this in action</a></p>
<p>As well as numbers you can do the same with letters with <strong>&#47;[A-Z]&#47;</strong> for uppercase letters and <strong>&#47;[a-z]&#47;</strong> for lower case.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;sStpeDTk80">See this in action</a></p>
<p>These ranges can be combined to search for alpha numeric characters with <strong>&#47;[A-Za-z0-9]+&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;SRMtxCIypf">See this in action</a></p>
<p>Finally, you can invert the selection by placing a caret at the start of the range to search for the opposite <strong>&#47;[^0-9]&#47;</strong></p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;Hje64BNc3n">See this in action</a></p>

<h4>Shorthand character classes</h4>
<p>Just like with the range shorthands, the regular expression creators realised that character classes are a common occurance as well. To help with this they added some shorthand versions of popular tasks:</p>
<ul>
<li>d : digits [0-9]</li>
<li>w : alpha numeric search for [0-9A-Za-z]</li>
<li>s : searches for spaces, tabs, and other whitespace</li>
</ul>
<p>All of these letters can be made upper case to search for the opposite, just like the caret did previously with ranges. So <strong>D</strong> means not a number.</p>

<h4>Capture groups extended</h4>
<p>If you don't want to capture the contents of a group you can put a question mark and a colon at the start of the group. This is useful when you need to use groups but don't care what their contents are. For example <strong>&#47;the cost of the (?:grey|gray) sofa is &pound;(d+)&#47;</strong> will handle the different spellings of the colour grey, but only capture the price.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;Gd6XMuWURl">See this in action</a></p>
<p>If you'd like to add text into the capture group to make it readable, called a <strong>named group</strong>, you can use angle brackets within the group. For example to extract a date naming each part you could use <strong>&#47;(?&lt;month>d{1,2})&#47;(?&lt;day>d{1,2})&#47;(?&lt;year>d{4})&#47;</strong> on the target string 'Today's date is: 10&#47;23&#47;2012' to get 'month 10, day 23, year 2012'</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;xfQHocREGj">See this in action</a></p>
<p>You can also reuse a capture group using <strong>1</strong> to search for the same pattern again, this is called a <strong>backreference</strong>. For example with html tags you'd want to make sure that the closing tag matches exactly the same element name as the opening tag with <strong>&#47;<(em|strong)>.*</(1)>&#47;</strong> which makes sure a </strong> or </em> matches it's opening tag.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;uGYC5JJjhZ">See this in action</a></p>

<h4>&#47;^dw[uiop](in|vi)[^a-f]*$&#47;</h4>
<p>Earlier on I said this regular expression can match the target string 'driving'.</p>
<p><a href="http:&#47;&#47;rubular.com&#47;r&#47;Hc8vIdCC6T">See this in action</a></p>
<p>Let's break down what's happening here. We've got positional anchors with the ^ and $ that let us know the entire contents of the string are within the regular expression. Let's remove them to give us: <strong>dw[uiop](in|vi)[^a-f]*</strong></p>
<p>The first letter is a literal 'd'. Followed by a single alphanumeric 'w'. Then we have a range of possible single characters [uiop], followed by a boolean or '(in|vi)' and finally a range between 0 or infinite characters that doesn't contain any letters between a-f. One word which matches these conditions is 'driving'.</p>
<p>If you come across such crazy regular expressions I'd encourage you to put them into <a href="http:&#47;&#47;www.regexper.com&#47;">Regexper</a> which will explain them for you. For this expression Regexper gives us this diagram:</p>
<p><img src="{{ site.url }}/assets/2013/driving_regex.png" alt="driving_regex" class="alignnone" /></p>
<p>Why would someone make this regular expression?</p>
<p>I've given you a crash course in what you need to know to solve most problems with regular expressions. Now see if you can put your knowledge to test by solving this <a href="http:&#47;&#47;mariolurig.com&#47;crossword&#47;">regular expression crossword puzzle</a>.</p>

<h4>Resources</h4>
<ul>
<li><a href="http:&#47;&#47;rubular.com&#47;">Rubular</a> is a great testing tool for creating regex</li>
<li>For converting a regular expression into a human readable form use <a href="http:&#47;&#47;www.regexper.com&#47;">Regexper</a></li>
<ul>
