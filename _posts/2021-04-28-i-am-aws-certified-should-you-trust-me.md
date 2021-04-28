---
layout: post
title: "I'm AWS certified? Should you trust me?"
---

<p class='header-image'><img width="100%" src="{{ site.url }}/assets/2021/aws_cert.png"/>
</p>

This week I passed the AWS Solutions Architect exam, making me a certified AWS Solutions Architect. I can see you've forgotten the red carpet for me to walk upon, but that's ok, I'll wait.

Why did I do that exam? Why did I spend five weeks every evening trying to learn about yet another part of AWS? Well, it was for the professional challenge.

I've long been a hobbyist AWS user. I ran VMs on EC2, stored things in S3 and played around with Lambda to see how it feels. But I noticed at work that I'd suggest a way to accomplish something on AWS, and a Solutions Architect would point out a better way that I didn't know exists. I started to notice that these Solution Architects all had this certification as well.

For me, this means the exam passes the [CertificationCompetenceCorrelation](https://martinfowler.com/bliki/CertificationCompetenceCorrelation.html) test as set out by Martin Fowler:

> "Most of my friends and colleagues are very negative about certification schemes in software development, a disdain that I share. This doesn't mean that I think that certifications in software are bad by definition, just that almost every one we see fails a basic test."

> <img width="100%" src="{{ site.url }}/assets/2021/fowler_cert.png"/>

> "For a certification to be useful, it needs a correlation with competence in the thing that it certifies. So if Alice has a certification in, say, Clojure programming, then there should be a high probability that Alice is a competent Clojure programmer. High probability isn't a guarantee, but it should be significantly higher than the general programmer population. The reason we have disdain for most software certification programs is because we've not seen such a correlation (indeed, sometimes we feel there's a negative correlation)."

I'm also a massive sceptic of certification schemes. For broad topics like agile (Scrum cert) or a programming language (like Java cert), it only proves we understand the simple stuff. It doesn't mean the person knows the complex stuff which matters. For example, there is a world of difference between knowing how to cast a double to a Double in Java versus knowing how to arrange abstractions that allow your codebase to grow without becoming unwieldy in a team.

So, where does this leave the AWS exam?

The AWS exam is still broad. I took [copious notes](https://github.com/joejag/aws_exam_notes) on over 50 different services that can come up. What I liked was the services I was a hobbyist in, I became very knowledgeable about, but for the services I hadn't seen and didn't play with, I'm just a faker. I can tell you that Redshift is a near-real-time BI database that stores things in columns to make it suitable for ad-hoc analysis, but I've never actually seen it in use or performed a query.

Given the vast amount of services, it isn't possible to learn them all. There is a significant amount of services dedicated to migrating stuff from on-prem to AWS. These are things you cannot play with to learn, and when I asked the Solutions Architects I work with, they said:

> "that'll almost always fall to infrastructure experts normally, because of its physicality and specialist knowledge".

I'm sure my ability to recommend a solution between AWS Data Sync and AWS Storage Gateway for Files will disappear in a few months.

But, I do love that the things I cared about, I've now used all the advanced features. Like S3 replication and versioning, setting up 2FA to prevent accidental deletes. Mastering Route 53 failover and auto-creating certificates for TLS. That's information that will help me with offering options to teams in the future.

If I were to start again, I'd wished I tried every service out to get a natural feel for it. AWS Kinesis, ECS with EC2 and Redshift stick out. It's tough to revise those topics when you only have a superficial understanding of what they offer.

Is it possible to pass the AWS Solutions Architect exam while faking knowledge or everything?

Probably so, but it would be difficult. The pass mark being 72% gives you a chance, with dedicatation you could pass without having much experience with AWS. However, I think you are less likely to run into these folks. So what does this mean for the Fowler question? Would you use the presence of this certificate to filter out CVs when you have too many to interview? Ouch, I'm still not sure, but my experience is leading to a yes. But given I've got this certificate I'll throw in the Groucho Marx caveat:

> “I don’t want to belong to any club that would accept me as one of its members.”

I'd prefer to interview based on explaining the problems I'm having and what they would recommend. As my friend Rob suggested:

<blockquote class="twitter-tweet" data-conversation="none" data-cards="hidden" data-partner="tweetdeck"><p lang="en" dir="ltr">I have three principles, based on the idea idea that we’re both looking for people to work *with*:<br><br>Parity of engagement - both sides should have to put in the same effort.<br><br>Parity of communication - I talk as much as they do.<br><br>No questions, only topics to discuss.</p>&mdash; Rob Lally (@roblally) <a href="https://twitter.com/roblally/status/1377332085069778946?ref_src=twsrc%5Etfw">March 31, 2021</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet" data-conversation="none" data-cards="hidden" data-partner="tweetdeck"><p lang="en" dir="ltr">I give, context, an opinion, and seek their input to engage in a discussion. “We’ve been debating between batches, microbatches and streams. I believe we can handle almost all our workloads as streams with a few scheduled batches to supplement them. Do you think that’s viable?”</p>&mdash; Rob Lally (@roblally) <a href="https://twitter.com/roblally/status/1377337446057136128?ref_src=twsrc%5Etfw">March 31, 2021</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

The last thought I'd like to share is that you notice that AWS is always looking to give you three tradeoffs to play with:

- Cost
- Performance
- Availability

In just about all their services, there are levers you can pull to optimise for these attributes. EBS has cheaper, faster and specialised options for storage. This pattern is repeated across the board for Load Balancers, Databases, Auto Scaling, Block Storage and Analytics.

But then you look at API Gateway and Lambda. These levers aren't present as much, as AWS has created a highly scalable, available and low-cost platform to build services. There are no questions on the exam asking you to make tradeoffs on the levers for this tech stack. It truly is a remarkable invention that evolves us past IaaS, PaaS and containers with even less guff like OS patching to worry about. DynamoDB is pretty close, too, with much less to worry about than a traditional relational database when it comes to failover and backups. When those options come up in the exam, they are almost always the correct answer as they offer great options across cost, performance and availability.

**So should you study for the AWS Solutions Architect exam?**

If you are a hobbyist looking to understand the services you already know deeply, then yes, 100% yes. For the common services you haven't used, also play about with them in a hobbyist fashion as it'll be much easier to grok the exam questions if you have hands-on experience.

**I'm AWS certified? Should you trust me?**

Of course, it shows you have great taste. By the way, I'm still waiting on you rolling out that red carpet.
