---
title: Code Setup
---

This is a concise guide for setting up a coding environment. Topics include
* Terminal command-line interface setup
* Coding tools

# Terminal CLI

## zsh

### Notes on zsh

Shell configurations are sourced in particular orders. The order of sourcing follows
1. `.zshenv` (always)
2. `.zprofile` (at start of login shell)
3. `.zshrc` (at start of an interactive shell)
4. `.zlogin` (at start of a login shell)

`.zshenv` is always sourced. It often contains exported variables.

`.zshrc` is sourced when an interactive shell is started (e.g., you open up the terminal). It configures the behavior of the interactive shell.

`.zlogin` is sourced when a login shell is started. For example, when you log in to the desktop. So this config is used to start the graphics (X). 

`.zprofile` and `.zlogin` are meant to be used one or the other (depending on preference of order). However they can be used together if desired.

### Installing zsh

Ensure that zsh is installed. On ubuntu

```
sudo apt install zsh
```
```
sudo usermod -s /usr/bin/zsh $(whoami)
```
```
chsh -s $(which zsh)
```

Log out and back in of the terminal. You will be prompted to generate configs. Do so.

See https://gist.github.com/kevin-smets/8568070 for further customizing zsh. What I do is described below.

Install oh-my-zsh.

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Edit ~/.zshrc theme as desired. I like agnoster or powerlevel10k. For powerlevel10k first do

```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Then edit the them in `.zshrc` as

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Log out and back in to terminal and configuration wizard will boot. Follow it. Otherwise configure by

```
p10k configure
```

In some cases the required font may be missing or just not set in the terminal. You will notice this because during configuration the symbols will not be correct.

You need Meslo Nerd Fonts. Refer to the [nerd-fonts repo](https::github.com/ryanoasis/nerd-fonts).

```
git clone https://github.com/ryanoasis/nerd-fonts
```
```
cd nerd-fonts
```
```
sudo ./install.sh Meslo
```

This repo is huge so you probably want to delete it after installing.

You will then need to change the font in your terminal profile preferences to be `Meslo Nerd Font`.

## fzf

fzf provides a more interactive reverse search in the terminal. See [this explanation of fzf](https://remysharp.com/2018/08/23/cli-improved#fzf--ctrlr).

```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
```
```
$ ~/.fzf/install
```

Or with homebrew do
```
$ brew update
```
```
$ brew install fzf
```
and follow the prompts enabling fuzzy auto-complete and key bindings.

After installing run `CTRL + r` in the terminal to explore.

## `tldr`

The original tldr is installed via `npm`. My preferred version is `tealdeer`. Both are described below.

### `tldr` via `npm`

Brief, concise descriptions of command-line interface commands.

The original version of `tldr` is built in node.js. If you want to install the original version then you will need node.js and npm.

If you do not have node.js and npm install those first. (On mac `brew install node`.) Then

```
$ npm install -g tldr
```

If the install fails because of access permissions then you need to [configure a user-global package folder](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md). On the command line interface run (make sure `${HOME}` has a value or replace with appropriate)

```
$ mkdir "${HOME}/.npm-packages"
```
```
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

### `tealdeer` via rust

A very fast alternative version of `tldr` is [tealdeer](https://dbrgn.github.io/tealdeer). This version is the fastest available. Compare 9ms to 17ms (for the node.js version). To install this version first install the rust command line tools because you will need `cargo` to install the rust package. After installing the rust tools then

```
$ cargo install tealdeer
```

For auto-completion in `zsh` you will need to copy the `zsh_tealdeer` file to the zsh completions directory. You can get the `zsh_tealdeer` file directly from the tealdeer repo (but it might not be within the installed files) (as described in the [installation instructions](dgrgn.github.io/tealdeer/installing.html).

The location of the zsh custom auto completions depends on the installation. I ended up doing

```
sudo cp tealdeer/zsh_tealdeer /usr/share/zsh/vendor-completions/_tldr
```

## Fast `grep -r` (RipGrep)

For a fast `grep -r` see [RipGrep for current installation instructions](https://github.com/BurntSushi/ripgrep#installation).

For Ubuntu version >= Cosmic just use `apt-get`.

Otherwise download the deb file and install with `dpkg`. This script [install_ripgrep_deb.sh](install_ripgrep_deb.sh) automates installing the most recent release.

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
```
```
git config --global user.email "your-email"
```
```
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
