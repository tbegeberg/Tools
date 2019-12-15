parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\e[33m\]\w\[\e[m\]\[\e[31m\]\$(parse_git_branch)\[\e[m\] "
