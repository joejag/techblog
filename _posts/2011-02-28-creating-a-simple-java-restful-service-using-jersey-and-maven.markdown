---
layout: post
status: publish
published: true
title: Creating a simple Java RESTful service using Jersey and Maven
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 433
wordpress_url: http://code.joejag.com/?p=433
date: '2011-02-28 15:26:38 +0000'
date_gmt: '2011-02-28 15:26:38 +0000'
categories:
- java
- maven
tags: []
comments:
- id: 131
  author: Renaud
  author_email: renaud.richardet@gmail.com
  author_url: ''
  date: '2011-11-21 12:57:23 +0000'
  date_gmt: '2011-11-21 12:57:23 +0000'
  content: Thanks Joe
- id: 132
  author: Shaun Abram
  author_email: Shaun@Abram.com
  author_url: http://shaunabram.com
  date: '2012-03-30 19:43:29 +0100'
  date_gmt: '2012-03-30 19:43:29 +0100'
  content: Thanks for the post Joe, good maven&#47;RS example...
- id: 133
  author: shokal
  author_email: sokal@live.com
  author_url: ''
  date: '2012-04-09 08:18:16 +0100'
  date_gmt: '2012-04-09 08:18:16 +0100'
  content: thanks
- id: 134
  author: mule
  author_email: mules_cc@yahoo.com
  author_url: ''
  date: '2012-06-12 13:27:22 +0100'
  date_gmt: '2012-06-12 13:27:22 +0100'
  content: thanks for providing a tutorial that works!
- id: 135
  author: David
  author_email: Davedcusack@gmail.com
  author_url: ''
  date: '2012-07-11 18:00:07 +0100'
  date_gmt: '2012-07-11 18:00:07 +0100'
  content: Very good tutorial thanks alot
- id: 136
  author: Tom O'Brien
  author_email: tomo@berkeley.edu
  author_url: ''
  date: '2012-09-06 22:53:25 +0100'
  date_gmt: '2012-09-06 22:53:25 +0100'
  content: great tutorial and very helpful addition of including the jetty settings
    for running within eclipse!
- id: 137
  author: carcarlo
  author_email: cverdecchia@gmail.com
  author_url: ''
  date: '2012-09-20 09:39:34 +0100'
  date_gmt: '2012-09-20 09:39:34 +0100'
  content: Very good, thanks a lot
- id: 138
  author: Joe Mck
  author_email: josephmckevitt@hotmail.com
  author_url: ''
  date: '2013-01-23 23:56:20 +0000'
  date_gmt: '2013-01-23 23:56:20 +0000'
  content: Excellent tutorial. Keep up the good work!
- id: 139
  author: John Fadria
  author_email: johnnfadria@gmail.com
  author_url: ''
  date: '2013-02-25 18:18:51 +0000'
  date_gmt: '2013-02-25 18:18:51 +0000'
  content: |-
    Thanks Joe. Great job!!!

    How have you created the project in eclipse? With the m2eclipse plugin or running the mvn eclipse:eclipse?
