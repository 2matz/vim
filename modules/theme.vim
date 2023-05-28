" 【主题】
lua require("telescope").load_extension("themes")
lua require("themer").setup({ enable_installer = true })

" 设置窗口分割线
set fillchars=vert:\|

" 显示行号
set number

" 显示光标行
set cursorline

" 语法
syntax on

" 最大颜色
set t_Co=256

set background=dark

" 主题
colorscheme tokyonight-moon


" 状态栏主题
"let g:airline_theme='cobalt2'

" 菜单栏主题
let g:quickui_color_scheme = 'solarized'

" 分割线
set fillchars=vert:\ 
hi! VertSplit guifg=lightblue guibg=lightblue ctermfg=lightblue ctermbg=lightblue