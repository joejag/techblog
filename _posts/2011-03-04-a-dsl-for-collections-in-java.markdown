---
layout: post
status: publish
published: true
title: A DSL for collections in Java
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 541
wordpress_url: http://code.joejag.com/?p=541
date: '2011-03-04 15:50:24 +0000'
date_gmt: '2011-03-04 15:50:24 +0000'
categories:
- java
tags: []
comments:
- id: 146
  author: Sam Barker
  author_email: sam@quadrocket.co.uk
  author_url: ''
  date: '2011-03-06 10:16:24 +0000'
  date_gmt: '2011-03-06 10:16:24 +0000'
  content: "You seem to have lost something in posting this up, as it doesn't compile
    ;) The reason I checked is I'm suspicious of your generics. \n\n&#47;&#47; Sam
    included a version that compiles here\n\nI've also simplified your implementation
    of list."
- id: 147
  author: Joe Wright
  author_email: joe@joejag.com
  author_url: ''
  date: '2011-03-06 17:52:04 +0000'
  date_gmt: '2011-03-06 17:52:04 +0000'
  content: |-
    @Sam

    Cheers for that, I forgot to escape the code.  You can see the lovely generics on display now.

    I've updated the post to use the simpler list implementation you suggested.  Thanks very much!
- id: 148
  author: Lukasz
  author_email: szczesiaklukasz@yahoo.co.uk
  author_url: ''
  date: '2011-05-18 13:39:02 +0100'
  date_gmt: '2011-05-18 13:39:02 +0100'
  content: |-
    "When writing Java code I often find it laborious to create collections using the java.util.* collection classes."

    This is exactly why you should switch to Scala :D
---
<p>When writing Java code I often find it laborious to create collections using the <i>java.util.*</i> collection classes.  To avoid this, I've been using a mini-DSL to reduce my collections code.</p>
<pre class="sh_java sh_sourceCode">
import static com.joejag.common.collections.Dsl.*;</p>
<p>&#47;&#47; A list<br />
List<String> list = list("abc", "def");</p>
<p>&#47;&#47; A set<br />
Set<String> set = set("Sleepy", "Sneezy", "Dozy");</p>
<p>&#47;&#47; A Map<br />
Map<String, Integer> map = map(entry("Joe", 28), entry("Gerry", 39));<br />
</pre></p>
<p>Here is the underlying code.</p>
<pre class="sh_java sh_sourceCode">
package com.joejag.common.collections;</p>
<p>import java.util.*;</p>
<p>public class Dsl {<br />
    public static <T> List<T> list(T... args) {<br />
        return Arrays.asList(args);<br />
    }</p>
<p>    public static <T> Set<T> set(T... args) {<br />
        Set<T> result = new HashSet<T>(args.length);<br />
        result.addAll(Arrays.asList(args));<br />
        return result;<br />
    }</p>
<p>    public static <K, V> Map<K, V> map(Entry<? extends K, ? extends V>... entries) {<br />
        Map<K, V> result = new HashMap<K, V>(entries.length);</p>
<p>        for (Entry<? extends K, ? extends V> entry : entries)<br />
            if (entry.value != null)<br />
                result.put(entry.key, entry.value);</p>
<p>        return result;<br />
    }</p>
<p>    public static <K, V> Entry<K, V> entry(K key, V value) {<br />
        return new Entry<K, V>(key, value);<br />
    }</p>
<p>    public static class Entry<K, V> {<br />
        K key;<br />
        V value;</p>
<p>        public Entry(K key, V value) {<br />
            this.key = key;<br />
            this.value = value;<br />
        }<br />
    }</p>
<p>    public static void main(String args[]) {<br />
        List<String> list = list("abc", "def");<br />
        System.out.println(list);</p>
<p>        Set<String> set = set("Sleepy", "Sneezy", "Dozy");<br />
        System.out.println(set);</p>
<p>        Map<String, Integer> map = map(entry("Joe", 28), entry("Gerry", 39));<br />
        System.out.println(map);<br />
    }<br />
}<br />
</pre></p>
<p>I've noticed that the Google Collections project has morphed into <a href="http:&#47;&#47;code.google.com&#47;p&#47;guava-libraries&#47;">Guava</a> which has great reusable code for collections and a lot of other common Java tasks.</p>
