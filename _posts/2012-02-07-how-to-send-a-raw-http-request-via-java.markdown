---
layout: post
status: publish
published: true
title: How to send a raw HTTP request via Java
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 702
wordpress_url: http://code.joejag.com/?p=702
date: '2012-02-07 22:06:32 +0000'
date_gmt: '2012-02-07 22:06:32 +0000'
categories:
- Uncategorized
tags: []
comments:
- id: 150
  author: Skyler
  author_email: skykistler@teamlucidic.com
  author_url: http://teamlucidic.com
  date: '2013-03-18 14:22:44 +0000'
  date_gmt: '2013-03-18 14:22:44 +0000'
  content: Thank you so much for this, I've been looking everywhere for something
    that doesn't try and do everything automatically for me.
- id: 151
  author: Asit
  author_email: asitkharshikar@gmail.com
  author_url: ''
  date: '2014-04-18 09:32:48 +0100'
  date_gmt: '2014-04-18 08:32:48 +0100'
  content: |-
    Maybe i did not understand your use case completely
    curl --get --include http:&#47;&#47;www.google.co.uk&#47;intl&#47;en&#47;policies&#47;privacy&#47; does not require explicit xml conversion
---
<p>While trying to figure out how a service worked I recently had to put together a Java class that let you easily replay a http conversation which had been sniffed.</p>
<p>I got bored of using telnet while making small changes to the payload and curl wants requests converted into an XML format it appears.</p>
<p>This simple socket based class lets you send a captured http request to a service.  I've removed the exception handling for brevity.</p>
<pre class="sh_java sh_sourceCode">
import java.io.*;<br />
import java.net.Socket;<br />
import java.util.ArrayList;<br />
import java.util.List;</p>
<p>public class Client {</p>
<p>    public static void main(String[] args) throws IOException {<br />
        Socket socket = new Socket(args[0], 80);</p>
<p>        BufferedWriter out = new BufferedWriter(<br />
                new OutputStreamWriter(socket.getOutputStream(), "UTF8"));<br />
        BufferedReader in = new BufferedReader(<br />
                new InputStreamReader(socket.getInputStream()));</p>
<p>        sendMessage(out, new File(args[1]));<br />
        readResponse(in);</p>
<p>        out.close();<br />
        in.close();<br />
    }</p>
<p>    private static void sendMessage(BufferedWriter out, File request) throws IOException {<br />
        System.out.println(" * Request");</p>
<p>        for (String line : getContents(request)) {<br />
            System.out.println(line);<br />
            out.write(line + "rn");<br />
        }</p>
<p>        out.write("rn");<br />
        out.flush();<br />
    }</p>
<p>    private static void readResponse(BufferedReader in) throws IOException {<br />
        System.out.println("n * Response");</p>
<p>        String line;<br />
        while ((line = in.readLine()) != null) {<br />
            System.out.println(line);<br />
        }<br />
    }</p>
<p>    private static List<String> getContents(File file) throws IOException {<br />
        List<String> contents = new ArrayList<String>();</p>
<p>        BufferedReader input = new BufferedReader(new FileReader(file));<br />
        String line;<br />
        while ((line = input.readLine()) != null) {<br />
            contents.add(line);<br />
        }<br />
        input.close();</p>
<p>        return contents;<br />
    }<br />
}<br />
</pre></p>
<p>For example.  Running this class with the parameters: "google.co.uk &#47;path&#47;to&#47;stored&#47;file" with the stored file being just:</p>
<pre class="sh_sh sh_sourceCode">
GET &#47;intl&#47;en&#47;policies&#47;privacy&#47; HTTP&#47;1.1<br />
</pre></p>
<p>Will give you this output:</p>
<pre class="sh_sh sh_sourceCode">
 * Sending<br />
GET &#47;intl&#47;en&#47;policies&#47;privacy&#47; HTTP&#47;1.1</p>
<p> * Response<br />
HTTP&#47;1.1 200 OK<br />
Vary: Accept-Encoding<br />
Content-Type: text&#47;html<br />
Last-Modified: Fri, 27 Jan 2012 17:53:03 GMT<br />
Date: Tue, 07 Feb 2012 21:40:30 GMT<br />
Expires: Tue, 07 Feb 2012 21:40:30 GMT<br />
Cache-Control: private, max-age=0<br />
X-Content-Type-Options: nosniff<br />
Server: sffe<br />
X-XSS-Protection: 1; mode=block<br />
Transfer-Encoding: chunked</p>
<p>&#47;&#47; Body content of web page<br />
<!DOCTYPE html><br />
</pre></p>
<p>For capturing payloads I recommend using <a href="http:&#47;&#47;afflib.org&#47;software&#47;tcpflow">tcpflow</a> running on the target host as "tcpflow port 80"</p>
