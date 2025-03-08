-- VSCode Neovimとの使いわけ
if vim.g.vscode == 1 then
  -- require("config.vscode")
  -- https://zenn.dev/r57ty7/articles/accd3014e22366
  local opt = vim.opt
  opt.clipboard = "unnamedplus" -- yankでクリップボードに

  opt.spelllang = { "en", "cjk" }
  opt.ignorecase = true
  opt.smartcase = true

  if vim.fn.has("mac") == 1 then
    opt.ttimeoutlen = 1
    local imeoff = 'osascript -e "tell application \\"System Events\\" to key code 102"'

    local group = vim.api.nvim_create_augroup("MyIMEGroup", { clear = true })

    vim.api.nvim_create_autocmd("InsertLeave", {
      group = group,
      callback = function()
        vim.fn.system(imeoff)
      end,
    })
  end
  return
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
