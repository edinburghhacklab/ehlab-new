---
title: "Easy Version Control: Git on Dropbox"
date: 2012-11-10
categories: 
  - "software"
---

[![](images/profilevmr.jpg "TomLarkworthy")](http://imageshack.us/photo/my-images/33/profilevmr.jpg/ "ImageShack - Image And Video Hosting")

The problem: you need to share files with people on an _ad hoc_ basis for a project.

One choice is sharing files with Dropbox. On the plus side of Dropbox is it's ease of use, however, there is a drawback that if you work on the same files you get _"My conflicted copy of x"_ spawning everywhere and making a mess. If you are coding you will trip over other author' changes.

To work around that problem you need version control. But that can come with baggage. You'll need a server to run a git/svn/cvs (infrastructure), or a project on GitHub/sourceforge/google code (open source requirement, or pro account). Some projects don't have these resources or freedoms, so they do without version control, but there is another way...

You can run the best version control software from inside a [Dropbox](https://www.dropbox.com/) folder! (or [Google Drive](http://drive.google.com/)) Running [git](http://git-scm.com/) from a Dropbox folder does not require spending money, having a server or open sourcing files. Because git compresses its repositories, it also reduces your Dropbox quota usage. Awesome! And it is easy to install. In this article I will show you how to set everything up properly, and give you a quick user guide to git incase you (or your collaborators)  have not used it before. By the end you should be able to setup and use git like a true intermediate. <!--more-->

### Installation

Let ~/Dropbox/ be a directory in your Dropbox system (syncs with everyone the folder is shared with)

So you have a local project on

```
  ~/myproject/
```

that you want to share with everybody. Initialise the .git database with

```
  cd ~/myproject/
  git init
```

then add everything in the current directory into the git version control (add a .gitignore filter first if you want one)

```
  git add .
  git commit -m "Yo my first commit"
```

clone the database and send it to a Dropbox folder to create ~/Dropbox/myproject/

```
  cd ~/Dropbox/
  git clone --bare -n ~/myproject/
```

NOTE: You now have the version control setup, but ~/myproject is UPSTREAM of ~/Dropbox/myproject/ Move it elsewhere for now (and delete it later)

```
  mv ~/myproject/ ~/myproject-backup/
```

### Clone the repository

the directory ~/myproject will be created and will be the working copy that is actively edited on every team members local machine

```
  cd ~
  git clone ~/Dropbox/myproject/
```

Tada! Now some basics of git to get everyone started

### Add/Update a file

Use git status copiously and understand it

create a file call test.txt

```
  cd ~/myproject/
  git status
  git add test.txt
  git status
  git commit -m "test I can add stuff"
  git status
```

At this point the file test.txt is known by the git database locally but not by the Dropbox system (_"Your branch is ahead of 'origin/master' by 1 commit."_). So you're collaborators can't access it until you push it.

```
  git push
```

Note that after a push the Dropbox will show some activity as the ~/Dropbox folder has just been written to. Once everyone's Dropbox has synced they can pull it. If you can't push it might because someone else has modified the repository and you need to do a pull first.

The git philosophy is commit often (locally) every atomic piece of functionality you do. When you are ready to share a collections of changes with everybody, do a push.

### Pull everyones changes

To pull the repo (kinda like svn update), and merge with your local changes

```
  cd ~/myproject
  git pull
```

### Merge resolution (God forbid)

```
 From /home/tom/Dropbox/myproject
 c642398..2609f26 master -> origin/master
 Auto-merging test.txt
 CONFLICT (content): Merge conflict in test.txt
 Automatic merge failed; fix conflicts and then commit the result.
```

I don't expect this to happen often as when git merges it normally does a good job. There is clever stuff you can do when you have problems. However, the main reaction of users in the wild when confronted by merge problems is to delete all changes except one master copy. This is how you do that style of merge conflict (the one everyone can understand) on the computer with the master copy.

If you have just done a git pull and a load of muck has appeared on you beloved ~/myproject/. Go back to its state before the git pull

```
  git reset --hard
```

double check there are no merge gunk with:-

```
  grep -r "<<<"
```

To inform your local database of the servers information, \*without messing with your working copy\*

```
  git fetch
```

To get our local changes to the project to be favoured over the servers. We merge using a non-default merge stratergy called ours.

```
  git merge -s ours origin/master
```

No we can push that over the server.

```
  git push
```

Let the pulling begin...

### Keeping crap out with a .gitignore

add a file to

```
  gedit ~/myproject/.gitignore
```

each line can be a pattern of files to ignore _e.g._

```
*.pyc
 *.o
 bin/*
 .*.swp
```

Temp files in a Dropbox can cause lots of conflicts. These are exactly the kind of files you want to match with a pattern in the .gitignore

I find I have one master .gitignore I just keep adding to every project I work with. Think of it as a baby, it reflects your characteristics, make it nice!

### Conclusion

Congratulations! You can now setup Git in a Dropbox account, and can even fix merges in a basic way. Git can get a lot more powerful if you want, or you can leave it at that. If things go horribly wrong you can roll back to earlier states. If you want a usable permission model then the next logical step is a [gitolite](https://www.google.co.uk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CCIQFjAA&url=https%3A%2F%2Fgithub.com%2Fsitaramc%2Fgitolite&ei=9KSeUNHPHtLa0QWPnYDIBw&usg=AFQjCNGqFdaFD6Eoh8--Nb-Rk7kGfq44bw) server (but you do need a server then).

I recently switched a [2 person python project](http://edinburghhacklab.com/2012/10/make-a-game-month-makgammon/) from just sharing development files in a Dropbox folder to running git in Dropbox. Just from excluding compiled python .pyc files we reduced our conflict ridden Dropbox folder from 250Mb to 150Mb. After this was compressed to a bare repository the whole project fitted into a 23Mb folder in our Dropbox. Yes, it compressed by a factor of x10.

Of course the real gain was in productivty from having vesion control, and its all possible without a server or money in an agile way (1 hour).

###### Footnote: For the windows instructions replace ~ with C: and make sure you remember git was created by Linux Torvalds of Linux fame if it strays into conversation.
