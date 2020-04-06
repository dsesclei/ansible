export ZDOTDIR="$HOME"
typeset -gU path cdpath fpath mailpath

path+=/usr/local/bin
source /usr/local/opt/asdf/asdf.sh

export EDITOR="sudoedit vim"
export VISUAL="sudoedit vim"
export PAGER='less'
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

