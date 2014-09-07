---
layout: post
status: publish
published: true
title: New language features in Java 7
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 299
wordpress_url: http://code.joejag.com/?p=299
date: '2009-11-23 13:43:48 +0000'
date_gmt: '2009-11-23 13:43:48 +0000'
categories:
- java
tags: []
comments:
- id: 22
  author: Eric Burke
  author_email: burke.eric@gmail.com
  author_url: ''
  date: '2009-11-23 20:52:33 +0000'
  date_gmt: '2009-11-23 20:52:33 +0000'
  content: |-
    In your list and map examples, should you specify the types, as in:

    Map map = {"key" : 1};
    int value = map["key"];
- id: 23
  author: Eric Burke
  author_email: burke.eric@gmail.com
  author_url: ''
  date: '2009-11-23 20:53:22 +0000'
  date_gmt: '2009-11-23 20:53:22 +0000'
  content: |-
    OK, let's try this again:

    Should it be:

    Map<String, Integer> map = {"key" : 1};
    int value = map["key"];
- id: 24
  author: Gordon J Milne
  author_email: gjmilne@gmail.com
  author_url: ''
  date: '2009-11-23 23:29:24 +0000'
  date_gmt: '2009-11-23 23:29:24 +0000'
  content: |-
    wow, that "declare more than one resource" might have been better with this sort of syntax:

    try (
      InputStream in, OutputStream out = new FileInputStream(src),  new FileOutputStream(dest)
    ){
      body
    }

    that way you could place the tuple inside a function that returned both in, and out.
- id: 25
  author: Gordon J Milne
  author_email: gjmilne@gmail.com
  author_url: ''
  date: '2009-11-23 23:49:03 +0000'
  date_gmt: '2009-11-23 23:49:03 +0000'
  content: not that tuple support exists
- id: 26
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 00:58:47 +0000'
  date_gmt: '2009-11-24 00:58:47 +0000'
  content: |-
    @Eric Burke

    Just re-read Joshua Bloch's proposal where he has them typed like your example:
    http:&#47;&#47;mail.openjdk.java.net&#47;pipermail&#47;coin-dev&#47;2009-March&#47;001193.html

    I'll update the examples to be similar.  Cheers for the spot.

    @Gordon J Milne

    I see your reasoning. However, the classes created that you want to be closable tend to be on the verbose side.  For this reason I'd prefer the standard end of line separator.
- id: 27
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 01:02:00 +0000'
  date_gmt: '2009-11-24 01:02:00 +0000'
  content: |-
    @Eric Burke

    I actually had them in the post already!  Like your original comment, I found that Generics aren't HTML friendly.  Fixed now.
- id: 28
  author: craig
  author_email: codecraig@gmail.com
  author_url: http://www.digitalchickenscratch.com
  date: '2009-11-24 11:27:23 +0000'
  date_gmt: '2009-11-24 11:27:23 +0000'
  content: |-
    You show this for creating a set:

    Set set = {"item")

    So you start with a curly-brace and close with a parenthesis?

    or should it be parenthesis on both sides, as in:

    Set set = ("item")
- id: 29
  author: Ari
  author_email: paasar@gmail.com
  author_url: ''
  date: '2009-11-24 12:43:09 +0000'
  date_gmt: '2009-11-24 12:43:09 +0000'
  content: |-
    Interesting stuff.

    In the first example (second listing) is there a mistake?

    Set set = {"item")
    should be
    Set set = {"item"};
- id: 30
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 12:55:56 +0000'
  date_gmt: '2009-11-24 12:55:56 +0000'
  content: |-
    @Craig and @Ari (both were in moderation queue)

    It's curly brackets for Map and Set.  Square brackets for List.  I've updated the post.  Cheers for the feedback.
- id: 31
  author: Rick
  author_email: LukeWag@yahoo.com
  author_url: http://www.RickWagner.blogspot.com
  date: '2009-11-24 13:45:25 +0000'
  date_gmt: '2009-11-24 13:45:25 +0000'
  content: |-
    Thanks for the nice post, well done.

    Best Regards,

    Rick
