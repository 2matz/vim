
lua <<EOF
 vim.keymap.set('n', '<F1>', function() require'telescope'.extensions.dap.commands{} end)
 vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
 vim.keymap.set('n', '<Ctrl><F5>', function() require('dap').restart() end)
 vim.keymap.set('n', '<F12>', function() require('dap').terminate() end)
 vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
 vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
 vim.keymap.set('n', '<F9>', function() require('dap').step_out() end)
 vim.keymap.set('n', '<F3>', function() require('dap').toggle_breakpoint() end)
 vim.keymap.set('n', '<Ctrl><F3>', function() require('dap').clear_breakpoints() end)
 vim.keymap.set('n', '<F4>', function() require'telescope'.extensions.dap.list_breakpoints{} end)
EOF