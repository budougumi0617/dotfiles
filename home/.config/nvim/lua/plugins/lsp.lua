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
        "css-lsp",
        "graphql-language-service-cli",
        "golangci-lint",
        "rust-analyzer",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              -- checkOnSave で clippy を自動実行
              checkOnSave = {
                command = "clippy", -- ここを 'clippy' にすると保存時に自動実行
              },
            },
          },
        },
      },
    },
  },
}
