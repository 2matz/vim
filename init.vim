" 【加载插件】
call plug#begin('~/.vim/plugged')
    Plug 'skywind3000/vim-quickui' " UI
    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }

    " 搜索
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'         " telescope依赖项

    " LSP相关
    Plug 'williamboman/mason.nvim' , {'do': ':MasonInstall gopls' }      " LSP、DAP
    Plug 'neovim/nvim-lspconfig'         " LSP配置
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind.nvim'


    " 检测/调试
    Plug 'folke/trouble.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'jay-babu/mason-nvim-dap.nvim'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'leoluz/nvim-dap-go'
    Plug 'tpope/vim-surround'
    Plug 'nvim-telescope/telescope-dap.nvim'
    Plug 'theHamsta/nvim-dap-virtual-text'
   

    " 语法高亮
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " 自动补全

    Plug 'LunarWatcher/auto-pairs'

    " 增强
    Plug 'airblade/vim-rooter'           " 自动切换工作目录
    Plug 'skywind3000/asyncrun.vim'      " 异步任务
    Plug 'lewis6991/gitsigns.nvim'       " Git
    Plug 'RRethy/vim-illuminate' " 当前高亮
    Plug 'sudormrfbin/cheatsheet.nvim' " 备忘录
    Plug 'folke/which-key.nvim' " 按键
    Plug 'majutsushi/tagbar' " 代码结构
    Plug 'lukas-reineke/indent-blankline.nvim' " 高亮空白符
    Plug 'tpope/vim-commentary' " 注释
    Plug 'ldelossa/litee.nvim' " 调用栈
    Plug 'ldelossa/litee-calltree.nvim'
    Plug 'jackMort/ChatGPT.nvim'

    " 跳转
    Plug 'ggandor/leap.nvim'


    " 标签栏
    Plug 'akinsho/bufferline.nvim'

    " 状态栏
    Plug 'vim-airline/vim-airline'

    " 终端
    Plug 'akinsho/toggleterm.nvim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'tanvirtin/vgit.nvim'

    " 文件管理
    Plug 'preservim/nerdtree'
    " 项目管理
    Plug 'nvim-telescope/telescope-project.nvim'

    " 会话管理
    Plug 'jedrzejboczar/possession.nvim'


    " 主题/图标
    Plug 'themercorp/themer.lua' " 主题管理器
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/tokyonight.nvim'
    Plug 'MunifTanjim/nui.nvim'

call plug#end()
" 基础设置
set encoding=utf-8
let g:netrw_keepdir= 0

" Leap
lua require('leap').add_default_mappings()

" 【Mason】
lua require("mason").setup()
lua require("mason-nvim-dap").setup()
lua require('dap-go').setup()
lua require("toggleterm").setup()
lua require("nvim-dap-virtual-text").setup()


lua require("telescope").load_extension('project')
lua require('telescope').load_extension('dap')
lua require('telescope').load_extension('possession')

lua <<EOF
require('possession').setup {  
   autosave = {
        current = true,
        tmp = true,
        tmp_name = 'tmp',
        on_load = true,
        on_quit = true,
    },
}
require('telescope').setup{
    defaults = {
      previewer = true,
      scroll_lines = 1000,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      layout_config = {  
        horizontal = {
            width = 0.9,
            mirror = true
        } 
      }
    },
    pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
  }

require("chatgpt").setup({
    api_key_cmd = "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"
})

vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

require('vgit').setup()


require("which-key").setup {
    
}

require('litee.lib').setup({
    	tree = {
		icon_set = "codicons"
	},
	panel = {
		orientation = "left",
			panel_size  = 30
		}
})

require('litee.calltree').setup({})

vim.lsp.handlers['callHierarchy/incomingCalls'] = vim.lsp.with(
            require('litee.lsp.handlers').ch_lsp_handler("from"), {}
	    )
	    vim.lsp.handlers['callHierarchy/outgoingCalls'] = vim.lsp.with(
	                require('litee.lsp.handlers').ch_lsp_handler("to"), {}
	)

local cmp = require'cmp'
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
     
    }, {
      { name = 'buffer' },
    })
  })

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', 
      maxwidth = 50, 
      ellipsis_char = '...',
    })
  }
}
 


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go" },
  auto_install = true,
  highlight = {
    enable = true
  },
  incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    }
   
}


local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})


EOF

" 【通用配置】

" 设置前缀键
let mapleader = " "

" 启用缩进
let g:indent_guides_enable_on_vim_startup = 1

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
