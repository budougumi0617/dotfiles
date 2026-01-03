return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      table.insert(opts.spec, {
        mode = { "n", "v" },
        { "<leader>o", group = "obisidian", icon = { icon = "", color = "purple" } },
        { "<leader>p", group = "overlook", icon = { icon = " ", color = "yellow" } },
      })
    end,
  },
}
