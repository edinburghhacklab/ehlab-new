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

if you don't run linux, and don't want to think about setting this up 'properly': use the hacklab laptop, which is running linux.

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

to write a new post, make a markdown file named `site/$YEAR/$MONTH/post-title.md`. Start it out like this:

```
# Post title
<date>2026-05-05</date>

Some content...
```

To add images, place them in `site/$YEAR/$MONTH/images/`. You can then embed them in your markdown like this:

```
![some alt text](./images/name.png)
```

### deploying

`main` is automatically built and pushed by github actions.
