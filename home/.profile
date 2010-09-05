export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH
set -o vi

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
