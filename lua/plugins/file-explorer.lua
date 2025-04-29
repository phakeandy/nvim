return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          local api = require("mini.files")
          if vim.bo.filetype == "minifiles" then
            -- 如果已经在一个 mini.files 窗口中，就关闭整个 mini.files
            api.close()
          else
            -- 否则打开当前文件所在目录
            api.open(vim.api.nvim_buf_get_name(0), true)
          end
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
      -- disable default key bindings
      { "<leader>fm", false },
      { "<leader>fM", false },
    },
  },
}
