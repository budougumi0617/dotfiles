return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "graphql",
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "yaml",
        "go",
      },
    },
  },
}
