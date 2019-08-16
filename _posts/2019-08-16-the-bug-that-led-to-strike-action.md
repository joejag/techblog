---
layout: post
title: "The bug that led to strike action"
---

<p class='header-image'><img width="100%" src="{{ site.url }}/assets/2019/strike.jpg"/>
<a class="attribution" href="https://www.pexels.com/photo/people-rallying-carrying-on-strike-signage-1094323/">'Rallying' by Martin Lopez</a></p>

I've just remembered about the time I was asked to help fix a bug in production and ended up being named by a trade union as a reason they are going on strike.

It was my first week at the org after joining via a consultancy. The bug was a NullPointerException with a stack trace and line number. Fairly simple right? Look at the line in question and figure out what has been overlooked that allowed it to be null.

The problem was that the line number didn't represent what we had in source control for that release. There was a blank line where the bug was supposed to happen. This led me to question how the releases were really done. So off I went to discover how releases work.

There was a standard continuous integration style delivery pipeline. Build and test from source and deploy to some Linux based pre-production environments — nothing to cause concern. I noticed, however, that production wasn't part of the automated delivery pipeline. So I ask: "How does the program go from test to prod?". And this, comrades, is where the plot thickened.

*"Ah yes, there's a separate team for that, you can find them on the fifth floor"*. 

So off I went to explore and meet some new people.

*"Can you tell me how we did this last production release?"* I asked. Trying to ensure the same compiled program was being promoted into production.

*"Of course!"* was the answer.

*"First, we check out the source code onto our local machine here; then we run through our script."*

*"Oh, your local Windows machine? Not using the prepared program?"*

*"No, you can't trust developers to build software."*

*"Erm, ok. What does your script involve?"*

*"It reformats the code making sure there is a copyright notice,  then compiles it. Then we move that onto the production server."*

*"Oh right, I notice you are using a different version of the compiler then we use. Are you all using that version?"*

*"No, it depends on who picks up the deployment ticket."*

*"Oh, that's interesting. I noticed you aren't using the same build tool as the developers. How are you getting the dependencies for the program?"*

*"We download them from the Internet from our browsers and package them up."*

Holy shit.

The sole job of this whole team was to "reassemble" software. This might of made sense before the continuous integration setup became available, but now it was a downright dangerous waste. I mentioned how the software was assembled now, and you could trust the pre-built one, but this advice was met with concerned looks.

*"What would my job be then?"* was the entirely reasonable question.

*"Well, it'd be great if we started getting some alerting, metrics and centralised logging setup. Your team is the only one with permission to get those services set up in production."*

You probably noticed my mistake here. People like to change themselves; they hate to be changed by others. Especially when they don't feel they have the power to make changes themselves.

After I left one of the software assemblers which I hadn't spoken to complained to their union rep that their team was interviewed without a union representative present. 

There was already an ongoing dispute with a planned two-day strike. We managed to get a copy of the union's complaints, and most were about lack of training and flexible time. But right near the end of the document, you could see the assembly team with a specific complaint with my name in the list of belligerents.

Quite a first week. 

Over the year the assembly team moved into a more "DevOpsy" function, which I hope made them happier. I didn't want to ask.

When the day of the strike came around, there were people outside the office with placards. I felt a bit sheepish and didn't stop to look. But to this day I hope there was a placard saying "Down with Continuous Delivery and especially Joe Wright".

