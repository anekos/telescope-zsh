# telescope-zsh

`telescope-zsh` is an extension for [telescope.nvim][], which add the picker for Zsh history.

[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim

# Setup

To load the extension, use the following command:

```lua
require('telescope').load_extension('zsh')
```

# Usage

```vim
:Telescope zsh
```

# Requirements

[watiko/zsh-history-utils](https://github.com/watiko/zsh-history-utils)

```sh
$ cargo install --git https://github.com/watiko/zsh-history-utils
```
