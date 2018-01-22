---
layout: post
title: "Four qualities that underpin an effective test suite"
---

<img width="100%" src="{{ site.url }}/assets/2018/traffic_light_covers.jpg"/>
<a class="attribution" href="https://flickr.com/photos/slopjop/2391468254">'traffic light obsession.3' by Clay Junell</a>

> As ironic as it seems, the challenge of a tester is to test as little as possible. Test less, but test smarter
> -- <cite>[Federico Toledo]

We need to be wise with our choices about where we invest in testing. It's tempting to test everything but that's costly to maintain and deliver. I've found that the test suites that have given me the best return on investment share four qualities:

* Structure
* Speed
* Robustness
* Illumination

Tests need __Structure__ to allow us to test at the right level. We want a mix of unit, integration, api, contract, end to and ui tests. This makes sure different parts are all hanging together. 

The key skill is figuring out at what level to test then not duplicating those tests at different levels.

Tests need __Speed__ to give us a quick feedback loop that everything is as we expect. It's important that we know as soon as possible if they aren't. The longer you wait the longer it takes to figure out what change caused the failure.

The key skill is testing at a lower level to reduce the total time your suite takes to run. Avoid I/O wherever you can.

Tests need __Robustness__ to give us faith that we can trust them. Tests should never fail for no reason. Nothing corrodes faith faster than a flickering test which can't be reproduced on your own machine.

The key skill is having no tolerance for flickering tests. We need to make that test robust or delete it.

Tests need  __Illumination__ to allow us to diagnose what has gone wrong. We should never have to re-run a test to figure out what the actual problem is. Log all the information you have, screenshots, browser logs. Anything that can help someone figure out what's wrong from your failure message.

The key skill is taking care when crafting your error messages. 

When test suites aren't loved it's because one of these four qualities have been neglected.

Are you depending too much on one level of tests? Do you know if your tests are duplicated at different levels? Consider your structure and how your team agrees where to test.

Does your test suite run overnight? This is forcing you to wait over 12 hours before knowing whether a single change was good. 

Are your tests brittle leaving your suite broken? Are your team fire fighting hard to diagnose issues which are near impossible to recreate? This takes time away from adding value with tests.
 
If you identify with any of the above statements then consider which of the four qualities are missing. It's time to make a change in how you are investing in your test suite.
