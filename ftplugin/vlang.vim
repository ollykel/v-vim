if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

function! _VFormatFile()
	if exists('g:v_autofmt_bufwritepre') && g:v_autofmt_bufwritepre || exists('b:v_autofmt_bufwritepre') && b:v_autofmt_bufwritepre
		let output = split(system("v fmt -w " . expand("%")), "\n")
		if v:shell_error != 0
            for line in output
                echoerr line
            endfor
		else
			let [_, lnum, colnum, _] = getpos('.')
            edit
            call cursor(lnum, colnum)
		endif
	endif
endfunction

if has('autocmd')
	augroup v_fmt
		autocmd BufWritePost *.v call _VFormatFile()
	augroup END
endif
