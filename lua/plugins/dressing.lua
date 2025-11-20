return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("dressing").setup({
			input = {
				backend = { "nui", "builtin" }, -- Fallback to builtin if nui isn't available
				nui = {
					border = {
						style = "rounded",
						text = { top = "[Input]", top_align = "left" },
					},
					relative = "editor",
					position = "50%",
					size = { width = "50%", height = 1 },
				},
			},
			select = {
				backend = { "nui", "builtin" },
				nui = {
					border = {
						style = "rounded",
						text = { top = "[Select]", top_align = "left" },
					},
					relative = "editor",
					position = "50%",
					size = { width = "50%", height = "50%" },
				},
			},
		})
	end,
}
