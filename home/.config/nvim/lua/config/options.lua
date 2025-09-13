-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Luaによる設定の参考
-- https://github.com/willelz/nvim-lua-guide-ja/blob/master/README.ja.md

local opt = vim.opt

-- 相対行数の表示を無効化
opt.relativenumber = false
-- 折返し表示を有効化
opt.wrap = true

opt.spelllang = { "en", "cjk" }

-- Undercurl
-- 波線を正しく表示する
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Cs = "\e[4:0m"]])

-- obsidian-nvimがnvim-cmp準拠
vim.g.lazyvim_cmp = "nvim-cmp"