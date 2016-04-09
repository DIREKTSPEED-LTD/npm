# THIS REPO IS DEPRECATED in  FAVOR of 

THIS DOCKERFILE:
~~~
FROM node:5.6
# workaround for this: https://github.com/npm/npm/issues/9863
# Discussed in https://github.com/npm/npm/pull/10805
MAINTAINER Frank Lemanschik <frank@dspeed.eu>
RUN cd $(npm root -g)/npm \
 && npm install fs-extra \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.move/fs.rename/ ./lib/utils/rename.js
WORKDIR /app
#...... main part of the Dockerfile greetings.
~~~
IT APPLYS THE PATCH TO ANY IN NPM VERSION >3 without the need to merge this REPO


npm(1) -- a JavaScript package manager
==============================
[![Build Status](https://img.shields.io/travis/npm/npm/master.svg)](https://travis-ci.org/npm/npm)
## SYNOPSIS

This is just enough info to get you up and running.

Much more info available via `npm help` once it's installed.

## IMPORTANT

**You need node v0.8 or higher to run this program.**

To install an old **and unsupported** version of npm that works on node 0.3
and prior, clone the git repo and dig through the old tags and branches.

**npm is configured to use npm, Inc.'s public package registry at
<https://registry.npmjs.org> by default.**

You can configure npm to use any compatible registry you
like, and even run your own registry. Check out the [doc on
registries](https://docs.npmjs.com/misc/registry).

Use of someone else's registry may be governed by terms of use. The
terms of use for the default public registry are available at
<https://www.npmjs.com>.

## Super Easy Install

npm is bundled with [node](http://nodejs.org/download/).

### Windows Computers

[Get the MSI](http://nodejs.org/download/).  npm is in it.

### Apple Macintosh Computers

[Get the pkg](http://nodejs.org/download/).  npm is in it.

### Other Sorts of Unices

Run `make install`.  npm will be installed with node.

If you want a more fancy pants install (a different version, customized
paths, etc.) then read on.

## Fancy Install (Unix)

There's a pretty robust install script at
<https://www.npmjs.com/install.sh>.  You can download that and run it.

Here's an example using curl:

```sh
curl -L https://www.npmjs.com/install.sh | sh
```

### Slightly Fancier

You can set any npm configuration params with that script:

```sh
npm_config_prefix=/some/path sh install.sh
```

Or, you can run it in uber-debuggery mode:

```sh
npm_debug=1 sh install.sh
```

### Even Fancier

Get the code with git.  Use `make` to build the docs and do other stuff.
If you plan on hacking on npm, `make link` is your friend.

If you've got the npm source code, you can also semi-permanently set
arbitrary config keys using the `./configure --key=val ...`, and then
run npm commands by doing `node cli.js <cmd> <args>`.  (This is helpful
for testing, or running stuff without actually installing npm itself.)

## Windows Install or Upgrade

You can download a zip file from <https://github.com/npm/npm/releases>, and
unpack it in the `node_modules\npm\` folder inside node's installation folder.

To upgrade to npm 2, follow the Windows upgrade instructions in
the npm Troubleshooting Guide:

<https://github.com/npm/npm/wiki/Troubleshooting#upgrading-on-windows>

If that's not fancy enough for you, then you can fetch the code with
git, and mess with it directly.

## Installing on Cygwin

No.

## Uninstalling

So sad to see you go.

```sh
sudo npm uninstall npm -g
```
Or, if that fails,

```sh
sudo make uninstall
```

## More Severe Uninstalling

Usually, the above instructions are sufficient.  That will remove
npm, but leave behind anything you've installed.

If you would like to remove all the packages that you have installed,
then you can use the `npm ls` command to find them, and then `npm rm` to
remove them.

To remove cruft left behind by npm 0.x, you can use the included
`clean-old.sh` script file.  You can run it conveniently like this:

```sh
npm explore npm -g -- sh scripts/clean-old.sh
```

npm uses two configuration files, one for per-user configs, and another
for global (every-user) configs.  You can view them by doing:

```sh
npm config get userconfig   # defaults to ~/.npmrc
npm config get globalconfig # defaults to /usr/local/etc/npmrc
```

Uninstalling npm does not remove configuration files by default.  You
must remove them yourself manually if you want them gone.  Note that
this means that future npm installs will not remember the settings that
you have chosen.

## More Docs

Check out the [docs](https://docs.npmjs.com/),
especially the [faq](https://docs.npmjs.com/misc/faq).

You can use the `npm help` command to read any of them.

If you're a developer, and you want to use npm to publish your program,
you should [read this](https://docs.npmjs.com/misc/developers)

## BUGS

When you find issues, please report them:

* web:
  <https://github.com/npm/npm/issues>

Be sure to include *all* of the output from the npm command that didn't work
as expected.  The `npm-debug.log` file is also helpful to provide.

You can also look for isaacs in #node.js on irc://irc.freenode.net.  He
will no doubt tell you to put the output in a gist or email.

## SEE ALSO

* npm(1)
* npm-faq(7)
* npm-help(1)
* npm-index(7)
