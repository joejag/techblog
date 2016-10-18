---
layout: post
title: "The Text Editing Kata"
---

Today I spent 14 minutes with a team trying to convert a list of text into html elements.

That’s quite shocking.

However, I’ve found this to be not that exceptional in our industry. I often see people manually banging out lines with minor differences without trying to take advantage of their tools.

I’m determined to make this unpleasentness into a diamond from the rough. So I’m asking you to use this Kata with a team (or yourself) when you notice things being done a tad manually.

Figure out the quickest way and figure out the easiest way to solve it. Share and align your team around what process work best with your tools. After that you’ll have the text wrangling muscles for next time you encounter such a mundane task.

## The Text Editing Kata

Using the editor/tools you currently use on your project. 
Convert this list of strings into the expected html output. 

For example.

{% highlight html %}
"Dealer Options" 
{% endhighlight %}

becomes:

{% highlight html %}
<dt runat="server" id="dtDealerOptions">Dealer options</dt>
<dd runat="server" id="ddDealerOptions"></dd>


{% endhighlight %}

### The List

{% highlight bash %}
Basic Price
Discount
Sub total
Factory options
Dealer options
Fuel and mats
Road fund licence 
Number plates and delivery
Registration fees 
Sub total
Service plan
Autocare
Protect
VRI
Our Insurance
Sub total 
Customer contribution
Part exchange value
Cash back
Settlement
Sub total
Credit card handling charge
Vat
Total to pay
{% endhighlight %}

### The expected result

{% highlight html %}

<dt runat="server" id="dtBasicPrice">Basic Price</dt>
<dd runat="server" id="ddBasicPrice"></dd>

<dt runat="server" id="dtDiscount">Discount</dt>
<dd runat="server" id="ddDiscount"></dd>

<dt runat="server" id="dtSubTotal">Sub total</dt>
<dd runat="server" id="ddSubTotal"></dd>

<dt runat="server" id="dtFactoryOptions">Factory options</dt>
<dd runat="server" id="ddFactoryOptions"></dd>

<dt runat="server" id="dtDealerOptions">Dealer options</dt>
<dd runat="server" id="ddDealerOptions"></dd>

<dt runat="server" id="dtFuelAndMats">Fuel and mats</dt>
<dd runat="server" id="ddFuelAndMats"></dd>

<dt runat="server" id="dtRoadFundLicence">Road fund licence</dt>
<dd runat="server" id="ddRoadFundLicence"></dd>

<dt runat="server" id="dtNumberPlatesAndDelivery">Number plates and delivery</dt>
<dd runat="server" id="ddNumberPlatesAndDelivery"></dd>

<dt runat="server" id="dtRegistrationFees">Registration fees</dt>
<dd runat="server" id="ddRegistrationFees"></dd>

<dt runat="server" id="dtSubTotal">Sub total</dt>
<dd runat="server" id="ddSubTotal"></dd>

<dt runat="server" id="dtServicePlan">Service plan</dt>
<dd runat="server" id="ddServicePlan"></dd>

<dt runat="server" id="dtAutocare">Autocare</dt>
<dd runat="server" id="ddAutocare"></dd>

<dt runat="server" id="dtProtect">Protect</dt>
<dd runat="server" id="ddProtect"></dd>

<dt runat="server" id="dtVri">VRI</dt>
<dd runat="server" id="ddVri"></dd>

<dt runat="server" id="dtOurInsurance">Our Insurance</dt>
<dd runat="server" id="ddOurInsurance"></dd>

<dt runat="server" id="dtSubTotal">Sub total</dt>
<dd runat="server" id="ddSubTotal"></dd>

<dt runat="server" id="dtCustomerContribution">Customer contribution</dt>
<dd runat="server" id="ddCustomerContribution"></dd>

<dt runat="server" id="dtPartExchangeValue">Part exchange value</dt>
<dd runat="server" id="ddPartExchangeValue"></dd>

<dt runat="server" id="dtCashBack">Cash back</dt>
<dd runat="server" id="ddCashBack"></dd>

<dt runat="server" id="dtSettlement">Settlement</dt>
<dd runat="server" id="ddSettlement"></dd>

<dt runat="server" id="dtSubTotal">Sub total</dt>
<dd runat="server" id="ddSubTotal"></dd>

<dt runat="server" id="dtCreditCardHandlingCharge">Credit card handling charge</dt>
<dd runat="server" id="ddCreditCardHandlingCharge"></dd>

<dt runat="server" id="dtVat">Vat</dt>
<dd runat="server" id="ddVat"></dd>

<dt runat="server" id="dtTotalToPay">Total to pay</dt>
<dd runat="server" id="ddTotalToPay"></dd>


{% endhighlight %}

Good luck!
