# Support for V in Vim
The files in this repository provide support for the [v programming language](https://vlang.io) in Vim.

## Installation

### Using a Plugin Manager

You can install V support with a vim plugin manager as usual, for example with [Plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'ollykel/v-vim'

```
Reload config (or save & exit vim/neovim), then:

```vim
:PlugInstall
```

## Options
You can add any of the following into your vim config to disable highlighting.  
All options are enabled by default.

```vim
" Disable highlight white space after "[]".
let g:v_highlight_array_whitespace_error = 0

" Disable highlight white space around the communications operator that don't follow the standard style.
let g:v_highlight_chan_whitespace_error = 0

" Disable highlight instances of tabs following spaces.
let g:v_highlight_space_tab_error = 0

" Disable highlight trailing white space.
let g:v_highlight_trailing_whitespace_error = 0

" Disable highlight function calls.
let g:v_highlight_function_calls = 0

let g:v_highlight_fields = 0
```