- id: 32
  author: Stepan Koltsov
  author_email: yozh@mx1.ru
  author_url: ''
  date: '2009-11-24 15:48:32 +0000'
  date_gmt: '2009-11-24 15:48:32 +0000'
  content: |-
    try (BufferedReader br = new BufferedReader(new FileReader(path)) {
       return br.readLine();
    }

    Leak is possible here, if error occurs in BufferedReader constructor (for example, OutOfMemoryError).
- id: 33
  author: madhu
  author_email: madhukaraphatak@gmail.com
  author_url: ''
  date: '2009-11-24 15:56:27 +0000'
  date_gmt: '2009-11-24 15:56:27 +0000'
  content: where is the clousers???
- id: 34
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 16:34:15 +0000'
  date_gmt: '2009-11-24 16:34:15 +0000'
  content: |-
    @Stepan

    It's synthesizing a try{}finally{} and I don't think people catch exceptions that are of type Error.

    @madhu

    Separate JSR.  I linked to the current state of closures in the post.
- id: 35
  author: Rashmi Rajappa
  author_email: rashmi.rajappa@gmail.com
  author_url: ''
  date: '2009-11-24 16:49:43 +0000'
  date_gmt: '2009-11-24 16:49:43 +0000'
  content: |-
    Hi Joe,

    Thanks for your post. Very informative and well composed.

    I've got a question... in the following:
    try (BufferedReader br = new BufferedReader(new FileReader(path)) {
    return br.readLine();
    }

    what is the scope of variable br?
    Mainly i would like to know if add a finally to the try will it be visible?

    cheers,
    Rashmi
- id: 36
  author: bituin_star@rocketmail.com
  author_email: jologs@yahoo.com
  author_url: ''
  date: '2009-11-24 16:55:37 +0000'
  date_gmt: '2009-11-24 16:55:37 +0000'
  content: Good to know that Java is (slowly) catching up to C#
- id: 37
  author: MeBigFatGuy
  author_email: dbrosius@mebigfatguy.com
  author_url: http://fbcontrib.sf.net
  date: '2009-11-24 17:03:17 +0000'
  date_gmt: '2009-11-24 17:03:17 +0000'
  content: Hopefully switch on Strings, first switches on hashCode, and then differentiates
    from there.
- id: 38
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 17:10:11 +0000'
  date_gmt: '2009-11-24 17:10:11 +0000'
  content: |-
    @MeBigFatGuy

    That's correct.  Hashcode then Equals.
- id: 39
  author: Eug
  author_email: eshvar60@umd.edu
  author_url: ''
  date: '2009-11-24 17:14:13 +0000'
  date_gmt: '2009-11-24 17:14:13 +0000'
  content: Wow finally switch statements support strings. This has been a pet peeve
    of mine in Java for a while!
- id: 40
  author: Dondi Imperial
  author_email: afviph@yahoo.com
  author_url: ''
  date: '2009-11-24 17:28:15 +0000'
  date_gmt: '2009-11-24 17:28:15 +0000'
  content: "They way they did automatic resource management looks a little weird to
    me. They essentially added special syntax for a very small 'corner' of a normally
    (for better or worse) verbose language. In itself it looks good but looks iffy
    taken in the context of everything else in Java. \n\nAs for language support for
    collections I wonder if it turns out to be something similar to how they did arrays
    where you can to do:\nf(new int[]{1,2,3});\nor:\nint[] x = {1,2,3};\nf(x);\nbut
    not:\nf({1,2,3});\n\nI like the improved type inference and strings in switch
    though."
- id: 41
  author: Clemento
  author_email: clemento@gmail.com
  author_url: ''
  date: '2009-11-24 17:55:31 +0000'
  date_gmt: '2009-11-24 17:55:31 +0000'
  content: Why square brackets for list? (given sets and maps also use the curly brackets,
    which to my understanding, good old arrays also use?
- id: 42
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 17:59:13 +0000'
  date_gmt: '2009-11-24 17:59:13 +0000'
  content: |-
    Most other languages use square brackets for list.  You can't create an Array like this:

    return [1, 2];

    You have to:

    return new int[]{1,2};

    So there's no collision there.
- id: 43
  author: MeBigFatGuy
  author_email: dbrosius@mebigfatguy.com
  author_url: http://fbcontrib.sf.net
  date: '2009-11-24 18:27:17 +0000'
  date_gmt: '2009-11-24 18:27:17 +0000'
  content: |-
    @Joe Wright: hashcode then equals

    an interesting issue, then, perhaps... Is the hashcode value calculated at compile time for the "case labels"? If so you might run into a javac&#47;java mismatch for the impl of hashCode().

    I guess there can be no jump table implementation then, it truely must be if&#47;else&#47;if&#47;else even with hashcodes... bummer.
- id: 44
  author: MeBigFatGuy
  author_email: dbrosius@mebigfatguy.com
  author_url: http://fbcontrib.sf.net
  date: '2009-11-24 18:30:43 +0000'
  date_gmt: '2009-11-24 18:30:43 +0000'
  content: |-
    @Joe Wright

    >>Most other languages use square brackets for list. You can&rsquo;t create an Array like this:

    >> return [1, 2];

    you should be able to..(now)
- id: 45
  author: Saulo Silva
  author_email: pensador1982@yahoo.ca
  author_url: http://saulosilva.com
  date: '2009-11-24 18:46:44 +0000'
  date_gmt: '2009-11-24 18:46:44 +0000'
  content: These are without a doubt welcome, but I wonder if the closing of resources
    could have been made a little less verbose...
- id: 46
  author: Matt
  author_email: matt_viking@hotmail.com
  author_url: ''
  date: '2009-11-24 19:02:15 +0000'
  date_gmt: '2009-11-24 19:02:15 +0000'
  content: |-
    Joe:
    Quick tip, I'm colorblind and the yellow (?) in the code is almost impossible to read.  Try something darker.
- id: 47
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 19:08:53 +0000'
  date_gmt: '2009-11-24 19:08:53 +0000'
  content: |-
    Sorry about that Matt.  It's the theme I'm using for: http:&#47;&#47;shjs.sourceforge.net&#47;

    I'll see if I can find a different theme for the highlighter.  Are there any dark background ones you've found which work well?
- id: 48
  author: Kevin
  author_email: kevin.craft@hotmail.com
  author_url: ''
  date: '2009-11-24 19:57:52 +0000'
  date_gmt: '2009-11-24 19:57:52 +0000'
  content: |-
    The "Automatic Resource Management" syntax is horrible. It should be done more like C#:

    using (OutputStream out = new FileInputStream(src)) {
      &#47;&#47; do stuff here
    }

    Much more readable, IMO.
- id: 49
  author: Kevin
  author_email: kevin.craft@hotmail.com
  author_url: ''
  date: '2009-11-24 19:59:44 +0000'
  date_gmt: '2009-11-24 19:59:44 +0000'
  content: |-
    Sorry, copy&#47;paste FTW...

    Correction:

    using (OutputStream out = new FileOutputStream(src)) {
      &#47;&#47; do stuff here
    }
- id: 50
  author: Luciano Fiandesio
  author_email: info@lucianofiandesio.com
  author_url: http://www.lucianofiandesio.com
  date: '2009-11-24 20:05:10 +0000'
  date_gmt: '2009-11-24 20:05:10 +0000'
  content: Thanks for your post, a lot of this stuff is kind of available using <a
    href="http:&#47;&#47;code.google.com&#47;p&#47;google-collections&#47;" rel="nofollow">Google
    Collections</a>. Automatic Resource Management can be partially achieved using
    Project Lombok. But still, is good to see the language incorporating those features,
    so no need for external libs.
- id: 51
  author: Tariq
  author_email: tariqhaq@gmail.com
  author_url: http://thrupixels.com
  date: '2009-11-24 20:06:13 +0000'
  date_gmt: '2009-11-24 20:06:13 +0000'
  content: I have been using some of these features in C# for a long time... its good
    to see that Java language will also get these new enhancements.
- id: 52
  author: ponce
  author_email: aliloko@gmail.com
  author_url: ''
  date: '2009-11-24 20:06:36 +0000'
  date_gmt: '2009-11-24 20:06:36 +0000'
  content: Why reverse type inference ?
- id: 53
  author: wulf
  author_email: w@w.de
  author_url: ''
  date: '2009-11-24 20:16:24 +0000'
  date_gmt: '2009-11-24 20:16:24 +0000'
  content: |-
    I like pythons with keyword much better

    with exp as name {

    &#47;&#47;name is valid here

    }
- id: 54
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 20:25:48 +0000'
  date_gmt: '2009-11-24 20:25:48 +0000'
  content: |-
    @Luciano

    I do like the builder pattern used in Google collections.  We used a similar library in our own code until the Google one was released.

    @kevin

    Saying 'using' makes more sense.  But that would introduce a new keyword.

    @Tariq

    I'll take using IntelliJ Idea on all platforms over language features constrained to one.  We all take tradeoffs
- id: 55
  author: Josuah
  author_email: wesley@wesman.net
  author_url: http://www.wesman.net/~wesley/
  date: '2009-11-24 21:17:35 +0000'
  date_gmt: '2009-11-24 21:17:35 +0000'
  content: |-
    I don't really like how the collection initialization also means the collections are immutable, because there's nothing in the following code that makes me think they are (i.e. if I didn't see the initialization line, or passed it to some other function).

    I also don't like how you have to do something explicit to get Closable behavior. This seems like a hack for putting RAII into Java because nothing gets called when an object goes out of scope. Why didn't they just make it so Closable gets used when an object goes out of scope? Java already has a concept of scope.
- id: 56
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 21:26:21 +0000'
  date_gmt: '2009-11-24 21:26:21 +0000'
  content: |-
    @Josuah

    Finalize gets called when the object goes out of scope.  It doesn't happen till GC happens though.  You could end up never closing a file writer if you keep a reference to it.

    The Collections immutable feature is there because it is verbose to currently make immutable collections.  It's designed by Google who favour that approach.
- id: 57
  author: James
  author_email: james.obeirne@gmail.com
  author_url: ''
  date: '2009-11-24 21:48:25 +0000'
  date_gmt: '2009-11-24 21:48:25 +0000'
  content: |-
    Joe,
    What's the font that you're using for your code snippets? It's excellent.
    Regards,
    James
- id: 58
  author: jos
  author_email: varyatanil@yahoo.com
  author_url: ''
  date: '2009-11-24 22:02:43 +0000'
  date_gmt: '2009-11-24 22:02:43 +0000'
  content: |-
    Just a note about initializing Maps (and Lists):
    you can also do it when instantiating as follows
    Map map = new HashMap()
     {{
        put("key", 1);
     }};

    More verbose, but it's mutable.

    BTW, thanks for the post ;)
- id: 59
  author: Eric
  author_email: etorreborre@yahoo.com
  author_url: http://etorreborre.blogspot.com
  date: '2009-11-24 22:12:19 +0000'
  date_gmt: '2009-11-24 22:12:19 +0000'
  content: |-
    The ARM looks weird from a typing point of view. This means that in this statement:

    try (BufferedReader br = new BufferedReader(new FileReader(path)) {
       return br.readLine();
    }

    The compiler has to know that "BufferedReader br = new BufferedReader" is an assignment to a Closable object?

    So the compiler depends on a specific interface???

    Please correct me if I'm wrong but IMHO a much better option would have been to add call-by-name parameter (see Scala) and let people manage their resources with library calls.

    Eric.
- id: 60
  author: Ad
  author_email: adam77@gmail.com
  author_url: ''
  date: '2009-11-24 22:17:37 +0000'
  date_gmt: '2009-11-24 22:17:37 +0000'
  content: |-
    Can you do stuff like this...

    someMethod( {"e1", "e2"} );

    or are they just for initialization?
- id: 61
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 22:18:19 +0000'
  date_gmt: '2009-11-24 22:18:19 +0000'
  content: |-
    @James

    I'm using http:&#47;&#47;shjs.sourceforge.net&#47; with the DarkBlue theme.  According to my font picker it's Verdana at 12 point.
- id: 62
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 22:21:34 +0000'
  date_gmt: '2009-11-24 22:21:34 +0000'
  content: "@jos \n\nI work with Classpaths quite a lot.  You can't get away with
    making extended classes without sharing them :(\n\nI think Map map = new HashMap({key
    : value}) would work (or using putAll).  That or they'll put a Collections.mutable(list)
    method in."
- id: 63
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 22:24:12 +0000'
  date_gmt: '2009-11-24 22:24:12 +0000'
  content: |-
    @Ad

    I believe you can use them in that form.  I haven't tried it myself yet.
- id: 64
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-24 22:25:19 +0000'
  date_gmt: '2009-11-24 22:25:19 +0000'
  content: |-
    @Eric

    Yes, classes need to implement Closable.  Existing classes are being retro-fitted.  Ideally you'd have closures to handle the cleanup, while the resource is used within the block ala Ruby.
- id: 65
  author: atirado
  author_email: antonio_tirado@msn.com
  author_url: ''
  date: '2009-11-24 23:50:17 +0000'
  date_gmt: '2009-11-24 23:50:17 +0000'
  content: "@Joe Wright\n\nI&rsquo;ll take using IntelliJ Idea on all platforms over
    language features constrained to one. We all take tradeoffs\n\n------\n\nThat
    was harsh. He is making a valid point unrelated to an IDE. C# has these features
    are more. In fact, the way they are being implemented in Java looks forced (hacked
    even). ie: \n\nType inference still looks backwards (C-like, first type then variable).
    \nARM (modifications to try) don't make it more readable unless the IDE provides
    a lot of support (color coding, pretty-printing etc).\nNumeric literals from PHP
    are better, these ones dont actually make it faster to write long numbers. A combination
    of number and international units would be a lot easier (1M for one million, 1B
    for one billion, etc). \nBinary literals and strings in switch statements: about
    time!"
- id: 66
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-25 00:19:39 +0000'
  date_gmt: '2009-11-25 00:19:39 +0000'
  content: |-
    @atirado

    Pointing out a major limitation is harsh? Then I guess we must both be guilty then.

    I disagree about the type inference.  Google suggested that type inference style here, it makes sense from a Java pov given the Generics rules already in place.

    Not sure what your on about by not understanding ARM.  It looks just like a synchronized block to me.  Very simple and Java like.

    Who's billion are you talking about (UK and US differ)?  Adding measures to Java would add a lot of bulk.  It's implemented via the JScience library if people need access to them: http:&#47;&#47;jscience.org&#47;

    Strings in switch usually indicate a poor design.  Enums should almost always be used in these situations.  That's why I put it down at the bottom.
- id: 67
  author: Daniel
  author_email: rosenwad@bxscience.edu
  author_url: ''
  date: '2009-11-25 03:23:58 +0000'
  date_gmt: '2009-11-25 03:23:58 +0000'
  content: Anyone here know anything about whether LinkedList is supported?
- id: 68
  author: Josuah
  author_email: wesley@wesman.net
  author_url: http://www.wesman.net/~wesley/
  date: '2009-11-25 05:14:46 +0000'
  date_gmt: '2009-11-25 05:14:46 +0000'
  content: |-
    @Joe Wright

    Yeah, that's why I suggested scope. The compiler knows that scope is. So it wouldn't be difficult for it to generate byte code that closes a Closable when it leaves scope.

    I agree that having that special block as part of the try can be confusing, because it could easily look like part of the code to actually try (which it is, since those could throw exceptions too). I really think it would have been better for everyone if it was just based on scope.

    Collections.mutable(list) is horrible. Because it means what you thought was immutable can become mutable inside someone else's function. If you needed a mutable version of the list you'd make a copy like you can today.

    Why didn't they make it so collections initialized this way are mutable? I don't see the problem with doing so.

    Anyway, it's clear I haven't been doing Java in a long time because I mistakenly thought there was an "immutable" class type for collections. Since there isn't, my statement about it not being obvious that a collection is immutable is stupid.

    The rest of the things you listed look useful to me. I do think strings in switches can be abused, but has value as a way to handle string-based input of all kinds. In those cases, you'd have to create a big if&#47;else to map them onto an enum to use in your switch anyway.
- id: 69
  author: Brian Mock
  author_email: mock.brian@gmail.com
  author_url: http://saikocakefactory.blogspot.com/
  date: '2009-11-25 06:31:34 +0000'
  date_gmt: '2009-11-25 06:31:34 +0000'
  content: This is very win.
- id: 70
  author: Gagsy
  author_email: gagarin123@gmail.com
  author_url: http://www.gagsylive.com/
  date: '2009-11-25 06:46:09 +0000'
  date_gmt: '2009-11-25 06:46:09 +0000'
  content: Thanks for the post.
- id: 71
  author: Chris
  author_email: mouse@intranet.org
  author_url: ''
  date: '2009-11-25 06:47:49 +0000'
  date_gmt: '2009-11-25 06:47:49 +0000'
  content: |-
    I really hope that the resource management applies for JDBC connections, statments, and resultsets.  That will clear up a LOT of unnecessary boilerplate code.  I wonder if a rollback would automatically happen on a close without a commit when setAutoCommit is false.

    Thanks for the post.
- id: 72
  author: atirado
  author_email: antonio_tirado@msn.com
  author_url: ''
  date: '2009-11-25 06:57:09 +0000'
  date_gmt: '2009-11-25 06:57:09 +0000'
  content: "@Joe Wright, @Joshua\n\nI agree on the strings on switch statements, I
    use enums myself as well, however I might have missed the part in which you downplayed
    the importance of this feature due to design reasons which I agree should be more
    important.\n\nUK 1B versus US 1B: Shouldn't that depend on the locale? That way
    you just set the locale in which a program runs (if you want to tighten it that
    much) and all units&#47;measures are assumed so they make sense. \n\nOn ARM, please
    notice I didn't say they're not understandable. The purpose is clear once you
    get used to the notation and that's the point I was trying to make. The intention
    is not obvious, it makes sense once you see the usage in the 'body' of the try
    block. \n\nOn type inference what I don't like is that type inference here didn't
    help readability. As in, it doesn't look like 'this is a variable of type T',
    it is just saving you having to type the type twice. Hopefully that made sense.
    Still nice to see there's some help there.\n\nAs for the rest, all in due time
    :). It's a marathon not a race."
- id: 73
  author: Charlie
  author_email: cgardner2020@gmail.com
  author_url: ''
  date: '2009-11-25 08:29:41 +0000'
  date_gmt: '2009-11-25 08:29:41 +0000'
  content: Wow, It's smellin like 1999 in here, thank god we Created .Net instead
    of copying this crap!
- id: 74
  author: paolo
  author_email: paolo.mentonelli@gmail.com
  author_url: ''
  date: '2009-11-25 08:49:34 +0000'
  date_gmt: '2009-11-25 08:49:34 +0000'
  content: You forgot to mention the new dating&#47;time libraries...  one of the
    most important improvements IMO.
- id: 75
  author: Pascal
  author_email: pascal.got@gmail.com
  author_url: ''
  date: '2009-11-25 08:55:08 +0000'
  date_gmt: '2009-11-25 08:55:08 +0000'
  content: |-
    I see: Map&amp;ltString, Integer&amp;gt map = {&rdquo;key&rdquo; : 1};
    wouldn&rsquo;t this make more sense :
    Map&amp;ltString, Integer&amp;gt map = {&rdquo;key&rdquo;, 1};

    Since we have &lsquo;,&rsquo; between the &amp;lt&amp;gt keep it between the {}.
- id: 76
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-25 10:05:31 +0000'
  date_gmt: '2009-11-25 10:05:31 +0000'
  content: "@Josuah\n\nI can see your point.  The problem with scope is it may be
    marked as out of scope, but Java (well the JVM) isn't designed to call cleanup
    methods immediately.  \nCollections.mutable(list) would create a new array, at
    least in my contrived example, and wouldn't change the referenced one.  Thanks
    for your thoughts.\n\n@Chris\n\nJDBC connections will be included.  If you haven't
    already, you should check out JDBCTemplate in Spring.  It's a very concise way
    of using JDBC.\n\n@atirado\n\nThanks for your well reasoned reply, I agree with
    all your comments apart from the number locale one.  My customers are global as
    is my software.  The same code runs in New York, London and Hong Kong.  I would
    not like to see any mathematical errors introduced because of the location of
    the server.  Dates are enough pain already for me here.\n\nI think most languages
    have a NumberFormatter of some kind which handles displaying numbers in the current
    locale.\n\n@Charlie\n\nI see you are familiar with irony.  Try asking Alan Kay
    how he feels about innovation in current language design.\n\n@paolo\n\nI'm not
    discussing library changes here as that would take a long time.  The libraries
    are still in flux too.  String now has a Join method too.\n\n@Pascal\n\nComma
    is used to separate keys already:  {key : value, key2 : value2 }  I didn't want
    to inflate the articles example, but maybe I should have."
- id: 77
  author: Dennis
  author_email: ds2403@gmx.de
  author_url: ''
  date: '2009-11-25 10:28:09 +0000'
  date_gmt: '2009-11-25 10:28:09 +0000'
  content: Ugly source code colours, but interesting article...
- id: 78
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-25 10:46:02 +0000'
  date_gmt: '2009-11-25 10:46:02 +0000'
  content: |-
    @Dennis

    Yeah, I don't think anyone has invented a source code highlighter for Java 7 yet :)
- id: 79
  author: Deven Phillips
  author_email: deven.phillips@gmail.com
  author_url: ''
  date: '2009-11-25 10:47:33 +0000'
  date_gmt: '2009-11-25 10:47:33 +0000'
  content: AWESOME!!! I've been wanting String capabilities for the switch structure
    in Java since nearly day one... It's going to be a whole new world!!
- id: 80
  author: Mikael St&aring;ldal
  author_email: temp17@staldal.nu
  author_url: http://www.staldal.nu/tech/
  date: '2009-11-25 12:54:17 +0000'
  date_gmt: '2009-11-25 12:54:17 +0000'
  content: |-
    > List list = new ArrayList();
    > list.add("item");
    > String item = list.get(0);

    You can already (since Java 5) do like this:

    List list = Arrays.asList("item1", "item2");
- id: 81
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-25 13:02:29 +0000'
  date_gmt: '2009-11-25 13:02:29 +0000'
  content: |-
    @Mikael St&aring;ldal

    I use the Arrays.asList(..) a lot too.  If you want it to be immutable you have to put it through a Collections.immutable call as well which gets quite verbose.  Thanks for mentioning the Arrays.asList() method.
- id: 82
  author: Guillaume
  author_email: gui@gui.fr
  author_url: ''
  date: '2009-11-25 14:03:59 +0000'
  date_gmt: '2009-11-25 14:03:59 +0000'
  content: |-
    switch with Strings? bleh.
    It will only make more people write bad procedural code. Like VB6.
- id: 83
  author: Daniel Pitts
  author_email: daniel@coloraura.com
  author_url: http://virtualinfinity.net/wordpress/
  date: '2009-11-25 17:23:11 +0000'
  date_gmt: '2009-11-25 17:23:11 +0000'
  content: |-
    I think an important idiom will be:
    Map map = new HashMap({"Foo": "Bar", "Hello": "World"})
    and similar for Lists, Sets.

    @Josuah
    Variables have scope, but instances do not.

    InputStream openStream(String path) {
       InputStream myInput = new FileInputStream(path);
       readHeader(myInput);
       return myInput;
    }

    myInput will go out of scope, but closing is probably not desired at that point.


    @Guillaume
    It won't make people do anything, but it will allow them to use it where it would be better to use than an if&#47;elseif ladder.
- id: 84
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-25 17:51:14 +0000'
  date_gmt: '2009-11-25 17:51:14 +0000'
  content: Apologies to @Matt and other IE[6|7] users.  I've fixed the code backgrounds
    to have the right colour.  Should be readable now.
- id: 85
  author: huhwhat?
  author_email: huwhat@gmail.com
  author_url: ''
  date: '2009-11-25 18:34:23 +0000'
  date_gmt: '2009-11-25 18:34:23 +0000'
  content: |-
    What do you mean C heritage on the binary bits?
    C has had 0b110010010 as literals forever?
- id: 86
  author: stacy
  author_email: stacy_w_decker@yahoo.com
  author_url: ''
  date: '2009-11-25 20:37:33 +0000'
  date_gmt: '2009-11-25 20:37:33 +0000'
  content: |-
    nice updates.  I can do without underscores in my code, just looks ugly to me.

    were there any updates to the concurrent packages for collections?
- id: 87
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-25 22:28:41 +0000'
  date_gmt: '2009-11-25 22:28:41 +0000'
  content: |-
    @stacy

    I'm just concentrating on the language changes, not library changes.  There will still be a lot of library changes before the release, I'll do a post nearer the time for that.
- id: 88
  author: Alan
  author_email: banebou@yahoo.co.uk
  author_url: ''
  date: '2009-11-26 09:38:52 +0000'
  date_gmt: '2009-11-26 09:38:52 +0000'
  content: |-
    Can you do:

    List<Object> list = ["item"];

    or something similar, or will it have to be:

    List<? extends Object> list = ["item"];
- id: 89
  author: Johan Rylander
  author_email: johan@rylander.cc
  author_url: http://johanr.wordpress.com
  date: '2009-11-26 10:24:47 +0000'
  date_gmt: '2009-11-26 10:24:47 +0000'
  content: Just switch to Scala already. Java is imploding anyway
- id: 90
  author: Johan Rylander
  author_email: johan@rylander.cc
  author_url: http://johanr.wordpress.com
  date: '2009-11-26 10:26:16 +0000'
  date_gmt: '2009-11-26 10:26:16 +0000'
  content: thanks! for the info btw. Very concise and clear
- id: 91
  author: Greco
  author_email: foo@barf1.com
  author_url: ''
  date: '2009-11-26 14:21:05 +0000'
  date_gmt: '2009-11-26 14:21:05 +0000'
  content: '@Johan - harsh statement to make seeing as Scala requires Java VM to run...'
- id: 92
  author: Renato
  author_email: cherullo@gmail.com
  author_url: ''
  date: '2009-11-26 20:45:02 +0000'
  date_gmt: '2009-11-26 20:45:02 +0000'
  content: |-
    ARM is such a fugly syntax and such a fugly idea. I hate it in C#, i hate it in java.
    These objects should be closed at GC time, or when going out-of-scope. A new variable qualifier would be much better - variables in any kind of block would be able to use it, and there would be no need to even use a try statement.

    The lists and sets syntax looks alot like javascript, and I find it a good addition. The immutable thing seems like a problem at first, but in fact, together with the putAll method it&acute;s really better.

    Strings in switch statements is a god send. Parsing text files are such a pain. Of course, you could always create a hashmap associating the incoming text with the enum value and then switch based on it, but that's a complete waste of time&#47;code&#47;effort. Switching based on string.intern will be just as fast and more readable - forget hashCode for strings.

    Of course, switch based on hashCode would be able to switch over any kind of variable... seems tasty.

    The diamond... well, why not take it away altogether? A nice addition though.

    The other changes are nice. It's good to see the language evolving. Too bad this ARM thing sounds like a knee-jerk reaction to .Net - which actually grows like a tumor. On the rant side of things, I find extremely annoying that there is no trivial way to plug one InputStream into an OutputStream. The opportunities for JVM optimizations are endless.
    Good article, by the way :-)
- id: 93
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-11-26 22:50:52 +0000'
  date_gmt: '2009-11-26 22:50:52 +0000'
  content: |-
    @Renato

    Thanks for sharing your thoughts.  The case Strings have their hashcode hardcoded at compile time I believe.  That shouldn't have any performance problems.

    The ARM thing was because they weren't going to introduce closures.  Joshua Bloch pointed out that the majority of use cases can be covered by introducing features like ARM.

    I've not heard of any language which closes objects when they go out of scope.  I think they get marked for GC collection and then whenever the GC runs the object is closed&#47;collected.  This could be after an amount of time.
- id: 94
  author: Erwin
  author_email: lee.erwin@gmail.com
  author_url: ''
  date: '2009-11-27 00:13:06 +0000'
  date_gmt: '2009-11-27 00:13:06 +0000'
  content: is this C#?
- id: 95
  author: Edward Hsieh
  author_email: edwardsayer@gmail.com
  author_url: ''
  date: '2009-11-27 09:22:11 +0000'
  date_gmt: '2009-11-27 09:22:11 +0000'
  content: |-
    Is it posible to write:
    try (BufferedReader br = new BufferedReader(new FileReader(path)) {
       return br.readLine();
    }
    catch (Exception ex){
       &#47;&#47; other exception handling...
    }

    If it does, then this syntax is better than "using...".
- id: 96
  author: yurow
  author_email: yurow@163.com
  author_url: ''
  date: '2009-11-27 09:35:13 +0000'
  date_gmt: '2009-11-27 09:35:13 +0000'
  content: "same as C#! use \"try (){}\" to close  resource ?\nIs this \"try\" can
    catch some exceptions ? \nthe \"try\" is a bad keywords!"
- id: 97
  author: Greg Lloyd
  author_email: glloyd1@gmail.com
  author_url: ''
  date: '2009-11-30 03:25:37 +0000'
  date_gmt: '2009-11-30 03:25:37 +0000'
  content: I am curious if every string used as the target in a switch statement would
    get interned?
- id: 98
  author: Kyle Lahnakoski
  author_email: kyle@arcavia.com
  author_url: http://www.arcavia.com/kyle/blog
  date: '2009-11-30 09:26:13 +0000'
  date_gmt: '2009-11-30 09:26:13 +0000'
  content: "I hope the ARM will handle exceptions properly.  Namely, chain exceptions
    and aggregate exceptions, so I can diagnose what happened when things go wrong.
    \ \n\nFor example, if \"in\" fails on read, and \"in\" fails on close() along
    with \"out\" failing on close(), I had better get back all three exceptions.\n\nI
    am immensely happy with the improved type inference: I have stayed with type-free
    collections to avoid the verbosity of generics."
- id: 99
  author: chanrakanth sivaraj
  author_email: chandruibm@in.ibm.com
  author_url: ''
  date: '2009-12-01 12:21:33 +0000'
  date_gmt: '2009-12-01 12:21:33 +0000'
  content: Hi, this is about "Underscore in numeric literals", why don't the underscore
    be replaced with comma which makes more sense and more human readable. How does
    underscore make a difference from that of comma?
- id: 100
  author: Dave Rodenbaugh
  author_email: daver@skylineconsult.com
  author_url: http://lessonsoffailure.com
  date: '2009-12-01 15:42:13 +0000'
  date_gmt: '2009-12-01 15:42:13 +0000'
  content: |-
    Hi Joe,

    Thanks for your thoughts.  I posted some followup (at http:&#47;&#47;www.lessonsoffailure.com&#47;software&#47;official-java-jumped-shark ) on why Java Jumped the Shark with release 7.
- id: 101
  author: vijay
  author_email: vijayrawat.architect@gmail.com
  author_url: ''
  date: '2009-12-01 16:09:37 +0000'
  date_gmt: '2009-12-01 16:09:37 +0000'
  content: Thanks for the posting new changes in JAVA .
- id: 102
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-12-01 18:24:14 +0000'
  date_gmt: '2009-12-01 18:24:14 +0000'
  content: |-
    @chanrakanth

    In Europe a lot of languages represent numbers differently.  In the US and UK it's like 1,000.00, in France and other European countries it's 1.000,00
    I guess using underscores means you don't confuse anyone by inventing a new standard.

    @Dave Rodenbaugh

    Cheers for the reference.  I agree that if Closures don't make it in Java 7 then we'll always be wishing for the heady heights of the Java 5 release.
- id: 103
  author: Brian
  author_email: brian@crazylambs.com
  author_url: http://crazylambs.com
  date: '2009-12-04 06:16:59 +0000'
  date_gmt: '2009-12-04 06:16:59 +0000'
  content: |-
    I wonder when this will change on AP (College Board).

    Really interesting. :)
- id: 104
  author: IvanoBulo
  author_email: ivanobulo@gmail.com
  author_url: ''
  date: '2009-12-04 19:44:20 +0000'
  date_gmt: '2009-12-04 19:44:20 +0000'
  content: |-
    list and set syntax sugar and I don't like it. you can always use:

    List l = Arrays.asList(...);
    Set s = new Set(Arrays.asList(...));
    Map m = new Map() {{
    put("key1", 1);
    put("key2", 2);
    }};

    IDE can help if you still think it is too explicit. Just define few live templates.

    Don't like the new "try" statement. Why they couldn't introduce some new keyword? Looks really weird...

    Making such changes is just a waste of time to satisfy noobs and dynamic language evangelists.
- id: 105
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2009-12-04 22:29:29 +0000'
  date_gmt: '2009-12-04 22:29:29 +0000'
  content: |-
    @IvanoBulo

    These language features allow for making common thing easier.  Your map example does not work if serialization is a concern.

    There are no new keyword in Java 7.  Not sure why you think 'try' is new.

    Java is a workman's language.  Expressing the intent of code while still having the feel on Java is a good ideal.
- id: 106
  author: IvanoBulo
  author_email: ivanobulo@gmail.com
  author_url: ''
  date: '2009-12-05 09:56:30 +0000'
  date_gmt: '2009-12-05 09:56:30 +0000'
  content: |-
    If the serialization is a concern in such case then I think such code smells a little. Although it was just an example of how to minimize the efforts in most cases.

    As for the making common things easier it would be wise to put efforts on making class properties so it would automatically generate getters and setters. Or to provide build-in hash, equals and to-string builders (or even include all commons-lang). I'm also looking for easier ways to construct decorators and proxies so I could only implement methods I'm interested in and making other methods behave as a decorated&#47;proxied class.

    I'm looking for more compatibility with JavaFX technology so I could bind to existing java beans.

    Don't get me wrong, I'm not against these changes, I'm against putting them in favor of much more important things...

    There is a good phrase, in my native language, from the old times - "'better' is an enemy of 'good'". And I think the existing java syntax is good enough.
- id: 107
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: http://www.joejag.com
  date: '2009-12-05 10:28:07 +0000'
  date_gmt: '2009-12-05 10:28:07 +0000'
  content: |
    @IvanoBulo

    Thanks for returning to comment. I liked the Voltaire quote too :)

    Serialization is often used in mutli-tiered apps.  If you use an XML convertor it would also need to have the custom Hash on both sides too.

    http:&#47;&#47;projectlombok.org&#47;

    You might like Project Lombok.  Putting a @Data annotation above the class automatically makes properties&#47;equals&#47;hashcode&#47;constructor&#47;toString at compile time.  Only problem for me is that it only has Eclipse IDE support, no IntelliJ.
- id: 108
  author: Kevin McDonagh
  author_email: kevin@novod.com
  author_url: http://www.novoda.com
  date: '2009-12-13 12:07:00 +0000'
  date_gmt: '2009-12-13 12:07:00 +0000'
  content: Great rundown. Strings in switches seems so long in coming.
- id: 109
  author: Roberto Ruiz
  author_email: roberjruiz@netscape.net
  author_url: ''
  date: '2009-12-30 15:29:15 +0000'
  date_gmt: '2009-12-30 15:29:15 +0000'
  content: |-
    Collections created with the new language sintax will be inmutable?  Why? :(

    I understand those new collections will be useful whenever I can't use an array, but ... the main advantage of lists against arrays, is that lists can be modified and more important: List can grow. Without the possibility of mutating collections, language support for collections is a very uncomplete feature.
- id: 110
  author: Muhammad Ghazali
  author_email: muhammadghazali2480@gmail.com
  author_url: http://muhammadghazali.web.id/blog
  date: '2010-04-12 09:56:41 +0100'
  date_gmt: '2010-04-12 09:56:41 +0100'
  content: I'm not quite sure about "Underscores in numeric literals" will be useful
    to anybody. What do you think about this?
- id: 111
  author: Frits Jalvingh
  author_email: jal@etc.to
  author_url: ''
  date: '2010-04-28 22:24:24 +0100'
  date_gmt: '2010-04-28 22:24:24 +0100'
  content: |-
    What a joke&hellip; More than 3 years and this is what is presented as improvements&hellip;. They are not: they are minor fixes of negligible value! All important proposals have been refused and we are left with this. Java is dying from neglect, and from horrible choices.

    Young people are considering Java the new Cobol &ndash; a dying old-fashioned language that is no fun to work in. And they are right. Luckily the Java ecosystem is huge so it&rsquo;s death will take a long time. But it will come soon enough if this stagnation does not stop.

    It&rsquo;s actually very, very sad. It is very possible to extend your language in new ways as C#&rsquo;s history shows you. Its versions add possibilities that Java&rsquo;s designers apparently do not understand- so they see no value. If you leave idiots to design your language you get one only an idiot will use.

    Let&rsquo;s hope Oracle&rsquo;s takeover of Sun will out Java&rsquo;s current stewards and bring in new blood- with brains and vision. Although I fear, knowing Oracle&rsquo;s tracksheet, that this will prove not to be the case.
- id: 112
  author: Bruce
  author_email: bruce1976@gmail.com
  author_url: http://www.dobox.com/
  date: '2010-05-19 15:42:55 +0100'
  date_gmt: '2010-05-19 15:42:55 +0100'
  content: |-
    If the serialization is a concern in such case then I think such code smells a little. Although it was just an example of how to minimize the efforts in most cases.

    As for the making common things easier it would be wise to put efforts on making class properties so it would automatically generate getters and setters. Or to provide build-in hash, equals and to-string builders (or even include all commons-lang). I'm also looking for easier ways to construct decorators and proxies so I could only implement methods I'm interested in and making other methods behave as a decorated&#47;proxied class.

    I'm looking for more compatibility with JavaFX technology so I could bind to existing java beans.

    Don't get me wrong, I'm not against these changes, I'm against putting them in favor of much more important things...

    There is a good phrase, in my native language, from the old times - "'better' is an enemy of 'good'". And I think the existing java syntax is good enough.
- id: 113
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2010-05-19 16:41:56 +0100'
  date_gmt: '2010-05-19 16:41:56 +0100'
  content: |-
    @Bruce

    Check out Project Lombok.  That solves the getters&#47;setters equals&#47;hashcode problem using annotations at compile time.  It's a lovely piece of kit.
- id: 114
  author: Austin Chapman
  author_email: support@angelescriminaldefenselos.net
  author_url: http://angelescriminaldefenselos.net
  date: '2010-09-16 00:40:05 +0100'
  date_gmt: '2010-09-16 00:40:05 +0100'
  content: |-
    <i>As for the making common things easier it would be wise to put efforts on making class properties so it would automatically generate getters and setters. Or to provide build-in hash, equals and to-string builders (or even include all commons-lang). I&#8217;m also looking for easier ways to construct decorators and proxies so I could only implement methods I&#8217;m interested in and making other methods behave as a decorated&#47;proxied class.</i>
    +1
- id: 115
  author: Java7最新特性更新、代码示例及性能测试 | Java7最新资讯
  author_email: ''
  author_url: http://www.7java.com/java-7-new-release-performance-code
  date: '2010-10-09 10:40:43 +0100'
  date_gmt: '2010-10-09 10:40:43 +0100'
  content: '[...] Most of what is below come from the excellent article from Joe Wright
    on his blog about New language features in Java 7 [...]'
- id: 116
  author: Sandip Nirmal
  author_email: nirmalsandipm@gmail.com
  author_url: ''
  date: '2011-06-30 07:18:53 +0100'
  date_gmt: '2011-06-30 07:18:53 +0100'
  content: |-
    Great Article Joe. We can get the actual picture of what the features includes...

    Thanks
- id: 117
  author: Qadir
  author_email: qadir.hussain99@gmail.com
  author_url: ''
  date: '2011-07-10 11:22:17 +0100'
  date_gmt: '2011-07-10 11:22:17 +0100'
  content: Can anyone tell me how switch string is worked? I mean to say how JVM recognize
    the string in switch.
- id: 118
  author: ulaganathan
  author_email: n.ulaga@gmail.com
  author_url: ''
  date: '2011-07-14 10:22:39 +0100'
  date_gmt: '2011-07-14 10:22:39 +0100'
  content: Very Nice Work Joe.Really Useful.Could you give examples about Closures.
- id: 119
  author: Mihai
  author_email: viridium@gmail.com
  author_url: http://www.viridium.ro/
  date: '2011-07-19 14:08:07 +0100'
  date_gmt: '2011-07-19 14:08:07 +0100'
  content: |-
    ARM: hopefully you can chain "try" just like in C# you can chain "using". Like this:
    try (InputStream myFileStream = new FileInputStream(myFile))
    try (InputStream myStream = new BufferedInputStream(myFileStream)) {
        ...
    }

    Switch on strings: I don't see this as much of a benefit. Should avoid switching on strings as this is a hint of a code smell, where you're taking from the compiler's ability to find errors. Use enums or some open-ended variation thereof instead (wait, if you're switching on strings you're already enumerating a predefined set of values, not an open-ended one).
- id: 120
  author: sandip dalsaniya
  author_email: dalsaniya.sandip@gmail.com
  author_url: ''
  date: '2011-08-05 06:18:24 +0100'
  date_gmt: '2011-08-05 06:18:24 +0100'
  content: Great things done by java people. it will make work easy for developer
    to do..............
- id: 121
  author: amr negm
  author_email: amrnegm.01@gmail.com
  author_url: ''
  date: '2011-08-06 22:58:04 +0100'
  date_gmt: '2011-08-06 22:58:04 +0100'
  content: I really respect this work, but other high level languages like Scala and
    python are still easier and more productive and relatively fast. I think java
    must bigger leaps to cope with today development trend
- id: 122
  author: Lakshman Kumar P
  author_email: p.luckshman@gmail.com
  author_url: ''
  date: '2011-08-09 06:30:24 +0100'
  date_gmt: '2011-08-09 06:30:24 +0100'
  content: I&rsquo;m not sure about &ldquo;Underscores in numeric literals&rdquo;
    will be useful to anybody. I did not understand how they are useful for us?
- id: 123
  author: Mulder
  author_email: daniel.mueller@gmx.com
  author_url: ''
  date: '2011-09-27 12:46:33 +0100'
  date_gmt: '2011-09-27 12:46:33 +0100'
  content: "good stuff. like the reduced code for generics, that always seemed like
    double typing efforts! \n\nWhy one would want&#47;need Strings in switch is beyond
    me.\n\nUnderscores in large numbers is a nice gimmic but nothing else. How often
    do you use hard coded numbers anyway?\n\nIt'll be  while until i start to use
    the new way of resource cleaning."
- id: 124
  author: Jeevan Reddy
  author_email: crjeevan@gmail.com
  author_url: ''
  date: '2012-04-04 10:13:36 +0100'
  date_gmt: '2012-04-04 10:13:36 +0100'
  content: Good stuff, for generics and catch statements.
- id: 125
  author: zieke
  author_email: zieke85@gmail.com
  author_url: ''
  date: '2012-09-19 18:09:32 +0100'
  date_gmt: '2012-09-19 18:09:32 +0100'
  content: |-
    Switch with Strings is key sensitive?
     Good post.
- id: 126
  author: Java Training in Chennai
  author_email: sankar.lp.gym@gmail.com
  author_url: http://wisentechnologies.com/it-courses/java-training.aspx
  date: '2013-05-04 05:00:30 +0100'
  date_gmt: '2013-05-04 04:00:30 +0100'
  content: If any computer contains multiple processors, then we use the new feature
    of Java 7 Fork Join Framework. It is very much useful for concurrent programming
- id: 127
  author: Prathap
  author_email: gym.prathap@gmail.com
  author_url: http://wisentechnologies.com/it-courses/java-training.aspx
  date: '2013-05-04 08:29:07 +0100'
  date_gmt: '2013-05-04 07:29:07 +0100'
  content: |-
    Great work Joe. Waiting for the Java SE 8 updates.


    Prathap
    <a href="http:&#47;&#47;wisentechnologies.com&#47;it-courses&#47;java-training.aspx" rel="nofollow">Java training in chennai</a>
- id: 128
  author: Ajinkya
  author_email: Ajinkya.shahne@gmail.com
  author_url: http://javarevisited.blogspot.com
  date: '2014-01-16 10:25:25 +0000'
  date_gmt: '2014-01-16 09:25:25 +0000'
  content: Good list mate, can you do the same list for upcoming Java 8 release as
    well?
- id: 129
  author: Novidades do Java 7 - MBallem | Programando com Java
  author_email: ''
  author_url: http://php-mailgun.rhcloud.com/post/novidades-do-java-7/
  date: '2014-08-28 02:53:38 +0100'
  date_gmt: '2014-08-28 01:53:38 +0100'
  content: '[...] Artigo novidades Java 7 &ndash; New language features in Java 7
    by Joe Wright.&nbsp;http:&#47;&#47;code.joejag.com&#47;2009&#47;new-language-features-in-java-7&#47;
    [...]'
---

<p>I'm just back from the <a href="http://www.devoxx.com/">Devoxx</a> conference in Antwerp.  An update was given on the <a href="http://openjdk.java.net/projects/coin/">new language changes</a> that will be in Java 7.  The <a href="http://java.sun.com/features/jdk/7/">JDK</a> currently has a release date of September 2010.</p>
<p>Here are 7 of the new features that have been completed:</p>

<ul>
<li><del>Language support for collections</del> ( Postponed to Java 8 )</li>
<li>Automatic Resource Management</li>
<li>Improved Type Inference for Generic Instance Creation (diamond)</li>
<li>Underscores in numeric literals</li>
<li>Strings in switch</li>
<li>Binary literals</li>
<li>Simplified Varargs Method Invocation</li>
</ul>

<p>There is a lot more to Java 7 then just these language changes.  I'll be exploring the rest of the release in future posts.  One of the big debates is currently around <a href="http://www.jroller.com/scolebourne/entry/closures_in_jdk_7">Closures</a>, which are a separate JSR.</p>

<h3>Language support for collections</h3>
<p><i>This has been postponed to Java 8!  You could use <a href="{% post_url /2011-03-04-a-dsl-for-collections-in-java %}">my simple alternative</a> until then.</i></p>
<p>Java will be getting first class language support for creating collections.  The style change means that collections can be created like they are in Ruby, Perl etc.</p>
<p>Instead of:</p>

{% highlight java %}
List<String> list = new ArrayList<String>();
list.add("item");
String item = list.get(0);

Set<String> set = new HashSet<String>();
set.add("item");

Map<String, Integer> map = new HashMap<String, Integer>();
map.put("key", 1);
int value = map.get("key");
{% endhighlight %}

You will be able to use:

{% highlight java %}
List<String> list = ["item"];
String item = list[0];

Set<String> set = {"item"};

Map<String, Integer> map = {"key" : 1};
int value = map["key"];
{% endhighlight %}

<p>These collections are immutable.</p>

<h3>Automatic Resource Management</h3>
<p>Some resources in Java need to be closed manually like InputStream, Writers, Sockets, Sql classes.  This language feature allows the try statement itself to declare one of more resources.  These resources are scoped to the try block and are closed automatically.</p>
<p>This:</p>

{% highlight java %}
BufferedReader br = new BufferedReader(new FileReader(path));
try {
   return br.readLine();
} finally {
   br.close();
}
{% endhighlight %}

<p>becomes:</p>

{% highlight java %}
try (BufferedReader br = new BufferedReader(new FileReader(path)) {
   return br.readLine();
}
{% endhighlight %}

<p>You can declare more than one resource to close:</p>

{% highlight java %}
try (
   InputStream in = new FileInputStream(src);
   OutputStream out = new FileOutputStream(dest))
{
 // code
}
{% endhighlight %}
<p>To support this behaviour all closable classes will be retro-fitted to implement a <i>Closable</i> interface.</p>

<h3>Improved Type Inference for Generic Instance Creation (diamond)</h3>
<p>This is a particular annoyance which is best served with an example:</p>

{% highlight java %}
Map<String, List<String>> anagrams = new HashMap<String, List<String>>();
{% endhighlight %}
<p>becomes:</p>

{% highlight java %}
Map<String, List<String>> anagrams = new HashMap<>();
{% endhighlight %}
<p>This is called the <i>diamond operator</i>: <> which infers the type from the reference declaration.</p>

<h3>Underscores in numeric literals</h3>
<p>Long numbers are hard to read.  You can now split them up using an underscore in ints and longs:</p>

{% highlight java %}
int one_million = 1_000_000;
{% endhighlight %}

<h3>Strings in switch</h3>
<p>Currently you can only use numbers or enums in switch statements.  String has been added as a candidate:</p>

{% highlight java %}
String s = ...
switch(s) {
 case "quux":
    processQuux(s);
    // fall-through

  case "foo"
  case "bar":
    processFooOrBar(s);
    break;

  case "baz":
     processBaz(s);
     // fall-through

  default:
    processDefault(s);
    break;
}
{% endhighlight %}

<h3>Binary literals</h3>
<p>Java code, due to its C heritage, has traditionally forced programmers to represent numbers in only decimal, octal, or hexadecimal. </p>
<p>As quite a few domains are bit orientated, this restriction can introduce errors.  You can now create binary numbers using an <i>0b</i> prefix.</p>

{% highlight java %}
int binary = 0b1001_1001;
{% endhighlight %}

<h3>Simplified Varargs Method Invocation</h3>
<p>When a programmer tries to invoke a *varargs* (variable arity) method with a non-reifiable varargs type, the compiler currently generates an "unsafe operation" warning. JDK 7 moves the warning from the call site to the method declaration.  This will enable API designers to use varargs due to the reduction of warnings reported.</p>
<p>This one is slightly more involved so you are better off looking at the <a href="http:&#47;&#47;mail.openjdk.java.net&#47;pipermail&#47;coin-dev&#47;2009-March&#47;000217.html">proposal</a>.</p>
