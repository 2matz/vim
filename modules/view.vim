" 设置字体
set guifont="FiraCode Nerd Font Mono:h11:w57"

"let g:netrw_winsize = 20
" 更改光标样式
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"


" 自动打开文件树
autocmd VimEnter * NERDTree

" 自动激活第2个窗口
autocmd VimEnter * wincmd w

" 自动在预览窗口显示行数
autocmd User TelescopePreviewerLoaded setlocal number


let g:airline#extensions#nvimlsp#enabled = 1

let g:airline#extensions#lsp#enabled = 1

" 自动高亮
autocmd FileType  * TSBufToggle highlight

" 自动切换目录
let g:NERDTreeChDirMode = 2
autocmd BufEnter * lcd %:p:h
" 美化自动填充

" 高亮LSP状态
highlight FidgetTitle ctermfg=white guifg=#ff3e00

lua <<EOF

EOF

" 高亮空白符
lua <<EOF
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" 数据库图标
let g:db_ui_use_nerd_fonts=1

" 高亮当前
lua <<EOF
require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
})
EOF
