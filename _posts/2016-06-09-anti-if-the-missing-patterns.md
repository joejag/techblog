---
layout: post
title: "Anti-If: The missing patterns"
---

Around 10 years ago I encountered the [anti-if campaign](http://antiifcampaign.com) and found it to be an absurd concept. How on earth would you make a useful program without using an if statement? Preposterous.

But then it gets you thinking. Do you remember that heavily nested code you had to understand last week? That kinda sucked right? If only there was a way to make it simpler.

The anti-if campaign site is sadly low on practical advice. This post intends to remedy that with a collection of patterns you can adopt when the need arises. But first let's look at the problem that if statements pose.

## The problems of if statements

The first problem with if statements is that they often make it easy to modify code in bad ways. Let's start with the birth of a new if statement:

{% highlight java %}
public void theProblem(boolean someCondition) {
        // SharedState

        if(someCondition) {
            // CodeBlockA
        } else {
            // CodeBlockB
        }
}
 {% endhighlight %}

 This isn't too bad at this point, but we've already given us some problems. When I read this code I have to check how CodeBlockA and CodeBlockB are modifying the same SharedState. This can be easy to read at first but can become difficult as the CodeBlocks grow and the coupling becomes more complicated.

 You'll often see the above CodeBlocks abused with further nested if statements and local returns. Making it hard to see what the business logic is through the routing logic.

The second problem with if statements is when they are duplicated. This means means a domain concept is missing. It's all too easy to increase coupling by bringing things together than don't need to be. Making code harder to read and change.

 The third problem with if statements is that you have to simulate execution in your own head. You must beome a mini-computer. That's taking away from your mental energy, energy that would be better spent thinking about solving the problem, rather than how the intracate code branches weave together.

I want to get to the point of telling you patterns we can do instead, but first a word of warning.

## Moderation in all things, especially moderation

If statements usually make your code more complicated. But we don't want to outright ban them. I've seen some pretty heinous code created with the goal of removing all traces of if statements. We want to avoid falling into that trap.

For each pattern we'll read about I'm going to give you a tolerance value for when to use it. 

A single if statement which isn't duplicated anywhere else is probably fine. It's when you have duplicated if statements that you want your spider sense to be tingling.

At the outside of your code base, where you talk to the dangerous outside world, you are  going to want to validate incoming responses and change your beahaviour accordingly. But inside our own codebases, where we behind those trusted gatekeepers, I think we have a great opportunity to use simple, richer and more powerful alternatives.

## Pattern 1: Boolean Params

Context: You have a method that takes a boolean which alters its behaviour

{% highlight java %}
public void example() {
    FileUtils.createFile("name.txt", "file contents", false);
    FileUtils.createFile("name_temp.txt", "file contents", true);
}

public class FileUtils {
    public static void createFile(String name, String contents, boolean temporary) {
        if(temporary) {
            // save temp file
        } else {
            // save permanent file
        }
    }
}
{% endhighlight %}

Problem: Any time you see this you actually have two methods bundled into one. That boolean represents an opportunity to name a concept in your code.

Tolerance: Usually when you see this context you can work out at compile time which path the code will take. If that is the case then always use this pattern.

Solution: Split the method into two new methods. Voilà, the if is gone.

{% highlight java %}
public void example() {
    FileUtils.createFile("name.txt", "file contents");
    FileUtils.createTemporaryFile("name_temp.txt", "file contents");
}

public class FileUtils {
    public static void createFile(String name, String contents) {
        // save permanent file
    }

    public static void createTemporaryFile(String name, String contents) {
        // save temp file
    }
}
{% endhighlight %}


## Pattern 2: Switch to Polymorphism

Context: You are switching based on type.

{% highlight java %}
public class Bird {

    private enum Species {
        EUROPEAN, AFRICAN, NORWEGIAN_BLUE;
    }

    private boolean isNailed;
    private Species type;

    public double getSpeed() {
        switch (type) {
            case EUROPEAN:
                return getBaseSpeed();
            case AFRICAN:
                return getBaseSpeed() - getLoadFactor();
            case NORWEGIAN_BLUE:
                return isNailed ? 0 : getBaseSpeed();
            default:
                return 0;
        }
    }

    private double getLoadFactor() {
        return 3;
    }

    private double getBaseSpeed() {
        return 10;
    }
}
{% endhighlight %}

Problem: When we add a new type we have to remember to update the switch statement. Additionally the cohesion is suffering in this Bird class as multiple concepts of different birds are being added.

Tolerance: A single switch on type is fine. It's when their are multiple switches then bugs can be introduced as a person adding a new type can forget to update all the switches that exist on this hidden type. There is an excellent write up on the [8thlight blog](https://blog.8thlight.com/wai-lee-chin-feman/2013/08/11/anti-anti-if.html) on this context.

Solution: Use Polymorphism. Anyone introducing a new type cannot forget to add the associated behaviour,

{% highlight java %}
public abstract class Bird {

    public abstract double getSpeed();

    protected double getLoadFactor() {
        return 3;
    }

    protected double getBaseSpeed() {
        return 10;
    }
}

public class EuropeanBird extends Bird {
    public double getSpeed() {
        return getBaseSpeed();
    }
}

public class AfricanBird extends Bird {
    public double getSpeed() {
        return getBaseSpeed() - getLoadFactor();
    }
}

public class NorwegianBird extends Bird {
    private boolean isNailed;

    public double getSpeed() {
        return isNailed ? 0 : getBaseSpeed();
    }
}
{% endhighlight %}

_note: This example only has one method being switched on for brevity, it's more compelling when there are multiple switches_

## Patten 3: NullObject/Optional over null passing

Context: A outsider asked to understand the primary purpose of your code base answers with "to check if things equal null".

{% highlight java %}
public void example() {
    sumOf(null);
}

private int sumOf(List<Integer> numbers) {
    if(numbers == null) {
        return 0;
    }

    return numbers.stream().mapToInt(i -> i).sum();
}
{% endhighlight %}

Problem: Your methods have to check if they are being passed non null values.

Tolerance: It's necessary to be defensive at the outer parts of your codebase, but being defensive inside your codebase probably means the code that you are writing is offensive. Don't write offensive code.

Solution: Use a [NullObject](https://en.wikipedia.org/wiki/Null_Object_pattern) or [Optional](https://en.wikipedia.org/wiki/Option_type) type instead of ever passing a null. An empty collection is a great alternative.

{% highlight java %}
public void example() {
    sumOf(new ArrayList<>());
}

private int sumOf(List<Integer> numbers) {
    return numbers.stream().mapToInt(i -> i).sum();
}
{% endhighlight %}

## Patten 4: Inline statements into expressions 

Context: You have an if statement tree that calculates a boolean expression.

{% highlight java %}
public boolean horrible(boolean foo, boolean bar, boolean baz) {
    if (foo) {
        if (bar) {
            return true;
        }
    }

    if (baz) {
        return true;
    } else {
        return false;
    }
}
{% endhighlight %}

Problem: This code forces you to use your brain to simulate how a computer will step through your method.

Tolerance: Very little. Code like this is easier to read on one line. Or broken into different parts.

Solution: Simplify the if statements into a single expression.

{% highlight java %}
public boolean horrible(boolean foo, boolean bar, boolean baz) {
    return foo && bar || baz;
}
{% endhighlight %}

## Pattern 5: Give a coping strategy

Context: You are calling some other code, but you aren't sure if the happy path will succeed.

{% highlight java %}
public class Repository {
    public String getRecord(int id) {
        return null; // cannot find the record
    }
}

public class Finder {
    public String displayRecord(Repository repository) {
        String record = repository.getRecord(123);
        if(record == null) {
            return "Not found";
        } else {
            return record;
        }
    }
}
{% endhighlight %}

Problem: These sort of if statements multiply each time you deal with the same object or data structure. They have a hidden coupling where 'null' means someting. Other objects may return other magic values that mean no result.

Tolerance: It's better to push this if statement into one place, so it isn't duplicated and we can remove the coupling on the empty object magic value.

Solution: Give the code being called a coping strategy. Ruby's [Hash#fetch](http://ruby-doc.org/core-2.2.0/Hash.html#method-i-fetch) is a good example which [Java has copied](https://docs.oracle.com/javase/8/docs/api/java/util/Map.html#getOrDefault-java.lang.Object-V-). This pattern can be taken even [further to remove exceptions](https://silkandspinach.net/2014/11/06/on-paperboys-newsagents-and-exceptions/).

{% highlight java %}
private class Repository {
    public String getRecord(int id, String defaultValue) {
        String result = Db.getRecord(id);

        if (result != null) {
            return result;
        }
        
        return defaultValue;
    }
}

public class Finder {
    public String displayRecord(Repository repository) {
        return repository.getRecord(123, "Not found");
    }
}
{% endhighlight %}


## Happy hunting

Hopefully you can use some of these patterns on the code you are working on just now. I find them useful when refactoring code to better understand it.

Remember if statements aren't all evil. But we have a rich set of features in modern languages to use instead which we should take advantage of.


