#!/bin/bash


# Script to install v-vim in a specified directory on your runtimepath
# Usage: install.sh $VIMDIR

if [[ $# -ne 1 ]]; then
	echo $'\x1b[31minvalid args'
	echo $'usage: install.sh $VIMDIR\x1b[0m' >&2
	exit 1
fi

VIMDIR=$1

echo "Installing v-vim in $VIMDIR:" >&2

mkdir -p $VIMDIR/syntax && cp ./syntax/vlang.vim $VIMDIR/syntax
echo $'...\tvlang.vim copied to ' "$VIMDIR/syntax" >&2

FNAME=filetype.vim
if [[ -f $VIMDIR/$FNAME ]]; then
	COUNT=$(grep --count 'setf vlang' $VIMDIR/$FNAME)
	if [[ $COUNT -ge 1 ]]; then
		echo $'...\tv already installed in ' "$VIMDIR/$FNAME" >&2
	else
		SRCH=$'augroup\s\s*filetypedetect'
		ADD=$'\tau BufNewFile,BufRead *.v,*.vh\tsetf vlang'
		OLDIFS=$IFS
		OUTPUT=''
		OLDIFS=$IFS
		IFS=$'\n'
		FILE=$(cat $VIMDIR/$FNAME)
		HAS_APPENDED='F'
		for LN in $FILE; do
			OUTPUT+="$LN"
			OUTPUT+=$'\n'
			if [[ $HAS_APPENDED = 'F' ]] && [[ $(echo "$LN" | grep -c "$SRCH") -ne 0 ]]; then
				OUTPUT+="$ADD"
				OUTPUT+=$'\n'
				HAS_APPENDED='T'
			fi
		done
		if [[ $HAS_APPENDED = 'F' ]]; then
			echo $'\x1b[31m"augroup filetypedetect" not present in '\
				"$VIMDIR/$FNAME" $'\x1b[0m'
			exit 1
		fi
		mv $VIMDIR/$FNAME $VIMDIR/$FNAME.old
		echo "$OUTPUT" > $VIMDIR/$FNAME
		echo $'...\tv installed in ' "$VIMDIR/$FNAME" >&2
		IFS=$OLDIFS
	fi
else
	cp ./$FNAME $VIMDIR
	echo $'...\t' "$FNAME installed in $VIMDIR" >&2
fi

echo $'\x1b[32mPlugin successfully installed in' "$VIMDIR" $'\x1b[0m'
exit 0

