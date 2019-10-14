#!/bin/sh
mkdir -p ~/.config/coc/extensions
rm ~/.config/coc/extensions/package.json
ln -s $(pwd)/config/nvim/coc.json ~/.config/coc/extensions/package.json
