---
layout: post
title: How to send a raw HTTP request via Java
related: 
    - title: 'Move your mouse pointer with Java'
      url: '/2013/move-your-mouse-pointer-with-java.html'
    - title: "A DSL for collections in Java"
      url: '/2011/a-dsl-for-collections-in-java.html'
    - title: 'Anti-If: The missing patterns'
      url: '/2016/anti-if-the-missing-patterns.html'
---
<p>While trying to figure out how a service worked I recently had to put together a Java class that let you easily replay a http conversation which had been sniffed.</p>
<p>I got bored of using telnet while making small changes to the payload and curl wants requests converted into an XML format it appears.</p>
<p>This simple socket based class lets you send a captured http request to a service.  I've removed the exception handling for brevity.</p>

{% highlight java %}

import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class Client {
    public static void main(String[] args) throws IOException {
        Socket socket = new Socket(args[0], 80);
        
        BufferedWriter out = new BufferedWriter(
                new OutputStreamWriter(socket.getOutputStream(), "UTF8"));
        BufferedReader in = new BufferedReader(
                new InputStreamReader(socket.getInputStream()));
                
        sendMessage(out, new File(args[1]));
        readResponse(in);
        
        out.close();
        in.close();
    }
    
    private static void sendMessage(BufferedWriter out, File request) throws IOException {<br />
        System.out.println(" * Request");
        
        for (String line : getContents(request)) {
            System.out.println(line);
            out.write(line + "\r\n");
        }
        
        out.write("\r\n");
        out.flush();
    }
    
    private static void readResponse(BufferedReader in) throws IOException {
        System.out.println("\n * Response");
        
        String line;
        while ((line = in.readLine()) != null) {
            System.out.println(line);
        }
    }
    
    private static List<String> getContents(File file) throws IOException {
        List<String> contents = new ArrayList<String>();
        
        BufferedReader input = new BufferedReader(new FileReader(file));
        String line;
        while ((line = input.readLine()) != null) {
            contents.add(line);
        }
        input.close();
        
        return contents;
    }
}
{% endhighlight %}

<p>For example.  Running this class with the parameters: "google.co.uk /path/to/stored/file" with the stored file being just:</p>
{% highlight bash %}
GET /intl/en/policies/privacy/ HTTP/1.1
{% endhighlight %}

<p>Will give you this output:</p>

{% highlight bash %}
 * Sending
GET /intl/en/policies/privacy/ HTTP/1.1

* Response
HTTP/1.1 200 OK
Vary: Accept-Encoding
Content-Type: text/html
Last-Modified: Fri, 27 Jan 2012 17:53:03 GMT
Date: Tue, 07 Feb 2012 21:40:30 GMT
Expires: Tue, 07 Feb 2012 21:40:30 GMT
Cache-Control: private, max-age=0
X-Content-Type-Options: nosniff
Server: sffe
X-XSS-Protection: 1; mode=block
Transfer-Encoding: chunked

// Body content of web page
<!DOCTYPE html
{% endhighlight %}

<p>For capturing payloads I recommend using <a href="http://afflib.org/software/tcpflow">tcpflow</a> running on the target host as "tcpflow port 80"</p>
