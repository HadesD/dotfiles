PROMPT=$'%{$fg_bold[cyan]%}%n%{$fg[white]%}:%{$fg[magenta]%}%m %{$reset_color%}%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)\
%{$fg[blue]%}%{$fg_bold[blue]%}$%{$reset_color%} '
RPROMPT='%{$fg_bold[white]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}:%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
