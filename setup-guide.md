---
title: Dev Setup
---

This is a concise guide for improving development efficiency. Topics include
* Code, terminal CLI, etc.
* Gmail, slack, etc.

# Terminal CLI

## fzf

fzf provides a more interactive reverse search in the terminal. See [this explanation of fzf](https://remysharp.com/2018/08/23/cli-improved#fzf--ctrlr).

```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

After installing run `CTRL + r` in the terminal to explore.

## `tldr`

Brief, concise descriptions of command-line interface commands.

```
$ npm install -g tldr
```

If the install fails because of access permissions then you need to [configure a user-global package folder](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md). On the command line interface run (make sure `${HOME}` has a value or replace with appropriate)

```
$ mkdir "${HOME}/.npm-packages"
$ npm config set prefix "${HOME}/.npm-packages"
```

Then add the following to `.zshrc/.bashrc`

```
# User-global npm package location.
NPM_PACKAGES="${HOME}/.npm-packages"
# Update path.
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
```

## Fast `grep -r` (RipGrep)

For a fast `grep -r` see [RipGrep for current installation instructions](https://github.com/BurntSushi/ripgrep#installation).

```
$ cd ~/Downloads && curl -LO \ 
https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
$ sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

To run `rg <query>` instead of `grep -r <query> .`.

## `tmux` (especially for remote dev)
TODO

# Vscode
TODO

## Remote development
TODO

# Ubuntu i3 window tiling
TODO

# Chrome
TODO

## Search engines
TODO

## SourceGraph
TODO

# Slack
TODO

# Gmail
TODO
