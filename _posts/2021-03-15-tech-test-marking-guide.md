---
layout: post
title: "Tech Test Marking Guide"
---

When reviewing code, I find I can easily be swayed by a romantic interpretation of the code _"This looks like my code!"_ or _"Urgh, this bit is hard to understand"_. 

It's pretty easy to get caught on one part and let that bias your opinion on the whole work.

To alleviate this trap, I use a standard marking scheme. I ask the other reviewers to use the same scoring system, and we take an average of the scores.

I've also been using it with folks looking to improve their coding skills as a review mechanism. We go over each category and see what we can do to improve on each item. 

I've helped folks get promotions using this system.

## Tech Test Marking Guide

Find yourself some problem, then score the solution out of 22 points.

1. __It works__ (8 points) 
  * Meets spec is 8 - reduce the score for missing parts or bugs found)

2. The code is __easy to read__ (4 points)
  * Method names are self-describing and show intent (i.e. not misleading)
  * Comments, if any, say why rather than how
  * Methods are short
  * Clear control flow (i.e. you can follow what it is doing)

3. It's __tested__ (4 points)
  * Test names are explanatory
  * Expected test cases are present
  * Tests are explicit (i.e. it is obvious what they do and not over 15+ lines per test method)
  * The tests are logical (i.e. makes sense that they are there)

4. It's __maintainable and robust__ (4 points)
  * No dead code
  * Defensive at the system boundaries (e.g. user input, API boundaries)
  * Modularised (e.g. follows Single Responsibility Pattern)
  * Can be built and ran in one step

5. The __write up__ (a README.md) is complete (2 points)
  * It mentions how to run the application
  * There is some reasoning about tradeoffs made while writing the application.

### A last thought

Tech tests during interviewing processes put a significant burden on the candidate during the process. I'd explore lighter ways to figure out if you want to work with a person. 

But if you are in a context where you have to use a tech test, I'd adopt this scoring system. I'll give you bonus points if you share the system with the candidate before giving them the tech test.