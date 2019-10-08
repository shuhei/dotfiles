# The color codes are from `spectrum_ls` command.

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# %~ is the current working directory relative to the home directory
PROMPT="[%{$FG[228]%}%~%{$reset_color%}]"

PROMPT+=" $(git_prompt_info)"

# https://stackoverflow.com/questions/4466245/customize-zshs-prompt-when-displaying-previous-command-exit-code
PROMPT+=" %(?.%{$FG[154]%}.%{$FG[005]%})€%{$reset_color%} "
