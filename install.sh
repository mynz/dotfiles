#!/usr/local/bin/bash


# list dotfiles apart from "." and ".."
for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue

	echo "$f"

	ln -s "$f" "$HOME"/"$f"
done
