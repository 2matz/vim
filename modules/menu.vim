let g:quickui_border_style = 2

" 前缀键+空格：打开菜单
nmap <silent><Leader><Space> :call quickui#menu#open('main')<cr>

" 设置菜单为主菜单
call quickui#menu#switch('main')
call quickui#menu#reset()

" 程序 Application
" 编辑 Edit
" 选择 Selection
" 查找 Find
" 视图 View
" 跳转 Goto
" 运行 Run
" 工具 Tools
" 项目 Project
" 帮助 Help 

call quickui#menu#install('&Application', [
	\ [ "&Open File\to", 'Telescope find_files' ],
	\ [ "Open &Recent ...\tr", 'Telescope oldfiles' ],
	\ [ "&Save\ts", 'w' ],
	\ [ "--", '' ],
	\ [ "&Exit\te", 'qa' ],
\])


call quickui#menu#install('&Find', [
	\ [ "Find", 'Telescope current_buffer_fuzzy_find'],
	\ [ "&Current\tc", 'Telescope grep_string'],
	\ [ "--", '' ],
	\ [ "&Find in Files\tf", 'Telescope live_grep'],
	\ [ "&Symbol\ts ...", 'Telescope lsp_dynamic_workspace_symbols' ],
\])

call quickui#menu#install('&Edit', [
	\ [ "&Comment\tc", 'Commentary'],
	\ [ "&Split/join\ts", 'TSJToggle'],
\])

call quickui#menu#install('&Goto', [
	\ [ "&Back\tb", 'bp' ],
	\ [ "&Current File\t", 'NERDTreeFind' ],
	\ [ "&Definition\td", 'Telescope lsp_definitions' ],
	\ [ "Diagnostics ...", 'Telescope diagnostics'],
	\ [ "&reference ...\tr", 'Telescope lsp_references' ],
	\ [ "Switch File ...", 'Telescope buffers' ],
	\ [ "&Symbol ...\ts", 'Telescope lsp_document_symbols' ],
	\ [ "&Type\tt", 'Telescope lsp_type_definitions' ],
	\ [ "--", '' ],
\])

call quickui#menu#install('&Preview', [
	\ [ "&Cursor\tc", 'lua vim.lsp.buf.hover()' ],
	\ [ "&Definition\td", 'lua require "telescope.builtin".lsp_definitions { jump_type = "never" }' ],
	\ [ "&Signature\ts", "lua require('lsp_signature').toggle_float_win()" ],
\])

call quickui#menu#install('&Refactor', [
	\ [ "&Action\ta", 'lua vim.lsp.buf.code_action()' ],
	\ [ "&Format\tf", 'lua vim.lsp.buf.format()' ],
	\ [ "&Suggest\ts", 'lua builtin.spell_suggest' ],
	\ [ "&Rename\tr", 'lua vim.lsp.buf.rename()' ],
	\ [ "--", '' ],
\])

call quickui#menu#install('&Build', [
	\ [ "&File\tf", 'AsyncTask file-run' ],
	\ [ "--", '' ],
\])


call quickui#menu#install('&Debug', [
  \ [ "Commands\tF1", "lua require'telescope'.extensions.dap.commands{}"],
  \ [ "--", '' ],
  \ [ "&All Breakpoint\tF4", "lua require'dap'.list_breakpoints()"],
  \ [ "&Breakpoint\tF3", "PBToggleBreakpoint"],
  \ [ "&Clear Breakpoint\tCtrl+F3", "lua require'dap'.clear_breakpoints()"],
	\ [ "--", '' ],
	\ [ "&Run\tF5", 'DapContinue' ],
	\ [ "&Restart\tCtrl+F5", "lua require'dap'.restart()"],
	\ [ "&Stop\tF12", 'DapTerminate' ],
	\ [ "--", '' ],
	\ [ "Step&Into\tF7", 'DapStepInto' ],
	\ [ "Step&Over\tF8", 'DapStepOver' ],
	\ [ "Step&Out\tF9", 'DapStepOut' ],
	\ [ "--", '' ],
	\ [ "Inspecting", 'DapToggleRepl' ],
	\ [ "Variables", "lua require'telescope'.extensions.dap.variables{}" ],
	\ [ "Frames", "lua require'telescope'.extensions.dap.frames{}" ],
\])

call quickui#menu#install('G&it', [
	\ [ "&Branches ...\tb", 'Telescope git_branches' ],
	\ [ "&Commits ...\tc", 'Telescope git_commits' ],
	\ [ "&Diff\td", 'Gitsigns diffthis' ],
	\ [ "&Next hunk\tn", 'Gitsigns next_hunk' ],
	\ [ "&Prev hunk\tp", 'Gitsigns prev_hunk' ],
	\ [ "&Reset\tr", 'Gitsigns reset_buffer' ],
	\ [ "&Status ...\ts", 'Telescope git_status' ],
	\ [ "Stash ...", 'Telescope git_stash' ],
\])



call quickui#menu#install('&Tools', [
	\ [ "&Run\tr", 'Telescope commands' ],
	\ [ "Reload Settings", 'source $MYVIMRC' ],
	\ [ "&Settings \ts", 'Telescope vim_options' ],
	\ [ "--", '' ],
\])

call quickui#menu#install('&View', [
  \ [ "De&bug\tb", 'lua require("dapui").toggle()'],
	\ [ "&Database\td", 'DBUIToggle'],
	\ [ "&Error\te", 'TroubleToggle'],
	\ [ "&File\tf", 'NERDTreeToggle' ],
	\ [ "&Git\tg", 'lua _lazygit_toggle()' ],
	\ [ "&Project\tp", 'Telescope session-lens search_session' ],
	\ [ "&Structure\ts", 'TagbarToggle' ],
	\ [ "&Terminal\tt", 'ToggleTerm' ],
	\ [ "--", '' ],
\])


lua <<EOF
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "tab", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end
EOF
