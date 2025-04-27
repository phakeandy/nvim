-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map('i', '<C-c>', '<Esc>')

-- map('x', '<Up>', ':move-1<CR>gv=gv', { desc = 'Move selected lines up one line' })
-- map('x', '<Down>', ':move+1<CR>gv=gv', { desc = 'Move selected lines down one line' })
