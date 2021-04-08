---
layout: post
title: 'How to go from zero to productive in 40 minutes on a brand new Mac'
---

<p class='header-image'><img width="100%" src="{{ site.url }}/assets/2021/shattered.jpg"/>
<a class="attribution" href="https://unsplash.com/@chuttersnap?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">'top view' by CHUTTERSNAP</a></p>

Your computer just suffered a catastrophic hardware fault.

Feck.

How much work have you lost?

How long will it take you to get a new laptop set up?

For me? If you forced me to format my machine right now, I'd lose maybe an hours work, and I'd be productive again in about 40 minutes.

How?

There are a few techniques that make this possible:

1. Have a Google Chrome Account for bookmarks and plugins
1. Use GitHub (or other SasS software) for projects
1. Backup files to an S3 Bucket (or DropBox)
1. Use a password manager (LastPass / 1Paswword) to store credentials and ssh keys
1. Create a [bootstrap bash script](https://github.com/joejag/dotfiles/blob/main/go_go_mac) that installs all your software and preferences

You are hopefully doing the first four already. The fifth is a bit rarer, but it's the one that enables you to be resilient to bad luck.

The key is practicing restoring your machine before there is a crisis.

## How to go from zero to productive in 40 minutes on a brand new Mac

Before you do this, you'll want to backup all your files. I choose to copy my ssh keys and put them in my password manager as a note like:

```bash
mkdir -p ~/.ssh

echo "-----BEGIN OPENSSH PRIVATE KEY-----
ocbBH1L2EnHxAAAADmpvZUBqb2VqYWcuY29tAQIDBA
....
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQA==
-----END OPENSSH PRIVATE KEY-----" > ~/.ssh/id_rsa

echo "ssh-rsa AAAAB3Nz....Eueio1w== joe@joejag.com" > ~/.ssh/id_rsa.pub

chmod -R 400 ~/.ssh/*
```

You can copy and paste that onto a new machine rather than generate new keys and update them everywhere.

If you've got an AWS account, you can create an S3 bucket and sync a whole folder tree with:

```bash
aws s3 sync my_backup_folder s3://my.bucket
```

Then restore it in the future with:

```bash
aws s3 sync s3://my.bucket my_backup_folder
```

If you use an editor have a look to see what plugins you are using. For VSCode you can list your extensions with:

```bash
code --list-extensions
```

Then reinstall them with `code --install-extension name_of_extension`. Take a copy of your `settings.json` while you are at it.

Now I'd recommend you fork a copy of [my bootstrap script](https://github.com/joejag/dotfiles/blob/main/go_go_mac) which installs:

- Homebrew
- Command line tools: git bat ripgrep ImageMagick tree wget z
- Desktop Apps: Alfred google-chrome visual-studio-code vlc discord zoom Spotify slack iterm2 docker
- Languages: Node and Java
- oh-my-zsh
- VSCode plugins and settings
- Some Mac preferences

Hack it to make it yours and make throw it up on Github. Now we are ready to nuke your hard drive.

A great thing about Macs is they have a Recovery OS built-in. You press Command+R on startup to enter into it. Let's use that now to format your hard disk and reinstall OSx by following these two guides:

- [How to erase an Intel-based Mac](https://support.apple.com/en-gb/HT208496)
- [How to reinstall macOS](https://support.apple.com/en-gb/HT204904)

That process takes about 15 minutes on my machine. Now pull down your bash script and fire away.

Anytime you notice some software missing make sure you add it to your bootstrap script.

That's all there is to it.

I run this process once a week. Here are the average timings for each step:

- 15m Manually format disk & reinstall macOS
- 4m: Manually set up iCloud, add a user account, set up Touch Id
- 1m: Manually download install script and launch in a terminal
- 4m: Install Homebrew
- 2m: Install command-line tools
- 1m: Install Java and node
- 7m: Install desktop apps: Chrome, Docker, Spotify, Slack, VSCode
- 5m: Manually log in to Google, Twitter, Github with 2FA
- 1m: Restore files from backup

**Total time: 40m**

One place I worked was using VMs, so we had all of this in a deployment pipeline, and folks pulled down the VM image every Monday. It was great as everyone had access to the repo that creates VM to add handy tools and aliases; we had smoke tests to make sure we were happy with the new image before using it.

I hadn't realised how easy this was on Macs until my friend [Gary Fleming](https://twitter.com/garyfleming) pointed out it's possible. So thanks to Gary and Apple for making the process of resettling your machine super easy.
