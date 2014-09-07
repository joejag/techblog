---
layout: page
status: publish
published: true
title: 'Coding Dojo: Christmas Delivery'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 333
wordpress_url: http://code.joejag.com/?page_id=333
date: '2009-12-08 19:55:55 +0000'
date_gmt: '2009-12-08 19:55:55 +0000'
categories: []
tags: []
comments: []
---
<h2>Christmas Delivery</h2></p>
<p>Due to huge population growth in the world, Santa Claus is having to change his existing process. </p>
<p>Currently only one Elf can put a present on his Sleigh at a time and Santa wants to be able to be able to use multiple Elves.</p>
<h3>Specification</h3></p>
<p>In order to receive presents yourself this year, you'll have to design a system to support his changing process.</p>
<h4>User Story 1</h4></p>
<p>Start off by recreating the current system Santa has.  </p>
<p>Currently his system allows a single delivery elf to move presents onto his Sleigh:</p>
<pre class="sh_ruby">
Toy Machine --> (Gives Present) -> Elf --> (Packs onto) --> Santa Sleigh<br />
</pre></p>
<p>Once a delivery elf has a present it will take him a while to put it onto Santa's Sleigh.  Once he has he calls back to say he's available to transport another present.</p>
<h4>User Story 2</h4></p>
<p>Santa has asked Mrs Claus to organise a number of delivery elves who will put presents onto his Sleigh.</p>
<p>Mrs Claus will operate as a present receiver for the Toy Machines.  She will then give these presents to the available delivery elves.  If no elves are available she will keep hold of the present until they are available.</p>
<pre class="sh_ruby">
Toy Machine [1-N] -> (Gives Present) -> Mrs Claus --> (Gives Present) -><br />
                               Elf [1-N] --> (Packs onto) --> Santa Sleigh<br />
</pre></p>
<h4>User Story 3</h4></p>
<p>Each present forms part of a families delivery, which consist of 1..N presents. </p>
<p>The Toy Machine cannot guarantee that all a families presents will be sent to Mrs Claus together.  Other families presents could come in-between.  Where possible, presents from different families should not be put on the sleigh independently.  </p>
<p>But the delivery elves are an expensive resource so we&rsquo;d prefer the requests to be interleaved rather than having them sit idle.</p>
<p>You will need to devise a strategy to allow Mrs Claus to deliver presents by family when possible.</p>
<h4>User Story 4</h4></p>
<p>Santa has just received news that some families have been very naughty during the holiday period.  He wants to be able to cancel presents for these families by telling Mrs Claus to discard their presents.</p>
<h3>Sleigh Interface</h3></p>
<p>Santa has provided this interface to represent his Sleigh.</p>
<pre class="sh_java sh_sourceCode">
public interface SantasSleigh<br />
{<br />
   void pack(Present present);<br />
}<br />
</pre></p>
