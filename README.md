# Configuration

Personal configuration files

## Installation
First run the bootstrap.sh from github.com/spf13/spf13-vim

##1 .vimrc

Common configuration file for my Macbook and lab machine
Made using spf13-vim repo


##2 .tmux.conf

Tmux configuration that is optimized for vim experience

##3 .bashrc.user

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
