---
layout: post
title: "Make Selenium tests illuminating by saving the browser log and a screenshot"
related: 
    - title: 'Making BDD more than tooling'
      url: '/2018/bdd-acquisition-models.html'
    - title: 'Four qualities that underpin an effective test suite'
      url: '/2018/the-four-qualities-of-a-good-test-suite.html'
    - title: "What's your problem?"
      url: '/2013/considerations-when-adopting-a-new-tool-or-practice.html'
---

Tests need  __Illumination__ to allow us to diagnose what has gone wrong. We should never have to re-run a test to figure out what the actual problem is.

One of the main culprits for tests that are hard to diagnose is Selenium tests. Because Selenium runs via a web browser rather than an isolated bit of code, more things can go wrong.

We can make our Selenium tests illuminating by adding extra information on test failure. By default Selenium will give us an exception saying it expected an element to be present which isn't. But that's hard to reason about. Ok, we expected this, but what was on the page? Was it a popup blocked it? Did our frontend code throw an exception? 

We have no idea.

The following code is available on [Github](https://github.com/joejag/selenium-java-screenshot-browser-logs-on-failure) but you can copy it into your existing code bases too. Once you are using it your exceptions will look like this:

```
=================== SCREENSHOT ========================
Saved to: /Users/you/selenium-starter/build/screenshot-goToWebPage.jpg
=======================================================
================== BROWSER LOGS =======================
Sun Jan 21 18:50:39 GMT 2018 SEVERE http://automationpractice.com/img/p/1/1-home_default2x.jpg - Failed to load resource: the server responded with a status of 404 (Not Found)
Sun Jan 21 18:50:39 GMT 2018 SEVERE http://automationpractice.com/img/p/7/7-home_default2x.jpg - Failed to load resource: the server responded with a status of 404 (Not Found)
=======================================================

org.openqa.selenium.NoSuchElementException: no such element: Unable to locate element: {"method":"partial link text" "selector":"something that isn't there"}

```

So let's see what we have to do to get to this point.

First up we have a standard test. This test is checking for something that doesn't exist, and will always fail.

{% highlight java %}
import org.junit.Test;
import org.openqa.selenium.By;

public class SampleTest extends SeleniumBase {

    @Test
    public void goToWebPage() throws Exception {
        driver.get("http://automationpractice.com/index.php");
        driver.findElement(By.partialLinkText("something that isn't there"));
    }
}
 {% endhighlight %}

You may have spotted that this class inherits from `SeleniumBase`. That's where we've added a sprinkle of magic that makes our tests more illuminating.

The first part is setting up a callback which allows us to do something when a test fails:

{% highlight java %}
public class SeleniumBase {

    // Rest of class omitted

    @Rule
    public FailureTestWatcher testWatcher = new FailureTestWatcher();

    public class FailureTestWatcher extends TestWatcher {

        protected void failed(Throwable e, Description description) {
            // Make the filename safe to write to disk
            String testName = description.getMethodName();
            String safeFileName = testName.replaceAll("[^a-zA-Z0-9-_\\.]", "_");
            takeScreenshot(safeFileName);

            logBrowserConsoleLogs();
        }
    }
}
 {% endhighlight %}

From the `failed()` method we can do anything we want. So first let's take a screenshot:


{% highlight java %}
    private void takeScreenshot(String fileName) {
        try {
            File scrFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
            File destination = new File("build/screenshot-" + fileName + ".jpg");
            Files.copy(scrFile.toPath(), destination.toPath(), REPLACE_EXISTING);

            System.out.println("=================== SCREENSHOT ========================");
            System.out.println("Saved to: " + destination.getAbsolutePath());
            System.out.println("=======================================================");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
 {% endhighlight %}

This saves a screenshot of what was available to Selenium in the `build` directory. Allowing you to see precisely what was present.

Next up let's log everything the browser console has:

{% highlight java %}
    private void logBrowserConsoleLogs() {
        System.out.println("================== BROWSER LOGS =======================");
        LogEntries logEntries = driver.manage().logs().get(LogType.BROWSER);
        for (LogEntry entry : logEntries) {
            System.out.println(new Date(entry.getTimestamp()) + " " + entry.getLevel() + " " + entry.getMessage());
        }
        System.out.println("=======================================================");
    }
 {% endhighlight %}

This is useful if you are using a frontend framework like React, Angular or copious JQuery. The errors that these libraries create will be available you in the test output.

Now we've seen the parts alone, here is the `SeleniumBase` file in full:


{% highlight java %}
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.logging.LogEntry;
import org.openqa.selenium.logging.LogType;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Date;

import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;

public class SeleniumBase {

    @Rule
    public FailureTestWatcher testWatcher = new FailureTestWatcher();

    protected static WebDriver driver;

    @BeforeClass
    public static void setupChrome(){
        System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + "/chromedrivermac");
        driver = new ChromeDriver();
    }

    @AfterClass
    public static void closeChrome(){
        driver.quit();
    }

    private void takeScreenshot(String fileName) {
        try {
            File scrFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
            File destination = new File("build/screenshot-" + fileName + ".jpg");
            Files.copy(scrFile.toPath(), destination.toPath(), REPLACE_EXISTING);

            System.out.println("=================== SCREENSHOT ========================");
            System.out.println("Saved to: " + destination.getAbsolutePath());
            System.out.println("=======================================================");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void logBrowserConsoleLogs() {
        System.out.println("================== BROWSER LOGS =======================");
        LogEntries logEntries = driver.manage().logs().get(LogType.BROWSER);
        for (LogEntry entry : logEntries) {
            System.out.println(new Date(entry.getTimestamp()) + " " + entry.getLevel() + " " + entry.getMessage());
        }
        System.out.println("=======================================================");
    }

    public class FailureTestWatcher extends TestWatcher {

        protected void failed(Throwable e, Description description) {
            // Make the filename safe to write to disk
            String testName = description.getMethodName();
            String safeFileName = testName.replaceAll("[^a-zA-Z0-9-_\\.]", "_");
            takeScreenshot(safeFileName);

            logBrowserConsoleLogs();
        }
    }
}
 {% endhighlight %}

Adding these helpers make your Selenium tests more illuminating. Happy testing.
