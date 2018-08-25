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

# function to quickly back up files
bak() {
    [[ $# < 1 ]] && exit 0
    while [[ $# > 0 ]] ; do
        cp "${1}" "${1}~"
        shift
    done
}

# Add KDE trashing functionality onto the CLI
function trash {
    if [[ $XDG_CURRENT_DESKTOP == 'KDE' ]]; then
        for f in $@; do
            kioclient5 move "$f" "trash:/"
        done
    else
        echo "You are not in KDE, trash won't work"
    fi
}
alias trash="trash"

# Set custom colored prompt including git information for regular users
source /usr/share/git/git-prompt.sh

if ${use_color} ; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $(__git_ps1 "(%s)") \$\[\033[00m\] '
    fi

    # Color basic commands
    alias ls='ls --color=auto'
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
    # Color my diffs
    alias diff=colordiff
else
    # show root@ when we don't have colors
    if [[ ${EUID} == 0 ]] ; then
        PS1='\u@\h \w \$ '
    else
        PS1='\u@\h \w $(__git_ps1 "(%s)") \$ '
    fi
fi

# Easy detailed listing
alias ll='ls -la'

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
