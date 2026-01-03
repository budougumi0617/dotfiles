return {
  {
    "WilliamHsieh/overlook.nvim",
    opts = {},
    -- overlookで開いたポップアップをウインドで開く
    -- ref: https://zenn.dev/layerx/articles/8c29b0367238b8#overlook.nvim%3A-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%B8%E3%83%A3%E3%83%B3%E3%83%97%E3%82%92%E8%A6%96%E8%A6%9A%E7%9A%84%E3%81%AB%E3%82%82%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%A7%E8%A1%A8%E7%8F%BE
    init = function()
      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = vim.api.nvim_create_augroup("overlook_enter_mapping", { clear = true }),
        pattern = "*",
        callback = function()
          vim.schedule(function()
            if vim.w.is_overlook_popup then
              -- open in orig window on enter
              vim.keymap.set("n", "<CR>", function()
                require("overlook.api").open_in_original_window()
              end, { buffer = true, desc = "Overlook: Open in original window" })

              -- open in vsplit on ctrl+enter
              for _, lhs in ipairs({ "<C-CR>", ";" }) do
                vim.keymap.set("n", lhs, function()
                  require("overlook.api").open_in_vsplit()
                end, { buffer = true, desc = "Overlook: Open in vertical split" })
              end
            end
          end)
        end,
      })
    end,
    keys = {
      {
        "<leader>pp",
        function()
          require("overlook.api").peek_cursor()
        end,
        desc = "Peek Cursor",
      },
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
