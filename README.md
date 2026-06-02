# ehlab-new

this is a (proposed) new version of [edinburghhacklab.com](https://edinburghhacklab.com). rather than a wordpress site, it is statically generated. it's also noticeably more minimal than the previous version.

if you just want to see what it looks like, go [here](https://ehlab-new.aria.rip/).

## why?

  - we're bad at maintaining our wordpress instance, and that's unlikely to change. a static site needs much less maintenance, although it comes at the cost of requiring more knowledge to edit.
  - hacking on wordpress themes is kinda miserable, meaning changing how our site looks is annoying
  - fun

## building

### tl;dr

if you run linux: run `./scripts/enter-container.sh`. run `just dev` and then go to `http://localhost:8000`. the site will be rebuilt when you make changes.

if you don't run linux, and don't want to think about setting this up 'properly': use the hacklab laptop, which is running linux. from the home directory, `cd ehlab-new; ./scripts/enter-container.sh`.

### installing requirements

if you're on a system with docker installed, you can run `./scripts/enter-container.sh` to enter an interactive shell with all the requirements you need.

alternatively, install:

  - [just](https://just.systems/man/en/installation.html)
  - [soupault](https://soupault.net/install/)
  - [watchexec](https://github.com/watchexec/watchexec) (for automatic rebuilding only)
  - python 3 (for serving the local version)

if you use nix, a `shell.nix` is provided.

### building

to build once, run `just build`. the output is in `build/`.

to serve the built output, run `just serve`. this requires python 3.

to rebuild the website on any changes, run `just watch`. this requires watchexec.

to serve the website, and rebuild it on any changes, run `just dev`.

to clear your cache and built output, run `just clean`.

### writing posts

to write a new post, run `just new-post 'My post title'`. open the file it tells you to.

if you are using the hacklab laptop, you have permissions to push to [this git repo](github.com/edinburghhacklab/ehlab-new-labtop). make a PR from there when you're done.

### deploying

`main` is automatically built and pushed by github actions.
