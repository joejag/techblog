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

    <a href="http:&#47;&#47;www.javatrainingchennai.co.in&#47;" rel="nofollow">JAVA Training in Chennai</a>
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
<p>There has been a lot of interest in <a href="http:&#47;&#47;en.wikipedia.org&#47;wiki&#47;Resource-oriented_architecture">Resource Orientated Architecture (ROA)</a> online which has resulted in an explosion of excellent libraries that make it simple to use this architectural style.</p>
<p>The example in this article uses Java, Maven and a JAX-RS library called <a href="http:&#47;&#47;jersey.java.net&#47;">Jersey</a> to create a very simple orders system. </p>
<p>Our order consists of a reference number and a customer name.  The system has three entry points:</p>

<ul>
<li>HTTP PUT to create an order</li>
<li>HTTP GET to see the details of an order</li>
<li>HTTP GET to see all the existing orders</li>
</ul>

<p>Download the full source of this article <a href='{{ site.url }}/assets/2011/orders_restful_service1.zip'>here</a>.</p>
<p>To make it simple to get it up and running I've added configuration for Jetty to run on port 9090.  You can compile the source code and run a web server to use it by issuing this single Maven command:</p>

{% highlight bash %}
mvn jetty:run
{% endhighlight %}

<p>I recommend that you use <a href="http:&#47;&#47;curl.haxx.se&#47;download.html">curl</a> to test your RESTful web services as it is easy to change the HTTP verb that you are using.  You can manipulate the orders system using these curl commands.  </p>

{% highlight bash %}
# Add a new order for Bob with ID 1
curl -X PUT http://localhost:9090/orders-server/orders/1?customer_name=bob 

# Check the status of the order
curl -X GET http://localhost:9090/orders-server/orders/1 

# See all the orders in the system
curl -X GET http://localhost:9090/orders-server/orders/list
{% endhighlight %}

<p><i>Note: HTTP GET is the default verb used by curl, I've explicitly listed GET in the examples to make it clear which verb is in use.</i></p>

<h3>The code</h3>
<p>To use Jersey you need to add a servlet to your web.xml and create a resource implementation class.</p>

<h3>web.xml</h3>
<p>The WEB-INF&#47;web.xml fragment sets up the Jersey Servlet with a parameter listing the package to search for RESTful classes.</p>
{% highlight xml %}
<servlet>
  <servlet-name>Jersey Web Application</servlet-name>
  <servlet-class>com.sun.jersey.spi.container.servlet.ServletContainer</servlet-class>
  <init-param>   
    <param-name>com.sun.jersey.config.property.packages</param-name>
    <!-- Important bit -->
    <param-value>com.joejag.code.orders.restservices</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>
{% endhighlight %}

<p>This reads any classes in <i>the com.joejag.code.orders.restservices</i> and looks for annotations declaring resources.  </p>

<h3>The Java class</h3>
<p>On the implementation class you can see the @Path annotation on the class signature indicating the resource we are handling.  This is used by Jersey to configure the URL used to interact with the resource.</p>
<p>Each method has a sub-path declared, an HTTP verb to respond from and the response type to produce.  The method parameters are bound by using either part of the path (with @PathParam) or a separate query parameter (with @QueryParam).</p>

{% highlight java %}
package com.joejag.code.orders.restservices;

import java.util.Map;
import java.util.TreeMap;

import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;

@Path("orders")
public class OrdersService
{
   // Stores state simply in a static collection class.
   private static Map<String, String> orders = new TreeMap<String, String>();

   @Path("/{order}")
   @PUT
   @Produces("text/html")
   public String create(@PathParam("order") String order,
                        @QueryParam("customer_name") String customerName)
   {
      orders.put(order, customerName);
      return "Added order #" + order;
   }

   @Path("/{order}")
   @GET
   @Produces("text/html")
   public String find(@PathParam("order") String order)
   {
      if (orders.containsKey(order))
         return "<h2>Details on Order #" + order + 
                  "</h2>Customer name: " + orders.get(order);
             
      throw new WebApplicationException(Response.Status.NOT_FOUND);
   }

   @Path("/list")
   @GET
   @Produces("text/html")
   public String list()
   {
      String header = " <h2>All Orders</h2>n";

      header += "<ul>";
      for (Map.Entry<String, String> order : orders.entrySet())
         header += "\n <li>#" + order.getKey() + " for " + order.getValue() + "</li>";

      header += "\n</ul>";

      return header;
   }
}
{% endhighlight %}

<p>Download the full source of this article <a href='{{ site.url }}/assets/2011/orders_restful_service1.zip'>here</a>.</p>

<h3>Where to learn more</h3>
<p>There are a number of great articles on how to develop JAX-RS REST applications.  I recommend you start with the <a href="http:&#47;&#47;jersey.java.net&#47;nonav&#47;documentation&#47;latest&#47;user-guide.html#d4e8">Jersey guide</a> for Java applications:</p>
<p>If you are using Ruby then take a look at the wonderful <a href="http:&#47;&#47;www.sinatrarb.com&#47;">Sinatra</a> project.</p>
