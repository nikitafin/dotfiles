local tree_cfg = require('nvim-treesitter.configs')

tree_cfg.setup{
	auto_install = true,
	ensure_installed = { "c", "cpp", "go", "lua", "rust", "vim", "vimdoc" },
	highlight = { enable = true, }
}

