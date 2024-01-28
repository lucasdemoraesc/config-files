# History configuration
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="history:ls:pwd:cd ..:"

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Oh my posh
eval "$(oh-my-posh --init --shell bash --config "https://raw.githubusercontent.com/lucasdemoraesc/config-files/main/Windows/oh-my-posh/custom.omp.json")"

# bash parameter completion for the dotnet CLI
_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _dotnet_bash_complete dotnet

# Load Angular CLI autocompletion.
source <(ng completion script)
