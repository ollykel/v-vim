if exists("b:did_ftplugin")
	finish
endif

setlocal commentstring=//\ %s
setlocal makeprg=v\ %

if exists('b:undo_ftplugin')
	let b:undo_ftplugin .= "|setlocal commentstring< makeprg<"
else
	let b:undo_ftplugin = "setlocal commentstring< makeprg<"
endif
