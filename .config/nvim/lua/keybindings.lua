local map = vim.api.nvim_set_keymap

-- Leader
vim.g.mapleader = "'"

-- Buffer Keys
map('n', '<C-h>', ':wincmd h<CR>', {silent = true, noremap = true})
map('n', '<C-j>', ':wincmd j<CR>', {silent = true, noremap = true})
map('n', '<C-k>', ':wincmd k<CR>', {silent = true, noremap = true})
map('n', '<C-l>', ':wincmd l<CR>', {silent = true, noremap = true})

map('n', '<Leader>q', '<cmd>bdelete!<CR>', {silent = true, noremap = true})

-- LSP Keys
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {silent = true, noremap = true})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {silent = true, noremap = true})
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent = true, noremap = true})
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true, noremap = true})
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {silent = true, noremap = true})
map('n', '<C-n>', '<cmd>lua vim.lsp.buf.goto_next()<CR>', {silent = true, noremap = true})
map('n', '<C-p>', '<cmd>lua vim.lsp.buf.goto_prev()<CR>', {silent = true, noremap = true})
map('n', '<C-d>', '<cmd>lua vim.lsp.buf.show_line_diagnostics()<CR>', {silent = true, noremap = true})

-- Fix for gg
map('n', 'gg', '<C-Home>', { noremap = true })

-- LSP Trouble Keys
map('n', '<leader>xx', '<cmd>LspTroubleToggle<cr>', {silent = true, noremap = true})
map('n', '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>', {silent = true, noremap = true})
map('n', '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagnostics<cr>', {silent = true, noremap = true})
map('n', '<leader>xl', '<cmd>LspTroubleToggle loclist<cr>', {silent = true, noremap = true})
map('n', '<leader>xq', '<cmd>LspTroubleToggle quickfix<cr>', {silent = true, noremap = true})
map('n', 'gr', '<cmd>LspTrouble lsp_references<cr>', {silent = true, noremap = true})

-- Compe Keys
map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true, noremap = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true, noremap = true})
map('i', '<C-Space>', 'compe#complete()', {expr = true, noremap = true})
map('i', '<CR>', 'compe#confirm("<CR>")', {expr = true, noremap = true})

-- Telescope Keys
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true })
map('n', '<Leader>fGg', "<cmd>lua require('telescope.builtin').git_commits()<CR>", { noremap = true })
map('n', '<Leader>fGc', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", { noremap = true })
map('n', '<Leader>fGb', "<cmd>lua require('telescope.builtin').git_branches()<CR>", { noremap = true })
map('n', '<Leader>fGs', "<cmd>lua require('telescope.builtin').git_status()<CR>", { noremap = true })

-- TODO Comments Keys
map('n', '<Leader>t', '<cmd>TodoTrouble<CR>', { silent = true, noremap = true })
