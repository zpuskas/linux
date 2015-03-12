# error code printing on command exit
function prompt-show-status ()
{
  # Don't use `status'.  It's read-only in zsh.
  local stat="$?"

  if test $stat -ne 0 -a $stat != 128; then
    # If process exited by a signal, determine name of signal.
    if test $stat -gt 128; then
      local signal="$(builtin kill -l $[$stat - 128] 2>/dev/null)"
      test "$signal" && signal=" ($signal)"
    fi
    echo -e "\033[01;31m[Exit $stat$signal]\033[00m" 1>&2
  fi
  test "$BASH" && history -a
  return 0
}

# Easy detailed listing
alias ll='ls -la'

# Color my diffs
alias diff=colordiff

# Strip colors from output
alias stripcolors='sed "s/\x1B\[\([0-9]\{1,2\}\(;[0-9]\{1,2\}\)\?\)\?[mGK]//g"'

# Faster jumping upwards a few levels in directories
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

# Add "arrow" search
bind "^W":backward-delete-word
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

