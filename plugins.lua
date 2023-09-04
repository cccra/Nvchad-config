local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
    },
    config = function()
      require("custom.configs.neogit")
    end,
  },

  {
    "kylechui/nvim-surround",
    keys = { "ds", "cs", "ys" };
    config = function()
        require("nvim-surround").setup()
    end
  },

	{
    "mbbill/undotree",
		cmd = "UndotreeToggle",
	},

  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/dox/vault/**.md" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      dir = "~/dox/vault",
      mappings = {
        ["gf"] = "gf",
      },
    },
  }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
