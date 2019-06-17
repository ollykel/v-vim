# Support for V in Vim
The files in this repository provide support for syntax highlighting in Vim.
They must be installed in your vim runtimepath to work.

## Instructions
These instructions assume that you are using a \*nix-like os.
**\*\*NEW Jun 16, 2019: "Use install.sh $VIMDIR" to install files**
1. Choose which directory you wish to use.
If you wish to install these files for personal use only, use the directory
$HOME/.vim:
```bash
VIMDIR=$HOME/.vim
```
If you want other users to be able to use these files, use the directory
/usr/local/share/vim/vimfiles:
```bash
VIMDIR=/usr/local/share/vim/vimfiles
```
2. Copy the syntax file into $VIMDIR/syntax:
```bash
cp ./syntax/vlang.vim $VIMDIR/syntax
```
3. If the file $VIMDIR/filetype.vim already exists, copy the following line
into augroup filetypedetect:
```vim
au BufNewFile,BufRead *.v,*.vh	setf vlang
```
Otherwise, copy the file ./filetype.vim into $VIMDIR:
```bash
cp ./filetype.vim $VIMDIR
```

## A Note about Verilog
The language Verilog also uses the file extensions \*.v and \*.vh, which causes
collisions with v files.
This installation should override the verilog formatting settings, but I cannot
guarantee that it will.

If vlang syntax highlighting doesn't appear when you open your editor, execute
the following command:
```vim
:setf vlang
```

