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

function! _VFormatFile()
	if exists('g:v_autofmt_bufwritepre') && g:v_autofmt_bufwritepre || exists('b:v_autofmt_bufwritepre') && b:v_autofmt_bufwritepre
		execute "%!v fmt -"
	endif
endfunction

if has('autocmd')
	augroup v_fmt
		autocmd BufWritePre *.v call _VFormatFile()
	augroup END
endif
