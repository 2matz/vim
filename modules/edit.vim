autocmd BufWritePre * lua vim.lsp.buf.format()

lua <<EOF

EOF