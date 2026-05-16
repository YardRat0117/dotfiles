# Input method support (Fcitx5)
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=fcitx

export CC=clang
export CXX=clang++
export GOPATH="$HOME/.go"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$(go env GOPATH):$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export GOPROXY=https://goproxy.cn,direct
eval "$(fnm env)"
