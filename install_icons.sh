#!/bin/bash

# script of quick installation of SE98 icon theme into ~/.local/share/icons or ~/.icons folder

localsharethemes="$HOME/.local/share/icons"
homethemes="$HOME/.icons"
[[ -d "$localsharethemes" ]] && cp -rv "$PWD/SE98" "$localsharethemes"
[[ ! -d "$localsharethemes" && -d "$homethemes" ]] && cp -r "$PWD/SE98" "$homethemes"
