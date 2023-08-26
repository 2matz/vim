" 查找

 " 字符(当前)
nmap fb :Telescope current_buffer_fuzzy_find <cr>
 " 当前字
nmap fc :Telescope grep_string <cr>
 " 字符(全局)
nmap ff :Telescope live_grep <cr>
 " 文件
nmap fF :Telescope find_files <cr>
 " 标记
nmap fm :Telescope vim_bookmarks all<cr>
 " 最近文件
nmap fr :Telescope oldfiles <cr>
 " 符号
nmap fs :Telescope lsp_document_symbols <cr>

" 跳转

 " 返回
nmap gb :bp <cr>
 " 当前位置
nmap gc :NERDTreeFind<cr>
 " 定义
nmap gd :Telescope lsp_definitions <cr>
 " 诊断
nmap gD :Telescope diagnostics <cr>
 " 类型
nmap gt :Telescope lsp_type_definitions <cr>
 " 使用
nmap gr :Telescope lsp_references <cr>

" 技巧
nmap tt :lua vim.lsp.buf.hover() <cr>

" 注释
imap <C-/> <Esc>:Commentary<cr>
nmap <C-/> :Commentary<cr>
vmap <C-/> :Commentary<cr>

" 切换
nmap <C-PageUp> :bprevious<CR>
nmap <C-PageDown> :bnext<CR>