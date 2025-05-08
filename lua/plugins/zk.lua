return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker", -- Lazyvim default picker

      picker_options = {
        -- I use snacks picker
        snacks_picker = {
          layout = {
            preset = "ivy",
          },
        },
      },
    })
  end,
}
