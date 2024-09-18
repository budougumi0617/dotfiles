return {
    {
        "linrongbin16/gitlinker.nvim",
        cmd = "GitLink",
        keys = {
          { "<leader>gl", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Git: yank git permalink" },
          { "<leader>gL", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Git: open git permalink" },
        },
        opts = {},
      },
}