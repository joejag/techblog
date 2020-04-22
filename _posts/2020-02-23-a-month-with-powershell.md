---
layout: post
title: 'Two months with Powershell on a UNIX'
---

Back in December, I read an article by [Jessica Joy Kerr](https://blog.jessitron.com/2019/11/27/rebase-on-the-world-personal-shell-choice/) on moving from the traditional UNIXy shells to Powershell which caught my interest. I've [changed shells](https://code.joejag.com/2014/why-zsh.html) a few times before and found an improvement each time, so I thought I'd challenge myself to two months with Powershell on Linux and Mac.

What I hadn't noticed at the time was that Jessica was using Windows. When I've been a C# developer, I found Powershell to be a great tool to use compared to the UX hell that is the usual command-line experience on Windows systems. So during this trial, I was working primarily on a Ubuntu machine and using my Mac at home.

So is it worth switching?

My first question was can I get to the minimum acceptable experience, which for me is defined by the robbyrussel theme from [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) as:

<img alt='default prompt on Zsh' width="100%" src="{{ site.url }}/assets/2014/git_prompt.jpg" />

There is an [ohmyzsh module for Powershell](https://github.com/JanDeDobbeleer/oh-my-posh), with the amusing name of 'oh my posh', but you'd be surprised to find all it does is set the prompt and misses the useful aliases and tabbing behaviour that comes from ohmyzsh. Even worse, the prompts often break when you aren't on Windows so I figured I'd try and DIY it.

Now, customising your prompt in Bash and Zsh is a matter of adding a bunch of hieroglyphics to an environment variable called [PS1](http://ezprompt.net/). It's a dark art at first. So I was quite delighted to find the creators of Powershell had eschewed the environment variable approach to replace it with a function call.

All you need to do to set your prompt in Powershell is override the `Prompt` function with whatever you want. So a minimal prompt could be:

{% highlight powershell %}

```powershell
function Prompt {
   Write-Host '>' -NoNewline
   return " "
}
```

{% endhighlight %}

Which is pretty neat, as you can add whatever you want in a straightforward way. From this, I found a Git module which provides you with a `Get-GitStatus` function, which we will come back to. With that, it was simple to add the elements that make up my preferred prompt:

{% highlight powershell %}

```powershell
function Prompt {
    # Check to see if the last command was successful
    if ($?) {
        Write-Host '➜' -NoNewline -ForegroundColor Green
    }
    else {
        Write-Host '➜' -NoNewline -ForegroundColor Red
    }

    # Write out the current directory name
    Write-Host ("  " + $(Split-Path -path $pwd  -Leaf)) -NoNewline -ForegroundColor Cyan

    # if in a git repo, print out the branch name and any changes
    $gitStatus = Get-GitStatus
    if ($gitStatus) {
        Write-Host " git:(" -NoNewline -ForegroundColor Blue
        Write-Host "$($gitStatus.Branch)" -NoNewline -ForegroundColor Red
        Write-Host ")" -NoNewline -ForegroundColor Blue

        if ($gitStatus.Working.Length -gt 0) {
            Write-Host (" " + [char]::ConvertFromUtf32(10007)) -NoNewline -ForegroundColor Yellow
        }
    }

    return " "
}
```

{% endhighlight %}

You can see my entire profile in this [gist](https://gist.github.com/joejag/9a5df82c4db2b1b43398dafa41057d88).

Another distinguishing feature of Powershell is how profiles work. Rather than searching in a myriad of profile files in `/etc` and your home directory, there is only one place to set things, which you can easily access via the `$profile` variable. So `code $profile` opens your profile, or makes a new one, in VSCode.

I mentioned using a module back there which provided `Get-GitStatus`. Powershell has a first-class module system built into itself. You can install any publically available module using `Install-Module some-module` which is excellent for organising community efforts.

The modules I've installed are:

- [posh-git](https://github.com/dahlbyk/posh-git) for `Get-GitStatus`
- [git-aliases](https://github.com/gluons/powershell-git-aliases) for the same git aliases as ohmyzsh
- [PSReadLine](https://github.com/PowerShell/PSReadLine) to recreate the tabbing behaviour from zsh (rather than Bash)
- [nvm](https://github.com/aaronpowell/ps-nvm) since `nvm` is a shell function rather than a file, this recreates it in Powershell.

An excellent module I've used on other shells is the [z](https://github.com/rupa/z) 'jump around' module. This builds a history of directories you frequent then gives you a command to quickly jump back into them. Unfortunately, the Powershell module didn't work on Linux, so [I fixed that](https://github.com/vincpa/z/pull/46).

This problem shows one of my major gripes with Powershell. It comes in two flavours, a 'desktop' edition (read: old Windows boxes) and a 'core' edition which is cross-platform. Unfortunately, the module ecosystem has folks mainly targetting the 'desktop' edition, so a lot of modules explode when you install them.

Even the [semi-official standards documents](https://github.com/PoshCode/PowerShellPracticeAndStyle/blob/master/Style-Guide/Naming-Conventions.md#avoid-the-use-of--to-represent-the-home-folde) recommending using techniques that don't work cross-platform as best practice.

Before I felt comfortable submitting a pull request to a real repository, I wanted to get used to coding in the Powershell language, which turns out to be a very nice language to use. I did the usual Roman Numerals, Bowling Scores and Urnfield problems that I do with all languages to get used to them. You can see that code [on Github](https://github.com/joejag/posh-practice).

There's even a unit testing framework called [Pester](https://github.com/pester/Pester) which makes testing possible in a modern fashion. Here is my attempt at solving the [Urnfield problem](https://code.joejag.com/coding-dojo/converting-between-different-numeral-systems/) inlined with tests.

{% highlight powershell %}

```powershell
function urnfield {
    Param([Parameter(Mandatory = $True)] $amount)
    $ones = $amount % 5
    $fives = [math]::floor($amount / 5)
    '/' * $ones + '\' * $fives
}

It 'handles numbers less than 5' {
    urnfield 1 | Should -Be '/'
    urnfield 2 | Should -Be '//'
    urnfield 3 | Should -Be '///'
    urnfield 4 | Should -Be '////'
}

It 'handles the magic 5' {
    urnfield 5 | Should -Be '\'
}

It 'handles other interesting numbers under 30' {
    urnfield 6 | Should -Be '/\'
    urnfield 29 | Should -Be '////\\\\\'
}
```

{% endhighlight %}

One of the significant advantages of Powershell is that it pipes **objects** rather than **strings** between programs. For example, if you do a `ls` in bash, it returns a string output of files. When you do that in Powershell, it returns a list of files. The default behaviour is then to print these objects.

For example, if we wanted to get the first three files from `ls` I'd do something like `ls | head -n 3`. In Powershell, it's `$(dir)[0..2]` since the `dir` command is returning an array which I can index into.

Small things like this clean up complicated pipes.

For example with the `Get-GitStatus` command you get an object back like:

```powershell
HasWorking   : True
Upstream     : origin/master
Branch       : master
UpstreamGone : False
RepoName     : techblog
AheadBy      : 0
StashCount   : 0
BehindBy     : 0
Working      : {_posts/2020-02-23-a-month-with-powershell.md, Gemfile.lock,
               _posts/2019-12-09-the-four-s-technique.md}
HasUntracked : True
HasIndex     : False
GitDir       : /home/wrightj/projects/joejag/techblog/.git
Index        : {}
```

Which you can then use, as I do for my prompt, via `$(Get-GitStatus).Branch`.

Sounds good right, but there are downsides to using Powershell on a UNIX. One of which is that commands you find on StackOverflow may not work anymore. For example, I wanted to check the TLS cert on this domain on the command line; a quick Google told me to use `echo | openssl s_client -showcerts -servername joejag.com -connect joejag.com:443 2>/dev/null | openssl x509 -inform pem -noout -text` which works fine in Bash or Zsh. Still, in Powershell, it throws an error for some reason. It's just more accessible to the other shell then work out what's wrong.

When I wrote my [zsh article](https://code.joejag.com/2014/why-zsh.html) my final question was whether you should change your default shell to Zsh over Bash. With my answer being an emphatic 'yes!'. Once I had things working well, I tried to do this with Powershell, but it's not possible. If you `cat /etc/shells` you can see what's available on your system. For me, that's:

```
# /etc/shells: valid login shells
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
/bin/zsh
/usr/bin/zsh
```

No `pwsh` in sight! This is because Powershell has not been made to work using the POSIX standard for starting shells, which involves reading some environment setup. However, they [are working on it](https://github.com/PowerShell/PowerShell-RFC/blob/master/2-Draft-Accepted/RFC0040-PowerShell-as-Login-Shell.md) and expect it to be possible when Powershell 7 comes out (I'm using Powershell 6 while writing this).

I got around this by putting `pwsh` in my bash profile to start a new shell. This isn't perfect, but the best you can do right now.

So to summarise:

- Advantages

  - Powershell is a modern scripting language which is great for writing scripts
  - First-class module ecosystem
  - It's got nice design touches like prompt as a function

- Disadvantages
  - You cannot use it as a login shell (yet)
  - UNIX systems are seen as a second class due to the legacy of Powershell 'desktop' vs 'core' versions
  - Some commands you copy and paste from online won't work

I'm going to keep using Powershell as my default shell as I enjoy learning new tools. But I can't recommend it to anyone else until most of the disadvantages are met. With PS7 coming out as a login shell and the community moving to embrace the 'core' version over 'desktop' then it'll be in a healthier place than any other shell. But we aren't there yet.
