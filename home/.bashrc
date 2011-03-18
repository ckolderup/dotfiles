export TERM=xterm-256color
export PATH=/opt/local/bin:/opt/local/sbin:~/bin:~/local/bin:/usr/local/sbin:$PATH

# Happy prompt, thanks milkie!
FG='\[\033[38;5;119m\]'
NONE='\[\033[00;0m\]'
BBLK='\[\033[01;30m\]'

if [ $TERM = 'ansi' -o $TERM = 'vt100' -o $TERM = 'xterm-256color' -o $TERM = 'linux' -o $TERM = 'xterm' ]
then
  PS1=$FG'\H'$BBLK':'$NONE' '
else
  PS1="\H: "
fi
export PS1

set -b
set -o vi
export EDITOR=vim

#tools
alias mine="ps efu"

if [ `uname` == "Darwin" ]; then
  alias ls='ls -G'
  alias mvim="~/bin/mvim.sh -f"
  alias quicklook='qlmanage -p 2>/dev/null' # thanks mwunsch!
  alias git=hub
else
  alias ls='ls --color=auto'
fi

cd() {
  if [[ $@ == '-' ]]; then
    builtin cd "$@" > /dev/null  # We'll handle pwd.
  else
    builtin cd "$@"
  fi
  echo -e "   \033[1;30m"`pwd`"\033[0m"
}

