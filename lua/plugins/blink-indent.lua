return {
  "saghen/blink.indent",
  version = "*", -- mandatory for prebuilt binary
  dependencies = "saghen/blink.download", -- auto-downloads the native binary

  event = { "BufReadPost", "BufNewFile" }, -- lazy-load on real files only
  opts = {
    -- This is the magic: super-fast, tree-sitter-powered indent guides
    char = "▏",          -- most popular choice (thin vertical line)
    -- char = "│"        -- alternative if you prefer thicker
    -- char = ""         -- disable entirely if you want scope-only

    scope = {
      enabled = true,     -- highlight the current scope (insanely useful)
      char = "▏",         -- same as normal indent or use different one
      underline = true,   -- underlines the entire scope line (2025 favorite)
      priority = 200,     -- higher than normal indent guides
      show_start = true,  -- highlight the opening line of the scope
      show_end = true,    -- highlight the closing line too
    },

    -- Exclude noisy filetypes
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "TelescopePrompt",
      },
    },

    -- Optional: make it even prettier with colors
    highlights = {
      -- Works perfectly with catppuccin, tokyonight, gruvbox, etc.
      ["BlinkIndent"] = { link = "Comment" },            -- normal guides dimmed
      ["BlinkIndentScope"] = { fg = "#89b4fa", bold = true }, -- blue scope (catppuccin)
      -- ["BlinkIndentScope"] = { fg = "#cba6f7", bold = true }, -- mauve alternative
    },
  },

  config = function(_, opts)
    require("blink.indent").setup(opts)

    -- Auto-apply the highlights
    for group, hl in pairs(opts.highlights or {}) do
      vim.api.nvim_set_hl(0, group, hl)
    end

    -- Optional toggle key (highly recommended)
    vim.keymap.set("n", "<leader>ui", function()
      vim.g.blink_indent_enabled = not vim.g.blink_indent_enabled
      if vim.g.blink_indent_enabled == nil then vim.g.blink_indent_enabled = true end
      require("blink.indent").setup(vim.g.blink_indent_enabled and opts or { enabled = false })
      print("blink.indent " .. (vim.g.blink_indent_enabled and "enabled" or "disabled"))
    end, { desc = "Toggle indent guides" })
  end,
}
