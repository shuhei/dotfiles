function status_color() {
  if [ "$?" != 0 ]; then
    echo "%{$fg[red]%}"
  else
    echo "%{$fg[green]%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT="[%{$fg[yellow]%}%~%{$reset_color%}]"
PROMPT+="%{$fg[gray]%}%{$reset_color%} $(git_prompt_info) $(status_color)€%{$reset_color%} "