- id: 140
  author: Adrien
  author_email: adrien.sales@gmail.com
  author_url: ''
  date: '2013-03-09 04:53:07 +0000'
  date_gmt: '2013-03-09 04:53:07 +0000'
  content: |-
    Excellent tutorial that makes it simple and clean with maven. Indeed i have a problem i can't figure out : how to deal to get (a not null) ServletContext in the service ?
    I 've tried a lot of methods, i always get null context and hece cannot get back parameters that have been passed (init-param) for example).
    Could you modify your code and add a dummy example of how to get back context params (jetty&#47;tomcat compatible) ?

    This would be very helpful.
- id: 141
  author: Adrien
  author_email: adrien.sales@gmail.com
  author_url: ''
  date: '2013-03-09 06:15:35 +0000'
  date_gmt: '2013-03-09 06:15:35 +0000'
  content: "Got it !\n\nin the web.xml, simply :\n\n\n    \tTHE_KEY\n    \tTHE_VALUE\n\n\nin
    the pom :\n\n         \n        \n            com.sun.jersey\n            jersey-grizzly2\n
    \           1.9.1\n        \n        \n            javax.servlet\n            servlet-api\n
    \           2.4\n        \n    \n\n\nNext, the list function becomes :\n\n@Path(\"&#47;list\")\n
    \   @GET\n    @Produces(\"text&#47;html\")\n    public String list() {\n        ServletContext
    ctx = context;\n        String test = (String) ctx.getInitParameter(\"THE_KEY\");\n
    \       System.out.println(\"Retrieved from context : \");\n\n        String header
    = \"All Ordersn\";\n\n        header += \"\";\n        for (Map.Entry order :
    orders.entrySet()) {\n            header += \"n#\" + order.getKey() + \" for \"
    + order.getValue() + \"\";\n        }\n        header += \"n\";\n        return
    header;\n    }\n\n\nAnd this is it, it's ok, the param is retrieved from the context
    when listing.\n\nThank you very much for your very useful and simple tutorial.\n\nBest
    Regards,\n\nAdrien"
- id: 142
  author: bob
  author_email: afarinello@virgilio.it
  author_url: ''
  date: '2013-03-09 10:03:57 +0000'
  date_gmt: '2013-03-09 10:03:57 +0000'
  content: Ok Joe, this tutorial is very great
- id: 143
  author: Raj
  author_email: jerome.sturt@yahoo.com
  author_url: ''
  date: '2014-04-17 06:55:10 +0100'
  date_gmt: '2014-04-17 05:55:10 +0100'
  content: |-
    Thanks for sharing such a good information...

    <a href="http:&#47;&#47;www.javatrainingchennai.co.in&#47;" rel="nofollow">JAVA Training in Chennai<&#47;a>
- id: 144
  author: jeremy
  author_email: jeremyjjbrown@yahoo.com
  author_url: ''
  date: '2014-04-23 04:08:16 +0100'
  date_gmt: '2014-04-23 03:08:16 +0100'
  content: Saved this in my bucket of quickstarts. Thanks!
- id: 145
  author: tu
  author_email: theone_21090@yahoo.com
  author_url: ''
  date: '2014-05-12 18:14:37 +0100'
  date_gmt: '2014-05-12 17:14:37 +0100'
  content: Thanks you very much, you save my life !!!
---
<p>There has been a lot of interest in <a href="http:&#47;&#47;en.wikipedia.org&#47;wiki&#47;Resource-oriented_architecture">Resource Orientated Architecture (ROA)<&#47;a> online which has resulted in an explosion of excellent libraries that make it simple to use this architectural style.</p>
<p>The example in this article uses Java, Maven and a JAX-RS library called <a href="http:&#47;&#47;jersey.java.net&#47;">Jersey<&#47;a> to create a very simple orders system. </p>
<p>Our order consists of a reference number and a customer name.  The system has three entry points:</p>
<ul>
<li>HTTP PUT to create an order
<li>HTTP GET to see the details of an order
<li>HTTP GET to see all the existing orders<br />
<&#47;ul></p>
<p>Download the full source of this article <a href='http:&#47;&#47;localhost&#47;wordpress&#47;wp-content&#47;uploads&#47;2011&#47;02&#47;orders_restful_service1.zip'>here<&#47;a>.</p>
<p>To make it simple to get it up and running I've added configuration for Jetty to run on port 9090.  You can compile the source code and run a web server to use it by issuing this single Maven command:</p>
<pre class="sh_sh sh_sourceCode">
mvn jetty:run<br />
<&#47;pre></p>
<p>I recommend that you use <a href="http:&#47;&#47;curl.haxx.se&#47;download.html">curl<&#47;a> to test your RESTful web services as it is easy to change the HTTP verb that you are using.  You can manipulate the orders system using these curl commands.  </p>
<pre class="sh_sh sh_sourceCode">
# Add a new order for Bob with ID 1<br />
curl -X PUT http:&#47;&#47;localhost:9090&#47;orders-server&#47;orders&#47;1?customer_name=bob </p>
<p># Check the status of the order<br />
curl -X GET http:&#47;&#47;localhost:9090&#47;orders-server&#47;orders&#47;1 </p>
<p># See all the orders in the system<br />
curl -X GET http:&#47;&#47;localhost:9090&#47;orders-server&#47;orders&#47;list<br />
<&#47;pre></p>
<p><i>Note: HTTP GET is the default verb used by curl, I've explicitly listed GET in the examples to make it clear which verb is in use.<&#47;i></p>
<h3>The code<&#47;h3></p>
<p>To use Jersey you need to add a servlet to your web.xml and create a resource implementation class.</p>
<h3>web.xml<&#47;h3></p>
<p>The WEB-INF&#47;web.xml fragment sets up the Jersey Servlet with a parameter listing the package to search for RESTful classes.</p>
<pre class="sh_sh sh_sourceCode">
<servlet><br />
   <servlet-name>Jersey Web Application<&#47;servlet-name><br />
   <servlet-class>com.sun.jersey.spi.container.servlet.ServletContainer<&#47;servlet-class><br />
   <init-param></p>
<param-name>com.sun.jersey.config.property.packages<&#47;param-name><br />
      <!-- Important bit --></p>
<param-value>com.joejag.code.orders.restservices<&#47;param-value><br />
   <&#47;init-param><br />
   <load-on-startup>1<&#47;load-on-startup><br />
<&#47;servlet><br />
<&#47;pre></p>
<p>This reads any classes in <i>the com.joejag.code.orders.restservices<&#47;i> and looks for annotations declaring resources.  </p>
<h3>The Java class<&#47;h3></p>
<p>On the implementation class you can see the @Path annotation on the class signature indicating the resource we are handling.  This is used by Jersey to configure the URL used to interact with the resource.</p>
<p>Each method has a sub-path declared, an HTTP verb to respond from and the response type to produce.  The method parameters are bound by using either part of the path (with @PathParam) or a separate query parameter (with @QueryParam).</p>
<pre class="sh_java sh_sourceCode">
package com.joejag.code.orders.restservices;</p>
<p>import java.util.Map;<br />
import java.util.TreeMap;</p>
<p>import javax.ws.rs.GET;<br />
import javax.ws.rs.PUT;<br />
import javax.ws.rs.Path;<br />
import javax.ws.rs.PathParam;<br />
import javax.ws.rs.Produces;<br />
import javax.ws.rs.QueryParam;<br />
import javax.ws.rs.WebApplicationException;<br />
import javax.ws.rs.core.Response;</p>
<p>@Path("orders")<br />
public class OrdersService<br />
{<br />
   &#47;&#47; Stores state simply in a static collection class.<br />
   private static Map<String, String> orders = new TreeMap<String, String>();</p>
<p>   @Path("&#47;{order}")<br />
   @PUT<br />
   @Produces("text&#47;html")<br />
   public String create(@PathParam("order") String order,<br />
                                    @QueryParam("customer_name") String customerName)<br />
   {<br />
      orders.put(order, customerName);<br />
      return "Added order #" + order;<br />
   }</p>
<p>   @Path("&#47;{order}")<br />
   @GET<br />
   @Produces("text&#47;html")<br />
   public String find(@PathParam("order") String order)<br />
   {<br />
      if (orders.containsKey(order))<br />
         return "<br />
<h2>Details on Order #" + order +<br />
                    "<&#47;h2>
<p>Customer name: " + orders.get(order);</p>
<p>      throw new WebApplicationException(Response.Status.NOT_FOUND);<br />
   }</p>
<p>   @Path("&#47;list")<br />
   @GET<br />
   @Produces("text&#47;html")<br />
   public String list()<br />
   {<br />
      String header = "<br />
<h2>All Orders<&#47;h2>n";</p>
<p>      header += "
<ul>";<br />
      for (Map.Entry<String, String> order : orders.entrySet())<br />
         header += "n
<li>#" + order.getKey() + " for " + order.getValue() + "<&#47;li>";</p>
<p>      header += "n<&#47;ul>";</p>
<p>      return header;<br />
   }<br />
}<br />
<&#47;pre></p>
<p>Download the full source of this article <a href='http:&#47;&#47;localhost&#47;wordpress&#47;wp-content&#47;uploads&#47;2011&#47;02&#47;orders_restful_service1.zip'>here<&#47;a>.</p>
<h3>Where to learn more<&#47;h3></p>
<p>There are a number of great articles on how to develop JAX-RS REST applications.  I recommend you start with the <a href="http:&#47;&#47;jersey.java.net&#47;nonav&#47;documentation&#47;latest&#47;user-guide.html#d4e8">Jersey guide<&#47;a> for Java applications:</p>
<p>If you are using Ruby then take a look at the wonderful <a href="http:&#47;&#47;www.sinatrarb.com&#47;">Sinatra<&#47;a> project.</p>
