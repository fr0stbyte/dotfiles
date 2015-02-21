autocmd FileType c,cpp,java,scala,pl,py,rb,coffee,js,r,m autocmd BufWritePre * :%s/\s\+$//e
