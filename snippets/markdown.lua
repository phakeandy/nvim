local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

-- TODO: 通过 treesitter 判断 markdown 的 math_zone 来开关数学公式
-- 1. treesitter playground
-- 2. https://github.com/evesdropper/luasnip-latex-snippets.nvim VimTex
-- 3. https://github.com/frankroeder/dotfiles/blob/master/nvim/snippets/tex/math.lua treesitter
--
-- local has_treesitter, ts = pcall(require, "vim.treesitter")
--
-- local function get_node_at_cursor()
--   local cursor = vim.api.nvim_win_get_cursor(0)
--   local cursor_range = { cursor[1] - 1, cursor[2] }
--   local buf = vim.api.nvim_get_current_buf()
--   local ok, parser = pcall(ts.get_parser, buf, "latex")
--   if not ok or not parser then
--     return
--   end
--   local root_tree = parser:parse()[1]
--   local root = root_tree and root_tree:root()
--
--   if not root then
--     return
--   end
--
--   return root:named_descendant_for_range(cursor_range[1], cursor_range[2], cursor_range[1], cursor_range[2])
-- end
--
-- local function is_mathzone()
--   local MATH_ENVIRONMENTS = {
--     displaymath = true,
--     equation = true,
--     eqnarray = true,
--     align = true,
--     math = true,
--     array = true,
--   }
--   local MATH_NODES = {
--     displayed_equation = true,
--     inline_formula = true,
--   }
--
--   if has_treesitter then
--     local buf = vim.api.nvim_get_current_buf()
--     local node = get_node_at_cursor()
--     while node do
--       if MATH_NODES[node:type()] then
--         return true
--       elseif node:type() == "math_environment" or node:type() == "generic_environment" then
--         local begin = node:child(0)
--         local names = begin and begin:field("name")
--         if names and names[1] and MATH_ENVIRONMENTS[vim.treesitter.get_node_text(names[1], buf):match("[A-Za-z]+")] then
--           return true
--         end
--       end
--       node = node:parent()
--     end
--     return false
--   end
-- end

return {
  -- Tests
  -- s("hello", t("Hello, Luasnip from custom Lua file!")),
  s(
    { trig = "frac", dscr = "LaTex math fraction" },
    fmta("\\frac{<>}{<>}", { i(1, "numerator"), i(2, "denominator") })
  ),
  s(
    { trig = "mk", name = "$..$", dscr = "inline math" },
    fmta(
      [[
	  $<>$<>
	  ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = "dm", name = "$$...$$", dscr = "display math" },
    fmta(
      [[
      $$
      <>
      $$
      <>
    ]],
      { i(1), i(0) }
    )
  ),
  s({
    trig = "markdownlint",
    name = "Add markdownlint disable and restore headings",
    desc = "Add markdownlint disable and restore headings",
  }, {
    t({
      " ",
      "<!-- markdownlint-disable -->",
      " ",
      "> ",
    }),
    i(1),
    t({
      " ",
      " ",
      "<!-- markdownlint-restore -->",
    }),
  }),
}
