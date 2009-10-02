"Check to see if the filetype was automagically identified by Vim

if exists("did_load_filetypes")

    finish

else

    augroup filetypedetect

    au! BufRead,BufNewFile *.m       setfiletype objc

    augroup END
endif
