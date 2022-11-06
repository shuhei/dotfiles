#!/usr/bin/env bash

# Install packages in Brewfile.
brew bundle

# Install fzf key bindings and fuzzy completion.
$(brew --prefix)/opt/fzf/install
