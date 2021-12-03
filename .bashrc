export OSH=/home/rd/.oh-my-bash
OSH_THEME="powerline"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_OSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# stamp shown in the history command output.
# HIST_STAMPS="yyyy-mm-dd"

completions=(
  git
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
export EDITOR="nano"
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

source "$HOME/.aliases" # shared aliases with sshs
alias apti="cat $HOME/Aptfile | xargs sudo apt install -y"
alias code="codium"
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotfiles="/usr/bin/env git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias xclip="xclip -selection clipboard"
alias vpn_up="windscribe connect CA"
alias vpn_down="windscribe disconnect"

PATH="$HOME/.local/bin:$PATH"

# load user-set environment variables
source "$HOME/.env_vars"

# load custom bash fuctions
source "$HOME/projects/ubuntu-for-development/src/editfile.bash"
source "$HOME/projects/ubuntu-for-development/src/sshs.bash"

# asdf version manager
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# exercism
PATH="$HOME/exercism/cli:$PATH"
source "$HOME/exercism/cli/shell/exercism_completion.bash"

# docker
export PATH=/home/rd/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# vscodium
VSCODIUM_VERSION=1.62.3
PATH="$HOME/VSCodium-linux-x64-$VSCODIUM_VERSION/bin:$PATH"

# autoload tmux
# if shell is interactive, and TMUX var is set...
if [[ $- == *i* ]] && [[ -z "${TMUX}" ]]; then
  tmux attach || exec tmux new-session && exit;
fi
