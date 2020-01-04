# Set the git prompt
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}->%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[cyan]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%} !"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%} —"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[green]%} »"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[white]%} #"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%} ?"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[yellow]%} $"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[blue]%} •|"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[blue]%} |•"

# Fix prompt cursor when exiting vim
_fix_cursor() {
  echo -ne '\e[3 q'
}
precmd_functions+=(_fix_cursor)

# Set the left prompt
if [[ -z ${TYPEWRITTEN_MULTILINE} ]]; then
  # Set the left prompt (singleline)
  local user_prompt='%(?,%{$fg[blue]%}> ,%{$fg[red]%}> )'
  PROMPT="${user_prompt}"
else
  # Distinction between normal and root user
  if [[ ${UID} -eq 0 ]]; then
    local user_host='%{$fg[red]%}%n@%m %{$reset_color%}'
    local user_prompt='%{$fg[red]%}$ %{$reset_color%}'
  else
    local user_host='%{$fg[magenta]%}%n@%m %{$reset_color%}'
    local user_prompt='%{$fg[blue]%}> %{$reset_color%}'
  fi
  # Set the left prompt (multiline)
  PROMPT="${user_host}
${user_prompt}"
fi

# Set the return code
local return_code=' %(?,,%{$fg[magenta]%}RC=%?%{$reset_color%})'

# Set directory
local directory_path='%{$fg[magenta]%}%c%{$reset_color%}'

# Set git repository
local git_info='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

# Set the right prompt
RPROMPT="${directory_path}"
RPROMPT+="${git_info}"
RPROMPT+="${return_code}"
