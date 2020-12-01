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

Or with homebrew do
```
$ brew update
$ brew install fzf
```
and follow the prompts enabling fuzzy auto-complete and key bindings.

After installing run `CTRL + r` in the terminal to explore.

## `tldr`

Brief, concise descriptions of command-line interface commands.

If you do not have node.js and npm install those first. (On mac `brew install node`.) Then

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

Or with homebrew
```
$ brew install ripgrep
```

To run `rg <query>` instead of `grep -r <query> .`.

## `tmux` (especially for remote dev)
See [this link](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/) for details on setting up tmux.

Create/overwrite `~/.tmux.conf` with
```
# Split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# Reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

# Switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Enable mouse mode (tmux 2.1 and above)
set -g mouse on
set-option -g mouse on

# make scrolling with wheels work
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

# Set TERM
# set -g default-terminal "xterm-256color"
set -g default-terminal "screen-256color"

# Make Ctrl+left/right work
set-window-option -g xterm-keys on
```

Start tmux by typing tmux in terminal. Exit (and leave running) by running `CTRL+a d`. This will leave it running so the same session can be re-attached.

Important commands:
* "CTRL+a |" to split vertically.
* "CTRL+a -" to split horizontally.
* "CTRL+{up/down/left/right}" to move between window panes.
* "CTRL+d" to close current pane.
* "CTRL+a d" to exit tmux (but still leave session running).
* When ssh into machine (with tmux session running) "tmux a" will attach to the running session.

## Git
First things first.
```
git config --global user.name "your-name"
git config --global user.email "your-email"
git config --global core.editor "emacs -nw"
```

Some git commands are long. Create aliases for them. Run `git config --global --edit`. Then add your aliases. Here are some ideas.
```
[alias]
  # Standard stuff
  a = add --all
  b = branch
  c = commit
  ca = commit --amend
  co = checkout
  cob = checkout -b
  d = diff
  s = status
  up = "!git fetch --all --prune && git rebase origin/master"

  # Pretty log
  ls = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate
  ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat
  ld = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative
  le = log --oneline --decorate
```

### References
* https://haacked.com/archive/2014/07/28/github-flow-aliases/

# Vscode
TODO: Plugins.

## Remote development
TODO: Configuring chrome remote desktop.
TODO: Terminal settings for SSH and remote desktop with tmux.

# Chrome
TODO

## Search engines
TODO: In settings add new search engines to sites you often search.

## SourceGraph
TODO: Create search engines for file search and keyword search.

# Gmail
* TODO: Subscribe to github PR notifications.
* TODO: Use filters to clean and organize categories of messages.

# Slack
TODO
