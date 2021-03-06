---
layout: page
status: publish
published: true
title: 'Coding Dojo: Vending Machine'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 186
wordpress_url: http://code.joejag.com/?page_id=186
date: '2009-09-06 01:29:43 +0100'
date_gmt: '2009-09-06 01:29:43 +0100'
categories: []
tags: []
comments: []
---
<h2>Vending Machine</h2>
<p>The goal of this program is to model a vending machine and the state it must maintain during it's operation. How exactly the actions on the machine are driven is left intentionally vague and is up to the implementor.</p>
<p>The machine works like all vending machines: it takes money then gives you items. The vending machine accepts money in the form of nickels, dimes, quarters, and paper dollars. You must have at least have 3 primary items that cost $0.65, $1.00, and $1.50. The user may hit a "coin return" button to get back the money they've entered so far. If you put more money in than the item's price, you get change back.</p>

<h3>Specification</h3>
<p><b>The valid set of actions on the vending machine are:</b></p>

<ul>
<li>NICKEL(0.05), DIME(0.10), QUARTER(0.25), DOLLAR(1.00) - insert money</li>
<li>COIN RETURN - returns all inserted money</li>
<li>GET-A, GET-B, GET-C - select item A ($0.65), B ($1), or C ($1.50)</li>
<li>SERVICE - a service person opens the machine and sets the available changeand items</li>
</ul>

<p><b>The valid set of responses from the vending machine are:</b></p>

<ul>
<li>NICKEL, DIME, QUARTER - return coin</li>
<li>A, B, C - vend item A, B, or C</li>
</ul>

<p><b>The vending machine must track the following state:</b></p>
<ul>
<li>available items - each item has a count, a price, and a selector (A,B,or C)</li>
<li>available change - # of nickels, dimes, quarters, and dollars available</li>
<li>currently inserted money</li>
</ul>

<h3>Example input and output</h3>

{% highlight bash %}
Example 1: Buy B with exact change
Q, Q, Q, Q, GET-B
-> B

Example 2: Start adding change but hit coin return to get change back
Q, Q, COIN-RETURN
-> Q, Q

Example 3: Buy A without exact change (return $.35)
DOLLAR, GET-A
-> A, Q, D
{% endhighlight %}
