---
layout: post
title: "Three constraints for introducing mob programming"
---

<img width="100%" src="{{ site.url }}/assets/2018/constraints.jpg"/>
<a class="attribution" href="https://www.flickr.com/photos/tabor-roeder/5835126514">'Hurdles' by Phil Roeder</a>

I don't bother with a sales pitch when I'm introducing mob programming. I start by introducing three enabling constraints along with a safe experiment for the team to learn within.

The session works like this:

* Introduce the constraints
* Mob for 45-120 minutes
* Have a short retrospective

There's the pre-event preparation of having a room with a large screen or projector with a laptop with your introduction slides and a programming environment ready. Plus crucially, getting the seating arranged to allow everyone to have a good view of the screen and also of each other.

I try to keep the introduction as concise as possible. It'll start with the quote from Woody about what mobbing is:

> All the brilliant people working on the same thing, at the same time, in the same space, and on the same computer
> -- <cite> [Woody Zuill]

Then I move onto the three constraints.

### Constraint 1: Use a timer

The purpose of the timer is to rotate the person at the keyboard typing. There's plenty of [free timers](http://oss.jahed.io/agility/timer.html) out there to do this for you. It only needs two features: keep a list of names and indicate when it's someone else's turn to take the keyboard.

I recommend keeping the timer at a short interval at first as you want everyone to get at least two shots as being the typist. I've gone as low as __three minutes__ while introducing mobbing; however, four to seven is fine too.

It's worth asking who would like to take turns on the keyboard to figure out the interval. It's normal with larger crowds (over 8) for some people to want to watch and not interact.

### Constraint 2: Strong style pairing

This constraint is the key to mobbing. It's a behaviour change from "I have an idea, give me the keyboard" to "I have an idea, you take the keyboard".  Llewellyn Falco invented this style and coined it as:

> For an idea to go from your brain to the computer, you have to use someone else's hands 
> -- <cite> [Llewellyn Falco]

We want the person at the keyboard to know that their purpose is to be a conduit for the rest of the mob. They aren't there to make decisions about what we are to do next. It is merely a role of being a typist for the team. Anything they type must have been from an instruction from the rest of the mob.

When the folk in the mob are having their first turn as the typist the rest of the mob won't know what level of detail to speak to them with. Some folk will require you to say low-level details to do with line numbers and types of braces to add. Other people, you can just say "Extract this method and introduce this parameter". It can be down to familiarity with new tooling, languages and also understanding the instructions being given by the mob.

### Constraint 3: Commit to creating a safe environment

We want to avoid the situation where one or two personalities dominate all discussion in the group. It's ok for the first few minutes to be with one voice, but you want to quickly get to the point where the whole team is contributing and being heard.

Woody introduces this as:

> We make a commitment to treat each with kindness, respect and consideration
> -- <cite> [Woody Zuill]

Each word is carefully chosen. 

__Kindness__ is about being polite and expressing concern for your mob

__Respect__ is about disagreeing with ideas without attacking people. You don't want to hear "That's a stupid idea". But you also do want respectful disagreement.

__Consideration__ is about listening to other peoples ideas. Most developers are used to solving problems in their way. But now we need to work in a way where we listen to other ideas. Sometimes we can build upon them and sometimes they will conflict. If you have two options, just commit to trying one. You can revert the code if it doesn't work out and try the other idea.

It doesn't matter if these three traits aren't how you usually act. Ask attendees to pretend this is the way they do. This is how we avoid one person dominating and others feeling neglected.

So here's our three constraints:

* Use a timer
* Use strong style pairing
* Commit to making a safe environment

After the session, I include a short retrospective. No stickies, no moving or voting. Just ask each person the same two questions:

* "What worked well with our mob?"
* "What could we try to improve for next time?"

This low ceremony format gives everyone a chance to speak.

If you are looking to try out mob programming, then I'd recommend taking an afternoon with your team and try tackling a [coding kata](/coding-dojo/example-katas/). Next week work on one of the real stories that are in progress and solving that as a mob. After this, you may find you want to work as a mob more often.

If you are interested in learning more, then I recommend the [Mob Programming book](https://leanpub.com/mobprogramming) by Woody and Kevin.