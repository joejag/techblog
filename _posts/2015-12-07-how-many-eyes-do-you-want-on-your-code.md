---
layout: post
title: How many eyes do you want on your code?
---

Perhaps you've been on a team where no one ever reviewed your code. Or perhaps you've been on a team where all your changes required a formal review.

With no code review you're building a tremendous amount of risk in your code. Not only that but you are missing out of learning opportunities for your team.

At the required formal review end, you'll often discover long waiting times between review. Slowing down your process and leading to rework. 

Do we need code reviews? If so then how much is the right amount?

## Why bother?

Stackoverflow gives us the [main](http://programmers.stackexchange.com/questions/71654/code-reviews-what-are-the-advantages) [reasons](http://programmers.stackexchange.com/questions/15874/tips-on-persuading-boss-that-code-review-is-a-good-thing), which can be  distilled down into:

* Shared understanding of the code and the business problem it solves.
* Learning opportunities are spotted for education improvements.
* Consistent internal code style are reinforced. Particularly patterns (use a [linter](https://en.wikipedia.org/wiki/Lint_(software)) for syntax).
* Bugs are spotted.
* Problems with business requirements can be spotted.

There's some big ticket items in the list. This makes me believe there's technical and business reasons to review code. So how should we do it?

## When can we review?

There's three options for adding anything to your software process: staged, continuous, batched. For code review this means:

* In process as a formal stage: Have a stage in your process during which all stories are reviewed
* In process during development: Have a pair/mob continuously review the code
* Out of process as a batch: Schedule a weekly 2 hour meeting where everyone gets together and reviews commits.

Each of these pose advantages and disadvantages. You also don't have to choose just one approach.

Formal stage makes sure everything gets reviewed. It works best with smaller change sets, as otherwise developers avoid reviewing and queues develop.

Pairing can be seen as a continuous code review. Improvements are suggested when it is easiest to change, rather than after the code is "finished". But you still have to contend with inexperienced pairs being left without guidance. Also it can take a while to get consistency of patterns until the team has rotated through a few similar stories.

Batching involves getting everyone together for a meeting about code quality. This can help create a common understanding of quality across teams and projects. The disadvantage is that this is usually after the code is shipped. Missing chances to catch bugs, or direct style early on in a stories development.

## Four eyes good, two eyes bad

Having more eyes on code changes improve the benefits of the reviewing process. But there is also a level of diminishing returns that each review adds.

* Does changing an interal README require the same process as adding a new feature?
* Do you have to pair on tasks where the benefits of a code review don't exist?

I think the answer to this depends on your team, their shared understanding and the task at hand. In short: Context is king.

## A contextual approach

Consider how much of your team has silo'd knowledge or experience. Is there just one person who knows about that area of the code? Start by making a [Liquidity Matrix](https://theitriskmanager.wordpress.com/2013/11/24/introducing-staff-liquidity-1-of-n/). Only add items that would take more than a few days to learn. Developers are quick enough to pick up most tasks.

Once you have this, you know where the strengths and weaknesses are of the people and code areas on your team.

Use this matrix to spot where the benefits of a code review benefit most. It could be that just one person is enough for a task, for the majority it will be at least two pairs of eyes.

If your development team are solo programming then you'll almost always want a formal code review stage. The exception is when the matrix indicates everyone is strong in the skill and there aren't knowledge sharing benefits.

If you are pairing then consider switching one person during the story. If the matrix indicates a pair are inexperienced then use a formal code review as well.

Everyone can try getting together as a mob and reviewing across your teams and projects. This can amplify the benefits of code review across your group. I've found this effective on larger teams where there are more than 10 developers.

No code review is dangerous, all formal code review is wasteful. Consider the team and task at hand, then decide how much review to apply.
