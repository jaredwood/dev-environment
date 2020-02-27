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
$ npm install tldr
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
