return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.nightfox",                        enabled = true },
  { import = "astrocommunity.colorscheme.kanagawa",                        enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.scrolling.satellite-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.color.modes-nvim" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.editing-support/nvim-regexplainer" },
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  { import = "astrocommunity.editing-support/zen-mode-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.media.drop-nvim" },
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  -- BUG: this plugin causes cursor caret not to move back when moving from shorter lines
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
  -- { import = "astrocommunity.media.pets-nvim" },

  -- Neovim plugin for splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.
  { import = "astrocommunity.editing-support/treej" },

  {
    -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = true,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
    },
  },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- {
  --   -- further customize the options set by the community
  --   "copilot.lua",
  --   opts = {
  --     suggestion = {
  --       keymap = {
  --         accept = "<C-l>",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<C-.>",
  --         prev = "<C-,>",
  --         dismiss = "<C/>",
  --       },
  --     },
  --   },
  -- },
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- {
  --   "m4xshen/smartcolumn.nvim",
  --   opts = {
  --     colorcolumn = 100,
  --     disabled_filetypes = { "help" },
  --   },
  -- },
}
