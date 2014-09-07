---
layout: page
status: publish
published: true
title: 'Coding Dojo: Bowling Scores'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 191
wordpress_url: http://code.joejag.com/?page_id=191
date: '2009-09-06 01:35:41 +0100'
date_gmt: '2009-09-06 01:35:41 +0100'
categories: []
tags: []
comments: []
---
<h2>Bowling Scores</h2></p>
<p>The goal of this program is to model a game of bowling. Given a series of input the program should output the players final score.</p>
<h3>Specification&#47;Rules of Bowling</h3>
<p>Each game, or <b>line</b> of bowling, includes ten turns, or <b>frames</b> for the bowler.</p>
<p>In each frame, the bowler gets up to two tries to knock down all the pins.</p>
<p>If in two tries, he fails to knock them all down, his score for that frame is the total number of pins knocked down in his two tries.</p>
<p>If in two tries he knocks them all down, this is called a <b>spare</b> and his score for the frame is ten plus the number of pins knocked down on his next throw (in his next turn).</p>
<p>If on his first try in the frame he knocks down all the pins, this is called a <b>strike</b>. His turn is over, and his score for the frame is ten plus the simple total of the pins knocked down in his next two rolls.</p>
<p>If he gets a spare or strike in the last (tenth) frame, the bowler gets to throw one or two more bonus balls, respectively. These bonus throws are taken as part of the same turn. If the bonus throws knock down all the pins, the process does not repeat: the bonus throws are only used to calculate the score of the final frame.</p>
<p>The game score is the total of all frame scores.</p>
<p><b>We will not check</b></p>
<ul>
<li>Valid rolls
<li>Correct number of rolls and frames.
<li>We will not provide scores for intermediate frames.<br />
</ul></p>
<h3>Example input and output</h3>
<pre class="sh_ruby">
Example 1: Gutter balls (all zero)<br />
[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]<br />
-> 0</p>
<p>Example 2: All Threes<br />
[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3]<br />
-> 60</p>
<p>Example 3: All Spares with first ball a 4<br />
[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6,4]<br />
-> 140</p>
<p>Example 4: Nine Strikes followed by a gutter ball<br />
[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[0,0]<br />
-> 240</p>
<p>Example 5: Perfect Game<br />
[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10,10]<br />
-> 300<br />
</pre></p>
