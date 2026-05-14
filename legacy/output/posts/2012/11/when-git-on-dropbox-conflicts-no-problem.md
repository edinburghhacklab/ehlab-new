---
title: "When Git on Dropbox conflicts - No problem"
date: 2012-11-15
---

I recently wrote about a free way of running version control without owning a server, by [hosting a remote repository in a Dropbox folder](http://edinburghhacklab.com/2012/11/easy-version-control-git-on-dropbox/). One concern raised about using git on Dropbox was "what happens if people push at the same time". The fear is that the conflicts would irrecoverably corrupt the git repository and cause a headache. Of course we have the local backups of data, but there was a nagging doubt that perhaps a corrupted server could corrupt a local repository. Anyway I tested what really happens by doing it, and learn a bit about git in the process.

### Experiment

I [wrote a script](https://github.com/tomlarkworthy/gitdropboxcollisiontest) that commits random data and pushes to a [bare repository hosted on Dropbox](http://edinburghhacklab.com/2012/11/easy-version-control-git-on-dropbox/). After push blasting the Dropbox folder with 1,000 pushes from 2 machines in parallel, syncronisation with Dropbox took ages longer than usual (10 minutes) <!--more-->

### Results

#### _Did the remote (Dropbox) repository work afterwards?_

No. You can't pull or clone a fresh copy.

```
git pull
```

```
fatal: Reference has invalid format: 'refs/heads/master (Tom Larkworthy's conflicted copy 2012-11-15)'
 fatal: The remote end hung up unexpectedly
```

```
git clone ~/Dropbox/dropgit/
```

```
Cloning into 'dropgit'...
 fatal: Reference has invalid format: 'refs/heads/master (Tom Larkworthy's conflicted copy 2012-11-15)'
 fatal: The remote end hung up unexpectedly
```

#### _How many conflicts did were caused?_

only 3

```
find . | grep 'conflicted'
```

```
./logs/HEAD (Tom Larkworthy's conflicted copy 2012-11-15)
 ./logs/refs/heads/master (Tom Larkworthy's conflicted copy 2012-11-15)
 ./refs/heads/master (Tom Larkworthy's conflicted copy 2012-11-15)
```

The meaning of these directories is explained in ["http://www.siteground.com/tutorials/git/directory.htm".](http://www.siteground.com/tutorials/git/directory.htm)

Every commit is stored in the subdirectory .git/objects under its SHA-1 hash. This means its extremely unlikely that the commit \*data\* will collide. Cool!

The only collisions are caused in the refs and logs directories which describe the structure of the histories. Looking inside these files yields long lists:

```
HEAD contains:-
 ...
 b42d41fbc73e80808833175e74a58b021417f449 d6b23487fe1d723f4e0649239cdb3f2dd8984780 Georgios Papadimitriou 1352973737 +0000 push
 ...
```

```
HEAD (Tom Larkworthy's conflicted copy 2012-11-15) contains:-
 ...
 09b1ba76a65907249de8d728432a537222bf2288 c2949cd3f9e63d354d3ff4ecd3dc07ca015ccd7e tom 1352177816 +0000 push
 ...
```

(./logs/refs/heads/master and ./refs/heads/master are identical in structure)

So the histories are just big linked lists of the SHA-1 keys of the commits. The conflict is over which linked list is the true history.

My friend Georgios's computer is faster than mine, so his wrote to the Dropbox first. My pushes came after, thus his history has be deemed the real one and mine is the conflict.

### Fixing

The way git works makes it very easy to resolve. Just delete the conflicted files. In my case that means Georgios's history is kept on the remote repository. That repository can now be cloned into a fresh location. However, the remote Dropbox repository will not have my (Tom Larkworthy') history.

running

```
git status
```

in the local repo of Tom Larkworthy:-

```
# On branch master
# Your branch and 'origin/master' have diverged,
# and have 1000 and 130 different commits each, respectively.
#
nothing to commit (working directory clean)
```

So now locally it appears that those changes were never pushed. So thats a simple procedure to just merge and push them again.

### Conclusion

So Git on Dropbox is quite safe to use! In the rare event of a collision (its never happened to me), git will stop working. This is good, as there are no silent failures. After being notified of a fault, the resolution is in place, very easy, and no history is lost during the process.
