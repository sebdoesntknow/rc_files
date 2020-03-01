# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Git autocompletion and tools for bash
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

# export GH_NOODLETOKEN=899ad1486d85d1a193a3425d5330c390279dbd11
# export APP_SETTINGS='project.config.DevelopmentConfig'

# Default Editor
export EDITOR="vim"

# Prompt
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\]\[\033[0m\] '

# GIT stuff

function gs() {
  /usr/bin/git status -s "$@"
}

function ga() {
  /usr/bin/git add .
}

function gb() {
  /usr/bin/git branch -l
}

function gch() {
  /usr/bin/git checkout "$@"
}

function gc() {
  /usr/bin/git commit -am "$@"
}

function glo() {
  /usr/bin/git log --oneline "$@"
}

function doclog() {
  /usr/bin/docker logs -f "$@"
}

# Noodle Docker stuff
function nenv() {
  if [ -e ../services/.env ]; then
    for v in $(/bin/cat ./.env); do
      echo "export ${v}"
      export "${v}"
    done
  else
    echo "No .env file or you are not in the services main directory!"
  fi
}

function nservdown() {
  /usr/bin/docker-compose -f main/docker-compose.yml down -v
}

function nservbuildup() {
  /usr/bin/docker-compose -f main/docker-compose.yml up -d --build
}

function nservrecdb() {
  /usr/bin/docker exec flask-base-service python manage.py recreate_db
}

function dps() {
  /usr/bin/docker ps
}

function ndrop() {
  # bring noodle docker down
  nservdown
}

function nup() {
  # bring docker container up and recreated db
  nenv
  nservbuildup
  nservrecdb
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH=$PATH:/home/seb/bin

#source '/home/seb/lib/azure-cli/az.completion'
