source /usr/local/etc/bash_completion.d/git-completion.bash
. /Users/emilyintersimone/z/z.sh
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# This function builds your prompt. It is called below
function prompt {
# Define some local colors
local         RED="\[\033[0;31m\]"
local         CHAR="✨ "
local   	  BLUE="\[\e[0;49;34m\]"
local         NO_COLOR="\[\033[0m\]"

# Here is where we actually export the PS1 Variable which stores the text for your prompt
export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\d \@\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\w\[\e[0m\]\n\[\e[0;31m\]$NO_COLOR//$BLUE $CHAR \[\e[0m\]"
    PS2='> '
    PS4='+ '
}

# Finally call the function and our prompt is all pretty
prompt

# Case-Insensitive Auto Completion
bind "set completion-ignore-case on" 

# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

function run-mongod {
  mongod --config /usr/local/etc/mongod.conf
}

function log-mongod {
  tail -f /usr/local/var/log/mongodb/mongo.log
}
