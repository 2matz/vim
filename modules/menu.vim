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
	\ [ '&Open File\ta-o', 'Telescope find_files' ],
	\ [ 'Open &Recent ...\ta-r', 'Telescope oldfiles' ],
	\ [ '&Save\ta-s', 'w' ],
	\ [ '--', '' ],
	\ [ '&Exit\ta-s', 'qa' ],
\])


call quickui#menu#install('&Find', [
	\ [ 'Find', 'Telescope current_buffer_fuzzy_find'],
	\ [ '&Current\tf+c', 'Telescope grep_string'],
	\ [ '--', '' ],
	\ [ '&Find in Files\tf+f', 'Telescope live_grep'],
	\ [ '&Symbol\tf-s ...', 'Telescope lsp_dynamic_workspace_symbols' ],
\])

call quickui#menu#install('&Goto', [
	\ [ '&Back\tg-b', 'bp' ],
	\ [ '&Definition\tg-d', 'Telescope lsp_definitions' ],
	\ [ 'Diagnostics ...', 'Telescope diagnostics'],
	\ [ 'File Location', 'execute cd expand("%:p:h") | Lexplore'],
	\ [ 'Switch File ...', 'Telescope buffers' ],
	\ [ '&Symbol\tg-s ...', 'Telescope lsp_document_symbols' ],
	\ [ '&Type\tg-t', 'Telescope lsp_type_definitions' ],
	\ [ '&Usage\tg-u', 'Telescope lsp_incoming_calls' ],
	\ [ "--", '' ],
\])


call quickui#menu#install('&Refactor', [
	\ [ "&Action\tr+a", 'Lspsaga code_action' ],
	\ [ "&Rename\tr+r", 'Lspsaga rename' ],
	\ [ '--', '' ],
\])


call quickui#menu#install('&Debug', [
	\ [ "&Continue\tF5", 'VimspectorContinue' ],
	\ [ "&Restart\tF4", 'VimspectorRestart' ],
	\ [ "&Stop\tF3", 'VimspectorStop' ],
	\ [ "--", '' ],
	\ [ "Step&Over\tF10", 'VimspectorStepOver' ],
	\ [ "Step&Into\tF11", 'VimspectorStepInto' ],
	\ [ "Step&Out\tF12", 'VimspectorStepOut' ],
	\ [ "--", '' ],
	\ [ "Reset", 'VimspectorReset' ],
\])

call quickui#menu#install('G&it', [
	\ [ '&Branches ...\ti-b', 'Telescope git_branches' ],
	\ [ '&Commits ...\ti-c', 'Telescope git_commits' ],
	\ [ '&Diff\ti-c', 'Gitsigns diffthis' ],
	\ [ '&Next hunk\ti-n', 'Gitsigns next_hunk' ],
	\ [ '&Prev hunk\ti-p', 'Gitsigns prev_hunk' ],
	\ [ '&Reset\ti-r', 'Gitsigns reset_buffer' ],
	\ [ '&Status ...\ti-s', 'Telescope git_status' ],
	\ [ 'Stash ...', 'Telescope git_stash' ],
\])



call quickui#menu#install('&Tools', [
	\ [ '&Run\tt-r', 'Telescope commands' ],
	\ [ 'Reload Settings', 'source $MYVIMRC' ],
	\ [ '&Settings \tt-s', 'Telescope vim_options' ],
	\ [ "--", '' ],
\])

call quickui#menu#install('&View', [
	\ [ '&Breakpoints\tv-b', 'VimspectorBreakpoints'],
	\ [ '&Diagnostic\tv-d', 'TroubleToggle'],
	\ [ '&File\tv-f', 'Lexplore' ],
	\ [ '&Git\tv-g', 'lua _lazygit_toggle()' ],
	\ [ '&Terminal', 'ToggleTerm' ],
	\ [ "--", '' ],
\])


lua <<EOF
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "tab", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end
EOF
