---
layout: post
title: 'Choose one: Feature Toggles vs Authorisation'
---

Last week I was invited to two meetings on the same day. 
One organised by the security team and the other by the technical leads.
The meetings were scheduled back-to-back, so I made myself enough tea to power through.

My first meeting with the security team stressed the importance of limiting access based off a customer profile. 
Commonly known as Authorisation (what can they do?) which goes along with Authentication (who are they?). 
Allowing us to secure our applications.
We talked over how we'd add the Authorisation logic to our applications.

My second meeting was with the tech leads. 
This time we discussed how we could take advantage of [Feature Toggles](http://martinfowler.com/bliki/FeatureToggle.html) to release features to a subset of customers without needing feature branches. 
Allowing us to release early and often. 
We talked over how we'd add the Feature Toggle logic to our applications.

And then the penny dropped&hellip;

## Authorisation and Feature Toggles can have exactly the same implementation

Both ideas solve the same problem; let certain users perform these actions and users in these groups manipulate this data. 
One is for reasons of security, the other is for continuous delivery purposes. 
The solution remains the same.

Yet every application I've worked on treats them separately. 
We write the Authorisation piece at one point and the Feature Toggles at a different time and never did we use the same approach.

In our applications we can meet the needs of the security teams and the continuous delivery focused development teams at the same time.
We just need to see the two problems as the same solution.
