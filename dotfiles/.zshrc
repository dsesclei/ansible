zmodload zsh/zprof
autoload zargs

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source ~/.zsh_plugins.sh
fpath+=/usr/local/share/zsh/site-functions

#source $HOME/.asdf/completions/asdf.bash
eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias i="brew install"
alias x="exa"
alias pe="path-extractor"
alias mk="minikube"
alias k="kubectl"

alias r-plugins="trash ~/.zsh_plugins.sh; antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh"
alias r-path="hash -r"
alias repo="cd $HOME/repos && git clone"
alias aria="aria2c -x5 -c"
#function sm() {
#    scp $1 dave@mittens:$2
#}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $HOME/.p10k.zsh


function filters {
  $EDITOR $HOME/filters/filters.conf && \
  gmailfilters -f $HOME/filters/credentials.json $HOME/filters/filters.conf
}

function a {
  asdf plugin-add $1
  asdf install $1 latest && \
  asdf global $1 $(asdf list $1 | xargs) 
}

function clone {
  local ${1##*/}
  local repo_path=${reponame%.git}
  git clone "$1" "$HOME/repos/$repo_path"
  cd "$repo_path"
}

function rc {
  local options=(".zshrc" ".zshenv" ".zprofile" ".zpreztorc")
  select opt in "${options[@]}"
  do
    case $opt in
      ".zshrc")
        $EDITOR $ZDOTDIR/.zshrc
        break
        ;;
      ".zshenv")
        $EDITOR $ZDOTDIR/.zshenv
        break
        ;;
      ".zprofile")
        $EDITOR $ZDOTDIR/.zprofile
        break
        ;;
      ".zpreztorc")
        $EDITOR $ZDOTDIR/.zpreztorc
        break
        ;;
      *) echo "invalid option";;
    esac
  done
}

# Wasmer
export WASMER_DIR="/Users/dave/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
