-- core/blink/appearance.lua
return {
  kind_icons = {
    Text = " ",
    Method = "󰆧 ",
    Function = "󰊕 ",
    Constructor = " ",
    Field = "󰜢 ",
    Variable = "󰀫 ",
    Property = " ",
    Class = "󰌗 ",
    Interface = " ",
    Struct = "󰌗 ",
    Module = " ",
    Unit = "󰑭 ",
    Value = "󰎠 ",
    Enum = " ",
    EnumMember = " ",
    Keyword = "󰌋 ",
    Constant = "󰏿 ",
    Snippet = " ",  -- added space for better visual alignment
    Color = "󰏘 ",
    File = "󰈙 ",
    Reference = "󰈇 ",
    Folder = "󰉋 ",
    Event = " ",
    Operator = "󰆕 ",
    TypeParameter = "󰊄 ",
  },

  -- Much nicer & more consistent colors (2025 community favorites)
  highlights = {
    BlinkCmpKindCodeium = { fg = "#8CC85B", bold = true },        -- vibrant Codeium green
    BlinkCmpKindSnippet = { fg = "#FF9D00", bold = true },        -- warm orange (very visible)
    BlinkCmpKindVariable = { fg = "#C9CBFF" },                    -- soft purple (optional polish)
    BlinkCmpKindFunction = { fg = "#82E2E2" },                    -- cyan (optional)
  },

  -- Optional but highly recommended: better menu styling
  completion = {
    menu = {
      border = "rounded",
      scrollbar = true,                 -- looks great with rounded borders
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,         -- slightly faster than 500ms feels snappier
      window = { border = "rounded" },
    },
  },

  -- Apply highlights automatically
  setup = function()
    for group, hl in pairs(require("core.blink.appearance").highlights or {}) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end,
}

-- Auto-run the highlights when the module is loaded
require("core.blink.appearance").setup()
