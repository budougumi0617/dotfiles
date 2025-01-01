-- VSCode Neovimとの使いわけ
if vim.g.vscode == 1 then
  -- require("config.vscode")
  -- https://zenn.dev/r57ty7/articles/accd3014e22366
  local opt = vim.opt
  opt.clipboard = "unnamedplus" -- yankでクリップボードに
  return
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
