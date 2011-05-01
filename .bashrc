# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#export LC_ALL=ru_RU.UTF-8
export LC_ALL=en_US.UTF-8
export  wpsetters=feh
export OOO_FORCE_DESKTOP=gnome
export EDITOR=vim
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Xmx1024m -Xms1024m'
export _JAVA_OPTIONS='-Xmx1024m -Xms1024m'
export JAVA_FONTS=/usr/share/fonts/TTF
#setxkbmap -option terminate:ctrl_alt_bksp
alias vi=vim
export PATH="$PATH:~/bin:/opt"
set show-all-if-ambiguous on
set mark-directories on
set complete -F _filedir_xspec ls



# append history

shopt -s histappend

PROMPT_COMMAND='history -a'

# fix stupid misstakes

shopt -s cdspell

# ignore dubl commands in history exclude ls etc

export HISTIGNORE="&:ls:[bf]g:exit"
#export HISTCONTROL="ignoredups"




# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$R                 # user's color
    [ $UID -eq "0" ] && UC=$EMR   # root's color
    
    #PS1="$TITLEBAR ${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
    #PS1="${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
#	export PS1='\[\033[1;37m\]┌────[\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;36m\]\h: \[\033[1;35m\]\w\[\033[1;37m\]]\n\[\033[1;37m\]└─>\[\033[1;34m\]\$\[\033[0m\] '
	PS1="${EMK}${UC}┌────${EMK}[${UC}\u${EMK}@${UC}\h: ${EMB}\w${EMK}]\n${UC}└─>${UC}\\$ ${NONE}"
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt





# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
#    eval "`dircolors -b`"
#    alias ls='ls --color=auto'
#    #alias dir='ls --color=auto --format=vertical'
#    #alias vdir='ls --color=auto --format=long'
#fi
alias ll='ls -laFG'
#if [ "$TERM" != "dumb" ]; then
#    eval "`dircolors -b`"
#    alias ls='ls --color=always'
#    alias ll='ls --color=always -l'
#    alias la='ls --color=always -A'
#    alias less='less -R'
#    alias ls='ls --color=always'
#    alias grep='grep --color=always'
#    alias egrep='egrep --color=always'
#    alias fgrep='fgrep --color=always'
#    alias zgrep='zgrep --color=always'
#else
    alias ll='ls -l'
    alias la='ls -A'
#fi


# some more ls aliases
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
#. /usr/share/mc/bin/mc.sh

#extract() {
#  local e=0 i c
#  for i; do
#    if [[ -r $i ]]; then
#        c=''
#        case $i in
#          *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
#                 c='bsdtar xvf' ;;
#          *.7z)  c='7z x'       ;;
#          *.Z)   c='uncompress' ;;
#          *.bz2) c='bunzip2'    ;;
#          *.exe) c='cabextract' ;;
#          *.gz)  c='gunzip'     ;;
#          *.rar) c='unrar x'    ;;
#          *.xz)  c='unxz'       ;;
#          *.zip) c='unzip'      ;;
#          *)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
#        esac
#        [[ $c ]] && command $c "$i"
#    else
#        echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
#    fi
#  done
#  return $e
#}

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
#alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias update='sudo pacman -Su'
    alias netcfg='sudo netcfg2'
fi

# ls
alias ls='ls -hF --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more -R'

# safety features
#alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

export GREP_COLOR="1;33"
alias grep='grep --color=auto'
