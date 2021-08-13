# Aliases for Git
alias g='git'
alias gs='git status'
alias gss='git status -s'
alias go='git checkout'
alias gc='git commit -m'
alias gca='git commit -am'
alias ga='git add -A'
alias grmall='git status | grep deleted: | cut -d: -f2 | xargs git rm
alias fixup='!git add . && git commit --fixup=${1:-$(git rev-parse HEAD)} && GIT_EDITOR=true git rebase --in$
