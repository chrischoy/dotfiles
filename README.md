# Configuration

Personal configuration files

## Installation

- Install latest tmux >= 1.8
- Install [spf13](http://github.com/spf13/spf13-vim)
- Download and install powerline fonts from [here](https://github.com/powerline/fonts
- Tmux color setting can be tricky. Use `tmux -2` to enable 256 color and make sure the `$TERM` has [the same setting](http://superuser.com/questions/399296/256-color-support-for-vim-background-in-tmux)

## 1 .vimrc

Common configuration file for my Macbook and lab machine
Made using spf13-vim repo

If you want xclipboard support. Follow the [instruction](http://stackoverflow.com/questions/10101488/cut-to-the-system-clipboard-from-vim-on-ubuntu).

## 2 .tmux.conf

Tmux configuration that is optimized for vim experience

## 3 .bashrc.user

TODO: Cleanup


## Remove key mapping for <C-J> in ~/.vim/bundle/vim-latex/plugin/imaps.vim

find <C-J> mappings and comment all out


## Changed to ZSH

PAM Authentication failure

```
vi /etc/pam.d/chsh
```
and comment out `auth required pam_shell.so`

Doesn’t work, just exec /bin/zsh
