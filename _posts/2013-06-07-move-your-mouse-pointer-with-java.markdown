---
layout: post
title: Move your mouse pointer with Java
related: 
    - title: 'How to send a raw HTTP request via Java'
      url: '/2012/how-to-send-a-raw-http-request-via-java.html'
    - title: "A DSL for collections in Java"
      url: '/2011/a-dsl-for-collections-in-java.html'
    - title: 'Anti-If: The missing patterns'
      url: '/2016/anti-if-the-missing-patterns.html'
---
<p>At work we have a big TV screen with a build status being displayed. The desktop support team had a large lead time on changing the settings to stop it locking the machine every 5 minutes. This was the temporary workaround.</p>
<p>The <strong>java.awt.Robot</strong> has a few other interesting methods like taking screenshots, getting the colour under your cursor and clicking the mouse. </p>
<p>This code has no dependencies.</p>

{% highlight java %}
import java.awt.Robot;
import java.util.Random;

public class MouseMover {
    public static final int FIVE_SECONDS = 5000;
    public static final int MAX_Y = 400;
    public static final int MAX_X = 400;

    public static void main(String... args) throws Exception {
        Robot robot = new Robot();
        Random random = new Random();
        while (true) {
            robot.mouseMove(random.nextInt(MAX_X), random.nextInt(MAX_Y));
            Thread.sleep(FIVE_SECONDS);
        }
    }
}
{% endhighlight %}

I've compiled a version using Java7 which you can <a href="/assets/MouseMover.class">download</a> and use right away.
