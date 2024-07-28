-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jj", "<Esc>", opts)
-- Altキーを使ったキーマップを使うときはiterm2の設定を変えておく必要がある
-- https://qiita.com/DQNEO/items/524724982ef49beb7f56
-- iTerm2のPreference -> Profiles -> keys の設定画面で、\
-- Left Option key acts as +Esc にチェックjj
--
-- keymap.set("n", "<A-z>", "<cmd>FzfLua live_grep<cr>", opts)