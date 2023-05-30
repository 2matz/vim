" 保存文件后自动格式化
" autocmd BufEnter *.go set updatetime=750
autocmd BufWritePre *.go silent! :AsyncRun -post=e go fmt %
" autocmd CursorHoldI *.go lua vim.lsp.buf.hover()


" 启用LSP：gopls
lua <<EOF
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}

EOF
" 保存文件前自动导入



" 调试设置
