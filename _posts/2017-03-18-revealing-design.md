---
layout: post
title: "Revealing the design of FizzBuzz"
---

<img width="100%" src="{{ site.url }}/assets/2017/conditionals.jpg"/>
<a style="float:right; font-style: italic; font-size: 0.8em;" href="https://www.flickr.com/photos/pulpolux/254859365/in/photolist-owdNZ-e98XJP-7zBpiN-8x6Tit-9gq1aV-KTyXKM-6HWMcN-onT84D-awxey5-aDvoMu-bnPRbF-an9HLt-aDE83D-aDTiVX-6CZ83x-aCw9Sm-4zbBAR-88Y29w-5vuTRB-98NZsv-5vzcRE-dib8wy-76So96-5Dg4MM-aXF3oK-5XmCcQ-9ZowqH-bEKuoV-dib6bo-7FupSR-dib5J1-8xUbkk-dib8K4-uaXMG-dib5k1-dib7vb-aY8xhF-7i7PXk-9oD6v-dib5VL-5vuTVe-dib9CM-9fFYxN-dib4P1-dhXfMe-dib5Tk-aY8xgM-5MNHqX-4wUaaK-dib6py">'Conditional' by Pulpolux</a>

1, 2, Fizz, 4, Buzz...

Is it 'Fizz' next? The rules are seemingly simple enough:

> Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”."
> -- <cite>[Imran on Tech](https://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/)</cite>

You may have encountered FizzBuzz before. It's an exercise designed to trip up prospective job candidates.

The traditional fizzbuss.js solution looks like:

{% highlight javascript %}
function fizzBuzz(max) {
    let result = []

    for (let i = 1; i < max + 1; i++) {
        if (i % 3 == 0 && i % 5 == 0) result.push("fizz buzz")
        else if (i % 3 == 0) result.push("fizz")
        else if (i % 5 == 0) result.push("buzz")
        else result.push(i)
    }

    return result
}

fizzBuzz(15)
// => [1,2,'fizz',4,'buzz','fizz',7,8,'fizz','buzz',11,'fizz',13,14,'fizz buzz']
{% endhighlight %}

All done! Shall we move on? Where do you see yourself in five years time?

I'd like to revisit that solution, please.

I've often found that design is hidden underneath conditionals. By removing conditionals, we can reveal the truth about a design that was begging to be discovered.

So how do we rewrite the above solution to no longer use conditionals?

We need to look at what FizzBuzz is all about. The contract we have is to provide a __list of values__ that change based by some __repeating rules__.

The solution we currently have has one range and four conditionals. Let's start with one range.

{% highlight javascript %}
function fizzBuzz(max) {
    let result = []

    for (let i = 1; i < max + 1; i++) result.push(i);

    return result
}

fizzBuzz(10)
// => [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
{% endhighlight %}

Now let's repeat the range to fill in the other values upon the result array.

{% highlight javascript %}
function fizzBuzz(max) {
    var result = []

    for (var i = 1; i < max + 1; i++) result.push(i)
    for (var i = 3; i < max + 1; i += 3) result[i - 1] = "fizz"
    for (var i = 5; i < max + 1; i += 5) result[i - 1] = "buzz"
    for (var i = 15; i < max + 1; i += 15) result[i - 1] = "fizz buzz"

    return result
}

fizzBuzz(15)
// => [1,2,'fizz',4,'buzz','fizz',7,8,'fizz','buzz',11,'fizz',13,14,'fizz buzz']
{% endhighlight %}

Great. We've got no condtionals. Let's see what the Internet thinks about our solution:

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="en" dir="ltr"><a href="https://twitter.com/joe_jag">@joe_jag</a> my students will point out that there&#39;s duplication in there  :)<br><br>(How easy is it to add 7 -&gt; bang ?)</p>&mdash; The XP Surgery (@xpsurgery) <a href="https://twitter.com/xpsurgery/status/840106062820790272">March 10, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Ouch.

Let's DRY that up a bit by using the [Lodash#range](https://lodash.com/docs/4.17.4#range)

{% highlight javascript %}
var _ = require('lodash')
var range = (step, until) => _.range(step, until + 1, step)

function fizzBuzz(max) {
    var result = range(1, max)
    range(3,  max).forEach(index => result[index - 1] = "fizz")
    range(5,  max).forEach(index => result[index - 1] = "buzz")
    range(15, max).forEach(index => result[index - 1] = "fizz buzz")

    return result
}
{% endhighlight %}

But [@xpsurgery](https://twitter.com/xpsurgery) also threw in a curveball of how easy the design is to extend. Let's try adding the 'bang' rules.

{% highlight javascript %}
function fizzBuzz(max) {
    var result = range(1, max)
    range(3,  max).forEach(index => result[index - 1] = "fizz")
    range(5,  max).forEach(index => result[index - 1] = "buzz")
    range(7,  max).forEach(index => result[index - 1] = "bang")

    range(3 * 5, max).forEach(index => result[index - 1] = "fizz buzz")
    range(3 * 7, max).forEach(index => result[index - 1] = "fizz bang")
    range(5 * 7, max).forEach(index => result[index - 1] = "buzz bang")

    range(3 * 5 * 7, max).forEach(index => result[index - 1] = "fizz buzz bang")

    return result
}

fizzBuzz(15)
// => [ 1, 2, 'fizz', 4, 'buzz', 'fizz', 'bang', 8, 'fizz', 'buzz'...
{% endhighlight %}

Hmm. We got it to work. But it meant adding four new rules. If we added another rule, it'd mean adding another 5 and so on. Cleary this design isn't that good.

Drat.

But wait. Can you see the pattern that is emerging? Look at the first value we supply to range each time. We are manually creating a combination of the available numbers that FizzBuzz requires.

Wait.

We've now discovered the essential design involved in FizzBuzz.

FizzBuzz takes the available combinations for some interesting numbers and generates a list of their repeating values.

So let's try this again.

First we'll need a way of generating combinations of numbers. Thankfully npm already has [a package for this](https://www.npmjs.com/package/combinations):

{% highlight javascript %}
var combinations = require('combinations')
combinations([3,5,7])
// => [ [ 3 ], [ 5 ], [ 7 ], [ 3, 5 ], [ 3, 7 ], [ 5, 7 ], [ 3, 5, 7 ] ]
{% endhighlight %}

Let's use a value from this to generate the sort of values we are interested in:

{% highlight javascript %}
var interestingNumbers = {
        3: 'fizz',
        5: 'buzz',
        7: 'bang' }

[3, 5].map(num => interestingNumbers[num]).join(' ')
// => 'fizz buzz'
[3, 5].reduce((a, b) => a * b)
// => 15
{% endhighlight %}

So let's pull this together:

{% highlight javascript %}
var combinations = require('combinations')
var _ = require('lodash')
var range = (step, until) => _.range(step, until + 1, step)

export function fizzBuzz(max) {
    var interestingNumbers = {
        3: 'fizz',
        5: 'buzz',
        7: 'bang'
    }

    var result = range(1,  max)

    combinations((Object.keys(interestingNumbers))).forEach(group => {
        var text = group.map(num => interestingNumbers[num]).join(' ')
        var step = group.reduce((a, b) => a * b)
        range(step,  max).forEach(index => result[index - 1] = text)
    })

    return result
}
{% endhighlight %}

You've probably kicked me out of the interview by now. But I'd argue this solution better represents FizzBuzz and extra rules that follow it's inherent design.

This may seem minor here, but it real-world code this same pattern of behaviour often forces code to start mirroring real life design.

I've argued the case for [no ifs]({% post_url 2016-06-09-anti-if-the-missing-patterns %}) before. So I won't reiterate them here.

Hopefully, this post has encouraged you to try removing some conditionals from your code. If not then enjoy this [CSS solution](https://codepen.io/SachaG/pen/jCpba) instead.
