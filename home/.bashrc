export TERM=xterm-256color
export PATH=/opt/local/bin:/opt/local/sbin:~/bin:~/bin/flex_sdk_3.5/bin:/Library/Ruby/Gems/1.8/bin:$PATH
export EDITOR=vim

alias git=hub

if [ `uname` == "Darwin" ]; then
  alias ls='ls -G'
  alias mvim="~/bin/mvim.sh -f"
  alias quicklook='qlmanage -p 2>/dev/null' # thanks mwunsch!
else
  alias ls='ls --color=auto'
fi
