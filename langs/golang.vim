" 保存文件后自动格式化
autocmd BufEnter *.go set updatetime=750
autocmd BufWritePre *.go silent! :AsyncRun -post=e go fmt %
" autocmd CursorHoldI *.go lua vim.lsp.buf.hover()
autocmd CursorHold,CursorHoldI *.go :Lspsaga hover_doc


" 启用LSP：gopls
lua require'lspconfig'.gopls.setup{}
" 保存文件前自动导入
