PROMPT=$'%{$fg_bold[white]%}%D{[%X]} %{$fg[cyan]%}%n%{$fg[white]%}%{$reset_color%}@%{$fg[green]%}%m %{$reset_color%}%{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)\
%{$fg[blue]%}%{$fg_bold[blue]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
