-- set vim options here (vim.<first_key>.<second_key> = value)
--
--set cmdheight to 1 to show more lines in the command line
-- vim.o.cmdheight = 1
-- vim.opt.cmdheight = 1
return {
  opt = {
    -- set to true or false etc.
    scrolloff = 8,         -- sets vim.opt.scrolloff
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true,         -- sets vim.opt.number
    spell = false,         -- sets vim.opt.spell
    signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
    wrap = false,          -- sets vim.opt.wrap
    colorcolumn = "80",
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    list = true,
    showbreak = "↪ ", title = true, titlestring = "%<%F%=%l/%L - nvim", listchars = { tab = "→ ", eol = "↲",
      nbsp = "␣",
      trail = "•",
      extends = "⟩",
      precedes = "⟨",
    },
    fillchars = {
      eob = " ",
      fold = " ",
      foldopen = "",
      foldsep = "│",
      foldclose = "",
    },
    grepprg = vim.fn.executable("rg") == 1 and "rg --vimgrep" or nil,
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    inlay_hints_enabled = true,
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
