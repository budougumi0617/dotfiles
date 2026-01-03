return {
  {
    "WilliamHsieh/overlook.nvim",
    opts = {},
    keys = {
      {
        "<leader>pu",
        function()
          require("overlook.api").restore_popup()
        end,
        desc = "Restore last popup",
      },
      {
        "<leader>pU",
        function()
          require("overlook.api").restore_all_popups()
        end,
        desc = "Restore all popups",
      },
      {
        "<leader>pc",
        function()
          require("overlook.api").close_all()
        end,
        desc = "Close all popups",
      },
      {
        "<leader>ps",
        function()
          require("overlook.api").open_in_split()
        end,
        desc = "Open popup in split",
      },
      {
        "<leader>pv",
        function()
          require("overlook.api").open_in_vsplit()
        end,
        desc = "Open popup in vsplit",
      },
      {
        "<leader>pt",
        function()
          require("overlook.api").open_in_tab()
        end,
        desc = "Open popup in tab",
      },
      {
        "<leader>po",
        function()
          require("overlook.api").open_in_original_window()
        end,
        desc = "Open popup in current window",
      },
    },
  },
}
