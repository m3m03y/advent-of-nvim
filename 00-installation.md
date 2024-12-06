# Installation
## Download and/or Package Manager:
https://neovim.io/doc/

## From Source
`https://github.com/neovim/neovim/blob/master/BUILD.md`

1. Install [prerequisites](https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites)
    Ubuntu: 
    `sudo apt-get install ninja-build gettext cmake unzip curl build-essential`
2. Clone neovim repository:
    `git clone --depth 1 --branch stable https://github.com/neovim/neovim`
3. Checkout stable version:
    `cd neovim && git checkout stable`
4. Enter neovim dir and install:
    `make CMAKE_BUILD_TYPE=RelWithDebInfo`
5. (Unsupported) Build and install deb package to ensure easy cleanup.
    `cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb`

Notes from repo:
> The build type determines the level of used compiler optimizations and debug information:
> - Release: Full compiler optimizations and no debug information. Expect the best performance from this build type. Often used by package maintainers
> - Debug: Full debug information; few optimizations. Use this for development to get meaningful output from debuggers like GDB or LLDB. This is the default if CMAKE_BUILD_TYPE is not specified.
> - RelWithDebInfo ("Release With Debug Info"): Enables many optimizations and adds enough debug info so that when Neovim ever crashes, you can still get a backtrace.

