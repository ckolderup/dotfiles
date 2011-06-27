export LANG=en_US.utf-8
export PATH=/opt/local/bin:/opt/local/sbin:~/bin:~/local/bin:/usr/local/sbin:$PATH

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
    PS1="$FG\H$BBLK\$(parse_git_branch):$NONE "
  else
    PS1="\H\$(parse_git_branch): "
  fi
  export PS1

#EC2 stuff
source ~/.ec2/env.sh

#rack fun
export RACK_ENV="development"

#bash editor prefs
set -b
set -o vi
export EDITOR=vim

#tools
alias mine="ps efu"
alias wd='echo -e "   \033[1;30m"`pwd`"\033[0m"'
alias grep="grep --exclude=*.swp"

if [ `uname` == "Darwin" ]; then
  alias ls='ls -G'
  alias mvim="~/bin/mvim.sh -f"
  alias quicklook='qlmanage -p 2>/dev/null' # thanks mwunsch!
  alias git=hub
  export LSCOLORS="fxCxexdxFxbxegedabagacad"
else
  alias ls='ls --color=auto'
fi

# cosmetic nonsense
cd() {
  if [[ $@ == '-' ]]; then
    builtin cd "$@" > /dev/null  # We'll handle pwd.
  else
    builtin cd "$@"
  fi
  echo -e "   \033[1;30m"`pwd`"\033[0m"
}

# - foo opens foo using vim as the pager
-() {
  /usr/share/vim/vim72/macros/less.sh "$*"
}

# view remote man pages from man.cx using w3m as the "pager"
woman() { if [ $# -eq 2 ]; then w3m "http://man.cx/$2($1)"; else w3m "http://man.cx/$1"; fi; }
