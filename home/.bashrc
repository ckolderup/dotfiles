export LANG=en_US.utf-8
export PATH=~/bin:~/local/bin:$PATH
source ~/bin/git-completion.bash

# git niftiness
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWDIRTYSTATE=1 #these are too slow
#export GIT_PS1_SHOWUPSTREAM="auto"

#prompt config
  function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " ("${ref#refs/heads/}")"
  }

  # Happy prompt, thanks milkie!
  FG='\[\033[38;5;119m\]'
  NONE='\[\033[00;0m\]'
  BBLK='\[\033[01;30m\]'

  if [ $TERM = 'ansi' -o $TERM = 'vt100' -o $TERM = 'xterm-256color' -o $TERM = 'linux' -o $TERM = 'xterm' -o $TERM = 'screen-256color' ]
  then
    PS1="$FG\h$BBLK:$FG\W$BBLK\$(__git_ps1 ' (%s)'):$NONE "
  else
    PS1="(\h) \W\$(parse_git_branch): "
  fi
  export PS1

#bash editor prefs
set -b
set -o vi
export EDITOR=vim

#tools
alias curl="curl -w '\n'"
alias mine="ps efu"
alias wd='echo -e "   \033[1;30m"`pwd`"\033[0m"'
alias grep="grep --exclude=*.swp"
alias lack="ack --pager='less -R'"
if [ `uname` == "Darwin" ]; then
  alias ls='ls -G'
  alias quicklook='qlmanage -p 2>/dev/null' # thanks mwunsch!
  export LSCOLORS="fxCxexdxFxbxegedabagacad"
else
  alias ls='ls --color=auto'
fi

# less syntax highlighting
if command -v src-hilite-lesspipe.sh > /dev/null ; then
  export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"
  export LESS=' -R '
fi

# here's a cool thing!
export HISTIGNORE="ls:exit"

# cosmetic nonsense
cd() {
  if [[ $@ == '-' ]]; then
    builtin cd "$@" > /dev/null  # We'll handle pwd.
  else
    builtin cd "$@"
  fi
  if ls .git &> /dev/null; then
    echo -e "   \033[1;34m"`~/bin/spark-git.rb . `"\033[0m"
  fi
  echo -e "   \033[1;30m"`pwd`"\033[0m"
}

# - foo opens foo using vim as the pager
-() {
  /usr/share/vim/vim72/macros/less.sh "$*"
}

# view remote man pages from man.cx using w3m as the "pager"
woman() { if [ $# -eq 2 ]; then w3m "http://man.cx/$2($1)"; else w3m "http://man.cx/$1"; fi; }

function fnd() { CMD="*"; for ARG in $*; do CMD=$CMD$ARG"*"; done; find . -name "$CMD"; }
function fless() { CMD="*"; for ARG in $*; do CMD=$CMD$ARG"*"; done; less `find . -name "$CMD"`; }
function vless() { CMD="*"; for ARG in $*; do CMD=$CMD$ARG"*"; done; vim `find . -name "$CMD"`; }

#print recent git activity in common git directories
alias recent='echo -e "\033[1;31m"`ruby ~/bin/spark-git.rb ~/src/*`"\033[0m"'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
