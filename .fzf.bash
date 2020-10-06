# Setup fzf
# ---------
if [[ ! "$PATH" == */home/diego/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/diego/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/diego/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/diego/.fzf/shell/key-bindings.bash"

# Default options
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height 20%"
