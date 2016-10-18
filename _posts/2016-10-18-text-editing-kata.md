---
layout: post
title: "The Text Editing Kata"
---

Today I spent 21 minutes with a team trying to convert a list of text into html elements.

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
<dd runat="server" id="ddDealerOptions">Dealer options</dd>
<dt runat="server" id="dtDealerOptions"></dt>

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

<dd runat="server" id="ddBasicPrice">Basic Price</dt>
<dt runat="server" id="dtBasicPrice"></dt>

<dd runat="server" id="ddDiscount">Discount</dt>
<dt runat="server" id="dtDiscount"></dt>

<dd runat="server" id="ddSubTotal">Sub total</dt>
<dt runat="server" id="dtSubTotal"></dt>

<dd runat="server" id="ddFactoryOptions">Factory options</dt>
<dt runat="server" id="dtFactoryOptions"></dt>

<dd runat="server" id="ddDealerOptions">Dealer options</dt>
<dt runat="server" id="dtDealerOptions"></dt>

<dd runat="server" id="ddFuelAndMats">Fuel and mats</dt>
<dt runat="server" id="dtFuelAndMats"></dt>

<dd runat="server" id="ddRoadFundLicence">Road fund licence </dt>
<dt runat="server" id="dtRoadFundLicence"></dt>

<dd runat="server" id="ddNumberPlatesAndDelivery">Number plates and delivery</dt>
<dt runat="server" id="dtNumberPlatesAndDelivery"></dt>

<dd runat="server" id="ddRegistrationFees">Registration fees </dt>
<dt runat="server" id="dtRegistrationFees"></dt>

<dd runat="server" id="ddSubTotal">Sub total</dt>
<dt runat="server" id="dtSubTotal"></dt>

<dd runat="server" id="ddServicePlan">Service plan</dt>
<dt runat="server" id="dtServicePlan"></dt>

<dd runat="server" id="ddAutocare">Autocare</dt>
<dt runat="server" id="dtAutocare"></dt>

<dd runat="server" id="ddProtect">Protect</dt>
<dt runat="server" id="dtProtect"></dt>

<dd runat="server" id="ddVri">VRI</dt>
<dt runat="server" id="dtVri"></dt>

<dd runat="server" id="ddOurInsurance">Our Insurance</dt>
<dt runat="server" id="dtOurInsurance"></dt>

<dd runat="server" id="ddSubTotal">Sub total </dt>
<dt runat="server" id="dtSubTotal"></dt>

<dd runat="server" id="ddCustomerContribution">Customer contribution</dt>
<dt runat="server" id="dtCustomerContribution"></dt>

<dd runat="server" id="ddPartExchangeValue">Part exchange value</dt>
<dt runat="server" id="dtPartExchangeValue"></dt>

<dd runat="server" id="ddCashBack">Cash back</dt>
<dt runat="server" id="dtCashBack"></dt>

<dd runat="server" id="ddSettlement">Settlement</dt>
<dt runat="server" id="dtSettlement"></dt>

<dd runat="server" id="ddSubTotal">Sub total</dt>
<dt runat="server" id="dtSubTotal"></dt>

<dd runat="server" id="ddCreditCardHandlingCharge">Credit card handling charge</dt>
<dt runat="server" id="dtCreditCardHandlingCharge"></dt>

<dd runat="server" id="ddVat">Vat</dt>
<dt runat="server" id="dtVat"></dt>

<dd runat="server" id="ddTotalToPay">Total to pay</dt>
<dt runat="server" id="dtTotalToPay"></dt>
{% endhighlight %}

Good luck!
