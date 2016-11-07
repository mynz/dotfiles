#!/usr/local/bin/bash


# list dotfiles apart from "." and ".."
for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue

	ln -s `pwd`/"$f" "$HOME"/"$f"
done
