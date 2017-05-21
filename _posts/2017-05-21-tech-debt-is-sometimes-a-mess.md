---
layout: post
title: "Technical Debt is sometimes a mess"
---

Every now and then a newcomer to your field can ask a simple but brilliant question.
This week I was asked:

*"What is the difference between technical debt and legacy code?"*

I thought back to when I've heard those terms while on the job.
Both concepts are about code that prevents us from getting things done.
But usually the distinction was about when the code was created.

So I answered:

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="en" dir="ltr">Technical debt: crappy code the current team wrote <br>Legacy code: crappy code people that left the company wrote</p>&mdash; Joe Wright (@joe_jag) <a href="https://twitter.com/joe_jag/status/865309887118659590">May 18, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

This distinction seems to resonate with quite a few software folk. Not because it's correct, but because it contains a kernel of truth about how people talk about this subject.

I find that code people want to rewrite entirely is branded as 'legacy code' and code they've written more recently but got the design wrong they call 'technical debt'.

But not [everyone](https://twitter.com/KirstenMinshall/status/865481418654089220) [was](https://twitter.com/perhammer/status/865470357662089216) [happy](https://twitter.com/neil_killick/status/865469826885484545).

This is good news, as we now get a chance to learn how other people see the world.
Even if they are brandishing pitchforks and looking menacingly at you.

I've since learnt that according to [Uncle Bob](https://sites.google.com/site/unclebobconsultingllc/a-mess-is-not-a-technical-debt) 'technical debt' is a conscious decision to make a sub-optimal design to gain a short term benefit. So my assertion that 'crappy code' is technical debt does not fit within this definition at all.

Bother.

For me, the reason why the 'technical debt' metaphor and 'legacy code' definition exists is to help business folk and developers talk about internal code design problems and prioritisation. It's useful for conversations about what we should do next.

When we are using this debt language we are trying to convey that we've got something significant that is slowing us down. We can take the hit - the 'interest' - or we can pay off the debt entirely by fixing the problem.

Folk on Twitter were disgruntled because they want 'technical debt' to mean a professional decision that was taken for good reason. Uncle Bob argues that code which is 'technical debt' has to be written in a clean code fashion to gain the moniker. A mess is not 'technical debt'. The idea of developers making design mistakes or performing sub-optimally wasn't something they want associated with 'technical debt'.

I have some sympathy with this point of view. As it teaches developers that even when we cut corners we should do our best to not write crappy code.

Practically though, I find this unnecessarily limiting.

I think about technical debt as either deliberate or accidental. [Martin Fowler](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html) has expressed similar beliefs.

I don't think it's important to differentiate how we get into the 'debt' state. It's important to be able to have a conversation with non-technical people about what we should do next. I've found the debt metaphor works well for this and I'd encourage others to try using it too. But I am also lucky to have folk on Twitter who take the time to disagree - that's what fuels learning.
