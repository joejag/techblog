---
layout: post
status: publish
published: true
title: What's your problem?
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 949
wordpress_url: http://code.joejag.com/?p=949
date: '2013-04-02 00:30:40 +0100'
date_gmt: '2013-04-01 23:30:40 +0100'
categories:
- Uncategorized
tags: []
comments:
- id: 167
  author: Andrew Buchan
  author_email: andyhasit@gmail.com
  author_url: http://slickworks.co.uk
  date: '2013-05-05 14:31:47 +0100'
  date_gmt: '2013-05-05 13:31:47 +0100'
  content: |-
    I think you're bang on the money. I used to constantly find myself reading up about a new methodology, being sold on it's benefits hook, line and sinker (the people who write these manifestos should work in advertising!) Then I'd try and make it work for my context and realise it solves a problem I didn't really have, or at least didn't validate such high focus and effort to contain...

    I recommend developers familiarise themselves with these kind of tools just enough to understand what's involved in making them work on a project, then letting them sit in the back of the mind. For each new context you find yourself working in, determine what problems you actually have, how much of a problem each one is, and drawing on your knowledge of various tools and techniques as inspiration, determine the optimal extent to which it needs managed.

    I love cucumber, it's very clever, but I've never had sufficient call to use it, so it stays in the toolbox for now, and that's the way it should be :-)
---
<blockquote>
Google don't do Test Driven Development, so I don't see why I should either<br />
<small>Countless software devs</small><br />
</blockquote>

<p>We live in a world where people love to apply quick fix solutions to problems. Lose 10kg in 2 weeks! No cash until payday? Borrow &pound;100 at 30000% APR! We crave these simple solutions, and deeply want to believe that they can make our lives better.</p>
<p>It's a good idea to look at the context we are in, then work on a way to change the system that governs that context. Once we understand the system we can then look at adopting tools to help us. </p>
<p>For both of the examples I gave in the introduction a good question would be: What's your food intake and exercise like? How are you spending your money currently? But people don't do this. They are far more interested in the next miracle fix.  Sadly in the IT world we are just as susceptible to quickly grabbing a new tool that worked for someone else, then either blindly going with it or quitting in absolute disgust.</p>
<p>We can improve the process we use to select tools to remedy our problems. The key to this is to stop only focusing on how a tool works and its benefits and <strong>start by asking what problem the tool solves</strong>. The first two parts are important, but useless without knowing if it's solving a problem you have.</p>
<p>I suggest we use this checklist when considering any new tool or practice:</p>

<ul>
<li>What problem does it solve?</li>
<li>How does it work?</li>
<li>What are the benefits?</li>
<li>Will this work in my context?</li>
</ul>

<p>A lot of people have a strong reaction to BDD and <a href="http:&#47;&#47;cukes.info&#47;">Cucumber</a> so let's use that as an example. We'll use a shortened summary of the checklist items then consider a recommendation for two different personas.</p>

<h3>Cucumber checklist summary</h3>
<p>Cucumber solves a number of problems often seen in software development where misunderstandings are rife. In particular it solves the problem of the business speaking a different domain language from the development team by asking them to collaborate on acceptance tests together in a simple natural language script.</p>
<p>Its benefits include living documentation, automated acceptance tests, and encouraging an outside in view of software development.</p>

<h4>Is Cucumber right for Angus?</h4>
<p>Our first persona will be Angus. Angus had an idea for a mobile app and hired two people he trusts to help him build it. Angus has heard great things about Cucumber at conferences and wants to try it out with his team.</p>
<p>Angus doesn't have a major problem with miscommunication within his team. If he tries Cucumber he'll probably decide that he doesn't like "<a href="http:&#47;&#47;stackoverflow.com&#47;questions&#47;4183160&#47;does-bdd-pay-off">the extra layer of indirection</a>" Cucumber introduces. As the readers of the tests are all technical, he could get the same benefit from just writing outside-in integration tests in the testing framework he's already using.</p>
<p>Angus should look for other methods, or invent his own, that can give him some of the other benefits that Cucumber brings. </p>

<h4>Is Cucumber right for Bruce?</h4>
<p>Bruce works for a medium sized digital agency who specialise in online shopping sites for a wide variety of clients. His customers like to run discount campaigns during different seasons. Currently he gets the client to write the pricing rules down in an email which he turns into code.</p>
<p>The product owner for Bruce's project is not part of the team. By using Cucumber's acceptance criteria with the client he could quickly discover problems with his understanding of the pricing code and also open up other conversations with his client.</p>
<p>Bruce should look into adopting Cucumber.</p>

<h3>Context is king</h3>
<p>When you hear about a tool you need to look at the problem it solves, the other benefits it brings and consider if this makes sense in your own context. The misapplication of tools leads to pessimism and waste. We should be optimistic about new tools, but grounded in our current context. Context is king.</p>
