return {
  {
    -- Lazy default, but I like markview.nvim more.
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    opts = function(_, opts)
      return {
        heading = {
          enabled = true,
          sign = false,
          width = "block",
          left_pad = 2,
          right_pad = 4,
        },
        latex = {
          enabled = false,
          render_modes = false,
          converter = "latex2text",
          highlight = "RenderMarkdownMath",
          position = "above",
          top_pad = 0,
          bottom_pad = 0,
        },
      }
    end,
  },
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown", -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    opts = {
      -- Your configuration here (optional)
    },
  },
  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --
  --   -- For blink.cmp's completion
  --   -- source
  --   dependencies = {
  --     "saghen/blink.cmp",
  --   },
  -- },

  {
    "antonk52/markdowny.nvim",
    config = function()
      require("markdowny").setup()
    end,
  },
}
