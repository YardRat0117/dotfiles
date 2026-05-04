alias bat=batcat
alias ls=lsd
alias gdb='gdb -tui'
alias icat='kitty +kitten icat'
alias :q='exit'
eval "$(zoxide init zsh --cmd zd)"

d () {
    if [[ -n $1 ]]; then
        cd "$(dirs -l +$1)"
    else
        dirs -v | head -n 10
    fi
}


# These aliases inspired the project `ratbox`.
# This section is remained in memorial of them.
# Check `https://github.com/YardRat0117/foxbox/` please.

# alias for containers
# alias c_gcc='podman run -it --rm -v .:/workspace -w /workspace gcc:latest gcc'
# alias c_g++='podman run -it --rm -v .:/workspace -w /workspace gcc:latest g++'
# alias c_clang='podman run -it --rm -v .:/workspace -w /workspace silkeh/clang:latest clang'
# alias c_clang++='podman run -it --rm -v .:/workspace -w /workspace silkeh/clang:latest clang++'
