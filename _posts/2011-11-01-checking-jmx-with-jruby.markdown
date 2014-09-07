---
layout: post
status: publish
published: true
title: Checking JMX with JRuby
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 669
wordpress_url: http://code.joejag.com/?p=669
date: '2011-11-01 11:02:33 +0000'
date_gmt: '2011-11-01 11:02:33 +0000'
categories:
- java
- ruby
tags: []
comments:
- id: 149
  author: Thomas from JPMorgan
  author_email: bijuvargheese@gmail.com
  author_url: ''
  date: '2011-12-19 21:12:59 +0000'
  date_gmt: '2011-12-19 21:12:59 +0000'
  content: So you are back with ur tech blogs then !!! Good to see that.
---
<p>I've recently been playing around with <a href="http:&#47;&#47;jruby.org&#47;">JRuby<&#47;a> and found the switch from MRI to be hassle free.  One of the advantages of JRuby is it's portability.  You can use nearly all Ruby code straight away on the JVM without having to do any code changes, you just include the jruby jar in your classpath.</p>
<p>Another advantage is Java interoperability from JRuby (just <i>require 'java'<&#47;i>).  I've found this useful when using JMX to check certain conditions are in place while performing releases and for general monitoring.  </p>
<p>The following script uses JRuby's Java integration to walk a given ObjectName's attributes within JMX.</p>
<pre class="sh_ruby">
require 'java'</p>
<p># Return a JMX Connection<br />
def connect_to_jmx service_url, credentials<br />
	jmxUrl = javax.management.remote.JMXServiceURL.new(service_url)</p>
<p>	environment = java.util.HashMap.new<br />
	environment.put(javax.management.remote.JMXConnector.CREDENTIALS,<br />
                              credentials.to_java(:string))</p>
<p>	jmxCon = javax.management.remote.JMXConnectorFactory.connect(jmxUrl,<br />
                                                                                              environment)<br />
	return jmxCon.getMBeanServerConnection<br />
end</p>
<p># Walk the JMX tree and return the attributes.  Optionally limit to a single ObjectName<br />
def walk_tree jmx_connection, limited_to=''<br />
	names = jmx_connection.queryNames(<br />
                                           javax.management.ObjectName.new(limited_to), nil)</p>
<p>	cached = Hash.new([])</p>
<p>	names.each do |name|<br />
	   info = jmx_connection.getMBeanInfo(name)<br />
	   info.getAttributes.each do | mbi|<br />
		   attr = jmx_connection.getAttribute(name, mbi.getName)<br />
		   cached.store(name.getCanonicalName,<br />
                          cached[name.getCanonicalName] << { mbi.getName  => attr })<br />
	   end<br />
	end</p>
<p>	return cached<br />
end</p>
<p>service_url = 'host:port'<br />
credentials = ['username', 'password']<br />
jmx_connection = connect_to_jmx(service_url, credentials)</p>
<p>results = walk_tree(jmx_connection, 'java.lang:type=OperatingSystem')</p>
<p>results.each do | key, attributes |<br />
  puts ' * ' + key<br />
  attributes.each do | attr |<br />
	puts " ** #{attr.first[0]} :: #{attr.first[1]}"<br />
  end<br />
  puts<br />
end<br />
<&#47;pre></p>
<p>When invoked against a running JMX instance this will return something similar to:</p>
<pre class="sh_sh sh_sourceCode">
> jruby jmx_walker.rb<br />
 * java.lang:type=OperatingSystem<br />
 ** FreePhysicalMemorySize :: 51955511296<br />
 ** TotalPhysicalMemorySize :: 151873998848<br />
 ** Name :: Linux<br />
 ** Arch :: amd64<br />
 ** Version :: 2.6.18-194.11.4.el5<br />
 ** AvailableProcessors :: 24<br />
 ** SystemLoadAverage :: 0.49<br />
<&#47;pre></p>
<p>Hopefully this is of use to you, or inspires you to investigate JRuby a bit further.  I'd highly recommend it for Java shops who want to take advantage of Ruby's scripting ability.</p>
