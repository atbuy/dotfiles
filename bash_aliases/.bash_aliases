function exp () {
  export $(grep -v "^#" .env | xargs -d '\n')
}

function cover () {
  pytest --cov-report=term-missin --cov-report=html --cov=$1 tests/
}

column_pattern="CONTAINER ID|IMAGE|COMMAND|CREATED|STATUS|PORTS|NAMES|IMAGE ID|REPOSITORY|TAG|CREATED|SIZE|"
CONTAINER_GREP="GREP_COLORS='ms=1;31' grep --color=always -E '${container_pattern}'"
COLUMN_GREP="GREP_COLORS='ms=01;94' grep --color=always -E '${column_pattern}'"

# Docker shortcuts
de() {
  docker exec -it $1 sh
}

alias dps="docker ps --format 'table {{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}' | ${CONTAINER_GREP} | ${COLUMN_GREP}"
alias dpsf="docker ps --format 'table {{.Image}}\t{{.Status}}\t{{.Names}}' | ${CONTAINER_GREP} | ${COLUMN_GREP}"
alias dpsa="docker ps -a | ${CONTAINER_GREP} | ${COLUMN_GREP}"
alias dpsaf="docker ps -a --format 'table {{.Image}}\t{{.Status}}\t{{.Names}}' | ${CONTAINER_GREP} | ${COLUMN_GREP}"
alias dlf="docker logs -f"
alias di="docker images | ${COLUMN_GREP}"
alias ddu="docker compose down --remove-orphans && docker compose up --build -d"

tns_command() {
  tmux new-session -d -n ide -s $1
  tmux new-window -n zsh
  tmux attach-session -d -t $1:ide
}

# Tmux shortcuts
alias tls="tmux ls"
alias tn="tmux new"
alias tns="tns_command"
alias ta="tmux a"
alias tat="tmux a -t"

# LSD aliases
custom_lsd() {
  lsd -lah $1 && echo "\n\033[1;35m\033[40m$(lsd -lah | wc -l) items found."
}

alias l="custom_lsd"
alias ls="lsd"
alias ll="eza -lahTR"
