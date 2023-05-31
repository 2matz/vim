" 保存文件后自动格式化
" autocmd BufEnter *.go set updatetime=750
autocmd BufWritePre *.go silent! :AsyncRun -post=e go fmt %
" autocmd CursorHoldI *.go lua vim.lsp.buf.hover()


" 启用LSP：gopls
lua <<EOF

local on_attach = function(client)
   require("notify")("LSP解析完成")
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['gopls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}

EOF
" 保存文件前自动导入

" 代码片段
lua <<EOF
require("luasnip").filetype_extend("go", { "go" })
EOF
" 调试设置
