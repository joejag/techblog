---
layout: post
title: "Synthetic Monitoring with Cypress"
---

One of the best testing moves you can make right now involves taking an existing journey test from your deployment pipeline and running it all the time against your production environment.

You can put the ways we monitor our production environments into two categories: **proactive** or **passive**.

Parsing logs for errors or using an APM like [NewRelic](https://newrelic.com/products/application-monitoring) is passive as it is waiting for customers to find out if our systems are working as expected. They are a fantastic way of gaining insight - after something has gone wrong.

A proactive approach involves creating real requests yourself against your services to check if they are working as expected. A rudimentary version of a proactive check exposes a `/health` endpoint called by your load balancers to cull misbehaving services. A second, and richer, way of doing this is simulating your services real-world usage via a web browser. This approach is called [Synthetic Monitoring](https://en.wikipedia.org/wiki/Synthetic_monitoring).

Combing a proactive approach like Synthetic Monitoring with a passive approach like an APM gives you an excellent platform for observing your applications.

_So how doe this work?_

The approach I'm suggesting requires adding one more component into your traditional architecture which is dedicated to running the tests and producing reports.

In this example architecture, I'm assuming you are tracking service health metrics with InfluxDb, but that part could be anything else.

<p class='header-image'><a href="{{ site.url }}/assets/2021/synthetic_monitoring.jpg"><img alt='Diagram showing that Synthetic Monitoring is another process you run in your production environment' width="100%" src="{{ site.url }}/assets/2021/synthetic_monitoring.jpg"/></a></p>

There are some services online that let can perform Synthetic Monitoring for you, but sometimes it's nice to have control over the tests and execution environment. For this article, I've put together an [example of how to run Cypress](https://github.com/joejag/synthetic-cypress/) inside a microservice continuously against one of your environments.

If you look over the code, you'll notice there's only one non-Cypressy file here: the `server.js`. This file contains an Express server which hooks into the [Cypress module API](https://docs.cypress.io/guides/guides/module-api.html) with

```js
const cypress = require("cypress")

cypress.run({
  config: {
    video: true,
  },
  spec: __dirname + "/cypress/integration/*-spec.js",
})
```

Along with Express routes, the above code is wrapped in a while loop with a sleep in between test runs.

For inspection, I've added JSON API endpoints, Prometheus metrics and a fancy status page. The cherry on the top is the recorded videos of your most recent test run so you can quickly see what's gone wrong.

<p class='header-image'><img width="100%" src="{{ site.url }}/assets/2021/cypress_screenshot.png"/></p>

_So how can I get started?_

Make a copy of the [Github repo](https://github.com/joejag/synthetic-cypress/), then add one journey test through your application. You don't want to have many of these tests, solely target the main path through your application.

_But, what's the catch?_

Nothing comes for free, and you want to run these tests against your production environment, which will mean having discussions with your team about how you can safely get the test running. This work can involve cleaning up the data it creates, managing login accounts and filtering the data out of any analytics reports you have. You might also have third-party services to consider.

If you've already got a Cypress test running in your deployment pipeline, I will encourage you to use it as a seed for a Cypress based Synthetic Monitoring solution.

_Wait! Testing in production?_

As an industry, we are experts at blasting non-production environments with test suites. But we are still amateurs at testing what matters: the environment your customers are using.

If you remain unconvinced about running tests in production, check out the [excellent series of articles by Cindy Sridharan](https://copyconstruct.medium.com/testing-in-production-the-safe-way-18ca102d0ef1).
