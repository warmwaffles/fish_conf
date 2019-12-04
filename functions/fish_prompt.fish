# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate 'x'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt --description 'Write out the prompt'
    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l prompt_symbol ''

    switch "$USER"
    case root toor
        set prompt_symbol '#'
    case '*'
        set prompt_symbol '$'
    end

    printf "[%s%s%s@%s%s%s]%s%s " (set_color red) $USER (set_color normal) (set_color $fish_color_cwd) $pwd (set_color normal) $prompt_symbol (__fish_git_prompt)
end
