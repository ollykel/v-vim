#!/bin/bash


# Script to install v-vim in a specified directory on your runtimepath
# Usage: install.sh $VIMDIR

if [[ $# -ne 1 ]]; then
	echo $'\x1b[31minvalid args' >&2
	echo $'usage: install.sh $VIMDIR\x1b[0m' >&2
	return 1
fi

VIMDIR=$1

echo "Installing v-vim in $VIMDIR:" >&2

cp ./syntax/vlang.vim $VIMDIR/syntax
echo $'...\tvlang.vim copied to ' "$VIMDIR/syntax" >&2

if [[ -f $VIMDIR/filetype.vim ]]; then
	COUNT=$(grep --count 'setf vlang' $VIMDIR/filetype.vim)
	if [[ $COUNT -ge 1 ]]; then
		echo $'...\tv already installed in ' "$VIMDIR/filetype.vim" >&2
	else
		SRCH=$'augroup\s\s*filetypedetect'
		ADD=$'\tau BufNewFile,BufRead *.v,*.vh\tsetf vlang'
		OLDIFS=$IFS
		OUTPUT=''
		OLDIFS=$IFS
		IFS=$'\n'
		FILE=$(cat $VIMDIR/filetype.vim)
		for LN in $FILE; do
			echo "LN: $LN" >&2
			OUTPUT+="$LN"
			OUTPUT+=$'\n'
			if [[ $(echo "$LN" | grep -c "$SRCH") -ne 0 ]]; then
				OUTPUT+="$ADD"
				OUTPUT+=$'\n'
			fi
		done
		echo $'Output:\n' "$OUTPUT" >&2
		mv $VIMDIR/filetype.vim $VIMDIR/filetype.vim.old
		echo "$OUTPUT" > $VIMDIR/filetype.vim
		echo $'...\tv installed in ' "$VIMDIR/filetype.vim" >&2
		IFS=$OLDIFS
	fi
else
	cp ./filetype.vim $VIMDIR
	echo $'...\tfiletype.vim installed in ' "$VIMDIR" >&2
fi

echo $'\x1b[32mPlugin successfully copied to' "$VIMDIR" $'\x1b[0m'
return 0

