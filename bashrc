# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

ulimit -Sn 100000

######## Self scripted ########

parse_git_branch() {
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "

alias docker-killall='docker kill $(docker ps -q)'

php-xdebug() {
    (php -d xdebug.start_with_request=yes "${@}")
}

alias tu='vendor/bin/phpunit --testsuite=Unit'
alias sshfs='sshfs -o follow_symlinks'
alias phpstan='./vendor/bin/phpstan'
alias phpunit='./vendor/bin/phpunit'
alias dc='docker compose'
alias dc-up='dc up -d'
alias ddev-test='ddev php vendor/bin/phpunit'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias ssh-web='ssh -t forge@web.pro-ebs.de "cd web.pro-ebs.de/current; bash"'
alias ssh-legacy-backup-proengeno='ssh -t forge@backup.pro-ebs.de "cd /mnt/HC_Volume_7177031/backup/; bash"'
alias ssh-legacy-iba-strom='ssh -t forge@ibaenergie.pro-ebs.de "cd ibaenergie.pro-ebs.de/current; bash"'
alias ssh-legacy-iba-gas='ssh -t forge@ibaenergie-gas.pro-ebs.de "cd ibaenergie-gas.pro-ebs.de/current; bash"'
alias ssh-iba-strom='ssh -t ploi@iba-strom.voltaik-kvs.de "cd iba-strom.voltaik-kvs.de; bash"'
alias ssh-iba-gas='ssh -t ploi@iba-gas.voltaik-kvs.de "cd iba-gas.voltaik-kvs.de; bash"'
alias ssh-scharr='ssh -t forge@scharrwaerme.pro-ebs.de "cd scharrwaerme.pro-ebs.de/current; bash"'
alias ssh-scharr-strom='ssh -t forge@scharrwaerme-strom.pro-ebs.de "cd scharrwaerme-strom.pro-ebs.de/current; bash"'
alias ssh-proengeno='ssh -t forge@proengeno.pro-ebs.de "cd proengeno.pro-ebs.de/current; bash"'
alias ssh-backup='ssh -p23 u372278@u372278.your-storagebox.de'
alias ssh-marketpartner='ssh -t ploi@marketpartner.voltaik-kvs.de "cd marketpartner.voltaik-kvs.de; bash"'
alias ssh-voltaik-check='ssh -t ploi@voltaik-check.voltaik-kvs.de "cd voltaik-check.voltaik-kvs.de; bash"'

alias sshfs-web='sshfs forge@web.pro-ebs.de:web.pro-ebs.de/current/ /home/nils/Share/Kvs/ && cd /home/nils/Share/Kvs/'
alias sshfs-iba='sshfs forge@ibaenergie.pro-ebs.de:ibaenergie.pro-ebs.de/current/ /home/nils/Share/Kvs/ && cd /home/nils/Share/Kvs/'
alias sshfs-scharr='sshfs forge@scharrwaerme.pro-ebs.de:scharrwaerme.pro-ebs.de/current/ /home/nils/Share/Kvs/ && cd /home/nils/Share/Kvs/'
alias sshfs-scharr-strom='sshfs forge@scharrwaerme-strom.pro-ebs.de:scharrwaerme-strom.pro-ebs.de/current/ /home/nils/Share/Kvs/ && cd /home/nils/Share/Kvs/'
alias sshfs-iba-gas='sshfs forge@ibaenergie-gas.pro-ebs.de:ibaenergie-gas.pro-ebs.de/current/ /home/nils/Share/Kvs/ && cd /home/nils/Share/Kvs/'
alias sshfs-proengeno='sshfs forge@proengeno.pro-ebs.de:proengeno.pro-ebs.de/current/ /home/nils/Share/Kvs/ && cd /home/nils/Share/Kvs/'

PATH=$PATH:~/.config/composer/vendor/bin

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
# Lando
export PATH="/home/nils/.lando/bin${PATH+:$PATH}"; #landopath
# Go
export PATH=$PATH:/usr/local/go/bin
