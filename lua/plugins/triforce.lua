return {
	"gisketch/triforce.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvzone/volt",
	},
	config = function()
		require("triforce").setup({
			-- Optional: Add your configuration here
			keymap = {
				show_profile = "<leader>pc", -- Open profile with <leader>pc
			},
		})
	end,
}
