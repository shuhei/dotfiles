# See `man zshmisc` for prompt escapes (%)
# Use 3-bit colors so that they change according to terminal color schemes.

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{default}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{default})%f"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Use single quotes for PROMPT
# https://github.com/robbyrussell/oh-my-zsh/issues/4826

PROMPT='[%F{yellow}%~%f]'

PROMPT+='$(git_prompt_info)'

# https://stackoverflow.com/questions/4466245/customize-zshs-prompt-when-displaying-previous-command-exit-code
PROMPT+=' %(?.$fg[green].$fg[red])€%f '
