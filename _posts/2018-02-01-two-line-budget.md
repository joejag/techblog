---
layout: post
title: "Your two blank line budget for tests"
related: 
    - title: 'Making BDD more than tooling'
      url: '/2018/bdd-acquisition-models.html'
    - title: 'Make Selenium tests illuminating by saving the browser log and a screenshot'
      url: '/2018/saving-screenshots-and-browser-logs-with-selenium.html'
    - title: "Anti-If: The missing patterns"
      url: '/2016/anti-if-the-missing-patterns.html'
---

Somewhere right now a developer is putting comments into their test case. 

It's admirable. It's a desire to improve the readability of their code.

But I know of a way that can improve the test to a far greater extent. Which acts as a feedback loop on the design of your code.

But first let us have a look at the state of the commenting art.

Test case commenting comes in a few variations that are all ultimately the same. There's the Dan North inspired [Given, When, Then](http://www.blog.j-labs.pl/2017/02/Given-When-Then-pattern-in-unit-tests) version:

{% highlight csharp %}
[TestMethod]  
public void Withdraw_ValidAmount_ChangesBalance()  
{  
    // Given  
    double currentBalance = 10.0;  
    double withdrawal = 1.0;  
    double expected = 9.0;  
    var account = new CheckingAccount("JohnDoe", currentBalance);  

    // When  
    account.Withdraw(withdrawal);  
    double actual = account.Balance;  

    // Then  
    Assert.AreEqual(expected, actual);  
}  
{% endhighlight %}

The [Bill Wake](https://xp123.com/articles/3a-arrange-act-assert/) inspired Triple A of Arrange, Act, Asset:

{% highlight javascript %}
it('should do something', function() {
  //arrange...
  var dummyData = { foo: 'bar' };
  var expected = 'the result we want';
 
  //act...
  var result = functionUnderTest(dummyData);
 
  //assert...
  expect(result).to.equal(expected);
});
{% endhighlight %}

And sometimes people take it to the extreme by introducing an [actual DSL](https://github.com/jimweirich/rspec-given) for those comments:

{% highlight ruby %}
describe Stack do
  context "with one item" do
     Given(:stack) { Stack.new }

    context "when popping" do
      When(:pop_result) { stack.pop }

      Then { pop_result == :an_item }
      Then { stack.depth == 0 }
    end
  end
end
{% endhighlight %}

These names all pay homage to [Tony Hoare's](https://en.wikipedia.org/wiki/Hoare_logic) formal logic for proving that a program is correct. It comes in three sections:

* pre-conditions
* command
* post-conditions

Call it GWT or 3A, it doesn't change the anatomy of the test. All test cases follow this structure to prove their creators programs are correct.

That's my first small issue with the comments that are creeping in. They are superfluous. Every unit test you see has the same three sections. Setting up state, performing an action then looking at the result or for a side effect. Every test has this anatomy. There's no need to point it out in hundreds of comments.

So what's a better approach? Just drop the comments?

Not just drop them. Those comments improve readability when it's difficult to see where the different sections of the test lay. So let's attack the need for that by introducing a rule:

I'm going to give you a budget of __two blank lines maximum__ in your test cases.

See that setup state code spaced out over multiple lines? Not allowed.  
See the assertions spaced out over multiple lines? Not allowed.

When you remove the extra blank lines all you are left with is a wall of code. 

It's ugly. This is great news.

When you see the code is ugly it should fire a desire in you to improve it. We'll explore an example in a minute. Because you might be thinking why on earth you'd want to adopt this rule.

The two blank line budget is an __enabling constraint__. Enabling constraints are about opening up opportunities by limiting our choices.

There was once a challenge for writers to sum up their life in six words:

> I picked passion. Now I'm poor. 
> -- <cite>[Kathleen E. Whitlock]

> Alzheimer's: meeting new people every day. 
> -- <cite> [Phil Skversky]

Without these constraints they'd never create these concise pieces of work. It's about constraining breadth to get focus and depth. And that is exactly what the two blank line budget gives you.

Time to show you the money. Here is a typical example using the GWT format. 

{% highlight java %}
@Test
public void shouldDeliverCargoToDestination() {
    // Given
    Driver driver = new Driver("Teddy");
    
    Cargo cargo = new Cargo();
    
    Position destinationPosition = new Position("52.229676", "21.012228");
    
    Truck truck = new Truck();
    truck.setDriver(driver);
    truck.load(cargo);
    truck.setDestination(destinationPosition);

    // When
    truck.driveToDestination();

    // Then
    assertEquals(destinationPosition, truck.getCurrentPosition());
}
{% endhighlight %}

Our first step is to remove the blank lines between the Given statements. Then drop the comments. Leaving us with a wall of state setup.

{% highlight java %}
@Test
public void shouldDeliverCargoToDestination() {
    Driver driver = new Driver("Teddy");
    Cargo cargo = new Cargo();
    Position destinationPosition = new Position("52.229676", "21.012228");
    Truck truck = new Truck();
    truck.setDriver(driver);
    truck.load(cargo);
    truck.setDestination(destinationPosition);

    truck.driveToDestination();

    assertEquals(destinationPosition, truck.getCurrentPosition());
}
{% endhighlight %}

We've now made it ugly. So let's react to that.

I hardly ever use the [Builder pattern](http://www.natpryce.com/articles/000714.html) for production code but it's terrific for test code. It let's you fluently express object construction, leaving out unimportant details.

Let's move the state setup into a Builder and see what we have:

{% highlight java %}
@Test
public void shouldDeliverCargoToDestination() {
    Truck truck = new TruckBuilder()
                .driver("Teddy")
                .destination("52.229676", "21.012228")
                .build();

    truck.driveToDestination();

    assertEquals(new Position("52.229676", "21.012228"), truck.getCurrentPosition());
}
{% endhighlight %}

Better right? You could argue that you don't even need to know the drivers name for this test. Making it leaner. In the previous test every value seemed important, in this one it's clear what is going on.

That's what the two blank line constraint gives you. It forces you to deal with complex parts of your code, which were cosmetically fixed by adding extra blank spaces and comments.

Your tests are speaking to you now, are you going to listen?