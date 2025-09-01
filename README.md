# .dotfiles

A visible backup of my key dotfiles, primarily for a MacOS environment but aimed to be portable to any *nix OS. This includes a script that quickly symlinks all of these configuration files to the right place on Linux and Unix systems according to the [XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/latest/).

## contents

This repo contains the following:

* **alacritty.toml** - config for [alacritty](https://github.com/alacritty/alacritty), my current terminal of choice

* **.zshenv, .zprofile, .zshrc** - config for [zsh](https://github.com/zsh-users/zsh), the default MacOS shell

* **starship.toml** - config for [Starship](https://github.com/starship/starship), my shell prompt of choice

* **.tmux.conf** - config for [tmux](https://github.com/tmux/tmux), my terminal emulator of choice

* **init.lua, various lua plugin configs** - WIP config for [neovim](https://github.com/neovim/neovim), my editor of choice
  
* **git/config, git/ignore** - global XDG variants for .gitconfig and .gitignore, respectively

Comments with decision reasoning can be found in each file. All of these tools are customized with my ZSA Voyager keyboard and custom keymap in mind. I have that setup hosted on git with explanations and justification [here](https://github.com/hb-robo/zsa-voyager-keymap).


## workflow

My programming workflow is pretty "chalk" nerd stuff. The primary goal is to reduce friction where possible, especially "static friction", i.e. startup time. Part of that is reducing my mouse usage and embracing shortcuts where possible. With that comes the adoption of productivity tools with powerful shortcuts that are globally accessible in MacOS:
* [Raycast](https://www.raycast.com/ios) - a replacement for the native Spotlight search that ships with MacOS, replacing its Cmd+Space with significantly more functionality such as window management and quick LLM access with Cmd+Space.
* [Things3](https://culturedcode.com/things/) - a task management app exclusive to the Apple environment that has a really helpful "Quick Add" shortcut, Ctrl+Space.

The other part of friction reduction is lean tooling, which I detail below.

I work almost entirely out of my terminal, which uses the `zsh` shell by default on Mac. I currently use Alacritty for my terminal since it can be configured with itself in TOML and generally gets out of the way. I keep a pretty stock shell, with just some basic aliases set up and initializations for a few tools. 

`zsh` is outfitted with `starship`, which is a very powerful and aesthetically pleasing prompt replacement. By default it shows icons that give insight into directory composition including git status and current branch, as well as the programming languages used in the directory and their versioning. It's pretty space efficient which I like. To further compact that extra information, I am using their `bracketed-segments` preset.

From there, if I am working locally, I launch `tmux` to be able to quickly split terminal windows into panes or to later come back to something I need to step away from by detaching and reattaching to the session. If I am working on a remote machine, I do not launch `tmux` until I am SSH'd in, to prevent nested `tmux` behavior. This grants the outstanding convenience of being able to resume my work between SSH sessions without losing progress, even in the event of a disconnect. I can always reattach to that `tmux` session as long as the remote machine hasn't been rebooted. For personal comfort, I have tweaked the command shortcuts as specified in the config file.

When I actually need to edit something, I launch `nvim`. I've been using extensible editors like Atom and VSCode for a decade now, but ultimately they aren't great at the actual editing part due to their modeless design. There are Vim-family extensions for VSC, but by nature, Vim and VSC compete for shortcuts as they were not designed with one another in mind. To prevent yet another layer of fragile customization, I instead decided to go with `nvim` using the init from [kickstart.nvim](https://github.com/nvim-lua/kickstart-nvim), which has some sensible defaults and aims to make its config very explicit and customizable. I am gradually making changes to the base config as I explore my requirements and discover my preferences.

All of `zsh`, `starship`, `tmux`, and `nvim` are configured to have a single unified theme from [base16](https://github.com/chriskempson/base16?tab=readme-ov-file). This is further complemented by an fswatch background job that is launched on `zsh` init, which monitors the MacOS system files for any change between light and dark system theme and correspondingly swaps between two pre-selected terminal themes. I know some programmers are dark-mode-only gremlins but blue light is actually helpful for your circadian rhythm early in the day so I try to do a full day-night cycle on all software.


## customization

Feel free to fork this repository and customize it to your liking. I found the exercise of aggregating these files helpful; it prompted me to both understand my environment more and to interrogate my decision-making around my workflow. Just be sure not to publish anything sensitive, such as SSH keys or PII revealed in paths.
