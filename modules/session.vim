let g:auto_session_root_dir = C:/Users/dtkx/Desktop/data/neovim/sessions
let g:auto_session_pre_save_cmds = ["NERDTreeClose"]
set sessionoptions-=blank
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

lua <<EOF

require('auto-session').setup {
    post_restore_cmds = {"NERDTreeFind"}
}
EOF
