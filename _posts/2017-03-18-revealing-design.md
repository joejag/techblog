---
layout: post
title: "Revealing Design"
---

<img width="100%" src="{{ site.url }}/assets/2017/conditionals.jpg"/>
<a style="float:right; font-style: italic; font-size: 0.8em;" href="https://www.flickr.com/photos/pulpolux/254859365/in/photolist-owdNZ-e98XJP-7zBpiN-8x6Tit-9gq1aV-KTyXKM-6HWMcN-onT84D-awxey5-aDvoMu-bnPRbF-an9HLt-aDE83D-aDTiVX-6CZ83x-aCw9Sm-4zbBAR-88Y29w-5vuTRB-98NZsv-5vzcRE-dib8wy-76So96-5Dg4MM-aXF3oK-5XmCcQ-9ZowqH-bEKuoV-dib6bo-7FupSR-dib5J1-8xUbkk-dib8K4-uaXMG-dib5k1-dib7vb-aY8xhF-7i7PXk-9oD6v-dib5VL-5vuTVe-dib9CM-9fFYxN-dib4P1-dhXfMe-dib5Tk-aY8xgM-5MNHqX-4wUaaK-dib6py">'Conditional' by Pulpolux</a>

1, 2, Fizz, 4, Fizz Buzz...

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

fizzBuzz(10) // => [ 1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz' ]
{% endhighlight %}

All done! Shall we move on? Where do you see yourself in five years time?

Actually I'd like to revisit that solution please.

I've often found that design is hidden underneath conditionals. By removing conditionals we can reveal the truth about a design that was begging to be discovered.

So how do we rewrite the above solution to no longer use conditionals?

We need to look at what FizzBuzz is all about. The contract we have is to provide a list of values that change based by some repeating rules.

The solution we currently have has one range and four conditionals. Let's start with one range.

{% highlight javascript %}
function fizzBuzz(max) {
    let result = []

    for (let i = 1; i < max + 1; i++) result.push(i);

    return result
}

fizzBuzz(10) // => [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
{% endhighlight %}

Now let's repeat the range to fill in the other values upon the result array.

{% highlight javascript %}
function fizzBuzz(max) {
    let result = []

    for (let i = 1; i < max + 1; i++) result.push(i);
    for (let i = 3; i < max + 1; i += 3) result[i - 1] = "fizz";
    for (let i = 5; i < max + 1; i += 5) result[i - 1] = "buzz";
    for (let i = 15; i < max + 1; i += 15) result[i - 1] = "fizz buzz";

    return result
}

fizzBuzz(10) // => [ 1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz' ]
{% endhighlight %}
