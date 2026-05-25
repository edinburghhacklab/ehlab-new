# ehlab-new

this is a (proposed) new version of [edinburghhacklab.com](https://edinburghhacklab.com). rather than a wordpress site, it is statically generated. it's also noticeably more minimal than the previous version.

if you just want to see what it looks like, go [here](https://ehlab-new.aria.rip/).

## why?

  - we're bad at maintaining our wordpress instance, and that's unlikely to change. a static site needs much less maintenance, although it comes at the cost of requiring more knowledge to edit.
  - hacking on wordpress themes is kinda miserable, meaning changing how our site looks is annoying
  - fun

## building

### installing requirements

requirements:

  - [just](https://just.systems/man/en/installation.html)
  - [soupault](https://soupault.net/install/)
  - [watchexec](https://github.com/watchexec/watchexec) (for automatic rebuilding only)
  - python 3 (for serving the local version)

if you use nix, a `shell.nix` is provided.

if you're comfortable developing in a docker container, you can build one with the provided `Dockerfile`.

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

`main` is automatically built and pushed by github actions. for now, you will need to make your own arrangements if  wanting to deploy draft versions (from PRs, etc)
