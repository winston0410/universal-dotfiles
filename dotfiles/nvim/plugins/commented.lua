local function init(paq)
	paq({
		"winston0410/commented.nvim",
		config = function()
			require("commented").setup({
				hooks = {
					before_comment = require("ts_context_commentstring.internal").update_commentstring,
				},
				codetags_keybindings = {
					fixme = "<leader>f",
					fixme_line = "<leader>ff",
					todo = "<leader>t",
					todo_line = "<leader>tt",
					bug = "<leader>b",
					bug_line = "<leader>bb",
					note = "<leader>n",
					note_line = "<leader>nn",
					wont_fix = "<leader>w",
					wont_fix_line = "<leader>ww",
					ref = "<leader>r",
					ref_line = "<leader>rr",
				},
			})
		end,
	})
end

return {
	init = init,
}
