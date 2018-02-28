---
layout: post
title: "Making BDD more than tooling"
related: 
    - title: 'Make Selenium tests illuminating by saving the browser log and a screenshot'
      url: '/2018/saving-screenshots-and-browser-logs-with-selenium.html'
    - title: 'Four qualities that underpin an effective test suite'
      url: '/2018/the-four-qualities-of-a-good-test-suite.html'
    - title: "What's your problem?"
      url: '/2013/considerations-when-adopting-a-new-tool-or-practice.html'
---

<img width="100%" src="{{ site.url }}/assets/2018/bdd_tooling.jpg"/>
<a class="attribution" href="https://www.flickr.com/photos/timjayfitz/2581753407">'Tools' by Tim Fitzwater</a>

There's two ways teams adopt BDD with Cucumber. It's either __process driven__ or __tooling driven__. 

The difference between both mindsets is profound.

Folks on the __process driven__ route start with changing their process rather than tooling. Their BDD process comes in three stages:

* Discovery
* Formulation
* Automation (optional)

Discovery is about getting the appropriate folk together to figure out what we are building. They think through the business rules and examples that illustrate them. Formulation is writing those examples down in readable statements. The last stage is automation. Here you can optionally decide to automate those statements in a tool like Cucumber.

Most of the value of BDD is in the first two stages. As that is the part where misunderstandings get removed before they become code in the product.

Process driven teams will be aware of the golden rule of Cucumber: Only write examples in Cucumber if you are going to get business feedback from them.

If the business isn't reading your scenarios then you are better off writing tests in your native programming language. The originator of BDD - Dan North - has stopped using Cucumber's Gherkin language. He chooses a programming language (Python) which he feels is close enough to understandable English already 

Regardless of the way of writing the tests. The BDD process involves discovery, formulation and automation.

So what about __tooling driven__ teams?

In this case the team has come to BDD in the backwards order. They adopt the automation stage alone. It tends to be one role on the team that adopts it, missing the value you get with the collaborative parts of BDD.

Often it's testers that pick up the Cucumber tooling.

I have empathy for testers that come to Cucumber via the tooling. Testing tooling can be clunky record and playback types or involve tweaking Excel files. Using Gherkin to express business problems in data tables with configurable code blocks is a marked improvement.

Working in isolation comes at a price. Your tests will all be expensive end to end tests. When tooling comes first you often find Cucumber used as a mere [DSL](https://martinfowler.com/books/dsl.html) for Selenium.

I've seen some teams migrate from using 'BDD' as tooling to using it as a process but it comes with an emotional cost. The tooling first approach has become ingrained in how many people have spent their careers. Saying every example doesn't need to executed via Cucumber is seen as challenging their professionalism.

As well as testers, sometimes the analysts will start providing sample scenarios they wrote alone to be handed over to the team to develop. This also misses the point of having conversations together before the work begins.

If you want to move from your BDD process from being about tooling or a way to form Jira tickets, then what should you do?

I'm glad you asked.

> You never really understand a person until you consider things from his point of view.
> -- <cite>[Harper Lee]

Before starting you need to build an understanding relationship with folk in your team. Understand how the process has become the way it is. Observe how the team communicates, or doesn't, and see where the opportunities are. If you understood the context and peoples motivations then we can begin.

The first step is start using [Example Mapping](https://cucumber.io/blog/2015/12/08/example-mapping-introduction) before you kick off your stories. Example mapping provides a quick and collaborative way to flesh out what a story involves. It's a great way to start doing BDD without talking about digital tooling. 

Example Mapping involves writing rules and examples on cards. We don't use the Gherkin language here, meaning we focus on the problem rather than rules about 'good' Gherkin.

Now you will have analysts, testers and developers all talking together. Learning how the software should work and finding issues before development begins. Next up is making automation a team sport.

The second step is exploring how the developers and testers can execute Cucumber scenarios at different levels.

We don't have to check every business rule via a web browser or API. Together we can find a way to check a business rule without the cost of the slow and often brittle levels that browsers and API tax us with.

Validation tests are a low hanging fruit here. There's no point spending two minutes progressing through a UI to test validation messages appear. We can check that at a unit level instead. Our aim is to keep the Cucumber tests as documentation about the important business rules, rather than uninteresting features.

If you can get your team talking about the work before the work takes place, and automation checks at the right level then you are in a good BDD place.

I've seen __process driven__ work wonders, and I've seen __tooling driven__ hamstring teams. If you came to BDD via tooling driven then you are in a good place to start looking at testing throughout your process. I wouldn't recommend staying where you are.

*Update*: Seb Rose and Gáspár Nagy have written a book on the __process driven__ model if you'd like to learn more: [Discovery: Explore behaviour using examples][http://bddbooks.com/]
