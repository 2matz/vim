" 【加载插件】
call plug#begin('~/.vim/plugged')
    Plug 'skywind3000/vim-quickui' " UI

    " 搜索
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'         " telescope依赖项

    " LSP相关
    Plug 'williamboman/mason.nvim'       " LSP、DAP
    Plug 'neovim/nvim-lspconfig'         " LSP配置
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }


    " 检测/调试
    Plug 'folke/trouble.nvim'
    Plug 'puremourning/vimspector'       " 调试，依赖python3，以及pip3 install neovim

    " 语法高亮
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " 自动补全
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'


    " 增强
    Plug 'airblade/vim-rooter'           " 自动切换工作目录
    Plug 'skywind3000/asyncrun.vim'      " 异步任务
    Plug 'lewis6991/gitsigns.nvim'       " Git

    " 标签栏
    Plug 'akinsho/bufferline.nvim'

    " 状态栏
    Plug 'vim-airline/vim-airline'

    " 终端
    Plug 'akinsho/toggleterm.nvim'


    " 主题/图标
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
" 基础设置
set encoding=utf-8
let g:netrw_keepdir= 0

" 【Mason】
lua require("mason").setup()
lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go" },
  auto_install = true,
  highlight = {
    enable = true
  }
}

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}


require("toggleterm").setup {
    
}


local saga = require("lspsaga")

saga.init_lsp_saga({
    symbol_in_winbar = {
        in_custom = false
    }
})
EOF

" 【通用配置】

" 设置前缀键
let mapleader = " "

" 启用鼠标
set mouse=a

" 【加载模块配置】
let currentPath = expand('<sfile>:h')
let g:vimspector_base_dir = currentPath
for file in glob(currentPath . '/modules/*.vim', 0, 1 )
    execute 'source' file
endfor

" 【加载语言配置】
for file in glob(currentPath . '/langs/*.vim', 0, 1 )
    execute 'source' file
endfor
