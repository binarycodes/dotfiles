# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#if [ "$(tty)" = "/dev/tty1" ];then
#  exec Hyprland
#fi

export EDITOR=vim

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Aliases
alias ls='ls --color'
alias gitlog='git log --abbrev-commit --pretty=format:"%C(magenta)%h %C(red)% G? %Cgreen%ad (%>(15,trunc)%cr)  %Cblue%<(15,trunc)%an %Creset%s %Cred% gD% D" --date="format-local:%Y-%m-%d %H:%M:%S"'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


setopt extended_glob null_glob

touch $XDG_RUNTIME_DIR/ssh-agent.env

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

claude() {
    local stack="${1}"
    local workspace="${2}"

    # read two args, the rest are forwarded to the docker container
    shift 2

    local workspace_abs
    local image
    local -a cmd

    if [[ ! -d "$workspace" ]]; then
        printf 'error: workspace must be an existing directory: %s\n' "$workspace" >&2
        return 1
    fi

    workspace_abs="$(cd "$workspace" && pwd -P)" || return 1
    image="docker.io/binarycodes/claude-local:${stack}"

    local claude_home="$HOME/.local/share/claude"
    if [[ ! -f "$claude_home/claude.json" ]]; then
        mkdir -p $claude_home
        touch $claude_home/claude.json
    fi

    cmd=(
        docker run
        --rm
        -it
        --pull always
        -v claude_config:/home/agent/.claude
        -v "${claude_home}/claude.json:/home/agent/.claude.json"
        -v "${workspace_abs}:/workspace"
        -w /workspace
        --name "claude-${stack}-$(date +%s)"
        "$image"
        "$@" # forward extra args
    )

    "${cmd[@]}"
}
