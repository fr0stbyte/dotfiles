. "$HOME/.bashrc"

#GOPATH
export GOPATH=~/dev/src/go

# PATH configs
USEFUL_PATH=/usr/local/bin:/usr/local/sbin
PYTHON_PATH=/usr/local/share/python
TEX_PATH=/usr/texbin
PLAY_PATH=$HOME/lib/play-2.0.2 # add java play to path
NPM_PATH=$PATH:/usr/local/share/npm/bin
CABAL_PATH=$HOME/.cabal/bin
BIN_PATH=$HOME/bin
# RUST
CARGO_BIN_PATH=$HOME/.cargo/bin
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

export PATH=$USEFUL_PATH:$GOPATH/bin:$CABAL_PATH:$NPM_PATH:$PLAY_PATH:$BIN_PATH:$TEX_PATH:$CARGO_BIN_PATH:$PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
