local function init(use)
	use({
		"ibhagwan/fzf-lua",
		requires = {
			"vijaymarupudi/nvim-fzf",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			local actions = require("fzf-lua.actions")

			--  Get the git root, falling back to the cwd
			--  Inspired here, https://github.com/ibhagwan/fzf-lua/issues/140
			local function getCwd()
				local path = require("fzf-lua.path").git_root(vim.loop.cwd(), true) or vim.loop.cwd()
				return { cwd = path }
			end

			require("fzf-lua").setup({
				winopts = {
					win_height = 1,
					win_width = 1,
				},
				fzf_layout = "reverse-list",
				files = {
					prompt = "Fd❯ ",
					cmd = "fd",
					git_icons = true, -- show git icons?
					file_icons = true, -- show file icons?
					color_icons = true, -- colorize file|git icons
				},
				grep = {
					prompt = "Rg❯ ",
					actions = {
						["Enter"] = actions.file_edit,
					},
				},
			})

			for _, mode in ipairs({ "n", "v" }) do
				vim.api.nvim_set_keymap(mode, ",m", "<cmd>lua require('fzf-lua').files(" .. getCwd() .. ")<cr>", {
					silent = true,
					noremap = true,
				})

				vim.api.nvim_set_keymap(mode, ",pm", "<cmd>lua require('fzf-lua').files_resume(" .. getCwd() .. ")<cr>", {
					silent = true,
					noremap = true,
				})

				vim.api.nvim_set_keymap(mode, ",g", "<cmd>lua require('fzf-lua').live_grep(" .. getCwd() .. ")<cr>", {
					silent = true,
					noremap = true,
				})

				vim.api.nvim_set_keymap(
					mode,
					",pg",
					"<cmd>lua require('fzf-lua').live_grep_resume(" .. getCwd() .. ")<cr>",
					{
						silent = true,
						noremap = true,
					}
				)

				vim.api.nvim_set_keymap(mode, ",a", "<cmd>lua require('fzf-lua').lsp_code_actions()<cr>", {
					silent = true,
					noremap = true,
				})

				vim.api.nvim_set_keymap(mode, ",a", "<cmd>lua require('fzf-lua').lsp_code_actions()<cr>", {
					silent = true,
					noremap = true,
				})

				vim.api.nvim_set_keymap(mode, ",s", "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>", {
					silent = true,
					noremap = true,
				})

				vim.api.nvim_set_keymap(mode, ",d", "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<cr>", {
					silent = true,
					noremap = true,
				})
			end
		end,
	})
end

return {
	init = init,
}
