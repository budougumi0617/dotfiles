return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "graphql-language-service-cli",
      })
    end,
  },
  -- NOTE: custom key config
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     -- add a keymap
  --     keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  --   end,
  -- }
}

