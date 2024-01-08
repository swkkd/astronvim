return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    event = "BufWinEnter",
    config = function()
      require('accelerated-jk').setup({
        mode = 'time_driven',
        enable_deceleration = false,
        acceleration_motions = {},
        acceleration_limit = 150,
        acceleration_table = { 7,12,17,21,24,26,28,30 },
        -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
        deceleration_table = { {150, 9999} }
    })
    end,
  },
--   {
--     "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--   require('copilot').setup({
--     panel = {
--     enabled = true,
--     auto_refresh = true,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<F2>"
--     },
--     layout = {
--       position = "right", -- | top | left | right
--       ratio = 0.4
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = true,
--     debounce = 75,
--     keymap = {
--       accept = "<C-k>",
--       accept_word = "<C-l>",
--       -- accept_line = false,
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     yaml = false,
--     markdown = false,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
--   copilot_node_command = 'node', -- Node.js version must be > 18.x
--   server_opts_overrides = {},
-- })
--   end,
--
--   },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- add go server
  { "ray-x/go.nvim", run = ":GoUpdateBinaries" },
  { "andweeb/presence.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { "nvim-lua/plenary.nvim" },
  -- I disabled it because it was causing issues with tabbing on save
  -- {
  --   "Darazaki/indent-o-matic",
  --   disable = true,
  -- },
  -- {
  --   "echasnovski/mini.nvim",
  --   config = function()
  --     require("mini.surround").setup()
  --   end,
  -- },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = false,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      }
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopAnywhere<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "F", ":HopLine<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
    end,
  },
  -- {
  --   "petertriho/nvim-scrollbar",
  --   config = function()
  --     require("scrollbar").setup {
  --       handle = {
  --         color = colors.bg_highlight,
  --       },
  --       marks = {
  --         Search = { color = colors.orange },
  --         Error = { color = colors.error },
  --         Warn = { color = colors.warning },
  --         Info = { color = colors.info },
  --         Hint = { color = colors.hint },
  --         Misc = { color = colors.purple },
  --       },
  --     }
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter-context",
    cond = not vim.g.vscode,
    event = "User Astrofile",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {
      aliases = {
        ["b"] = { ")", "}", "]" },
      },
    },
  },
  {
    "echasnovski/mini.ai",
    event = { "User AstroFile", "InsertEnter" },
    opts = {
      silent = true,
      search_method = "cover_or_nearest",
    },
  },
  {
    "mechatroner/rainbow_csv",
    cond = not vim.g.vscode,
    ft = { "csv", "tsv" },
  },
  {
    "luckasRanarison/nvim-devdocs",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    },
    keys = {
      { "<leader>fd", "<cmd>DevdocsOpenCurrentFloat<CR>", desc = "Find Devdocs for current ft", mode = { "n" } },
      { "<leader>fD", "<cmd>DevdocsOpenFloat<CR>", desc = "Find Devdocs", mode = { "n" } },
    },
    opts = {
      previewer_cmd = vim.fn.executable("glow") == 1 and "glow" or nil,
      cmd_args = { "-s", "dark", "-w", "80" },
      picker_cmd = true,
      picker_cmd_args = { "-s", "dark", "-w", "50" },
      float_win = { -- passed to nvim_open_win(), see :h api-floatwin
        relative = "editor",
        height = 35,
        width = 125,
        border = "rounded",
      },
    },
  },
  {
    "almo7aya/openingh.nvim",
    cond = not vim.g.vscode,
    cmd = { "OpenInGHRepo", "OpenInGHFile", "OpenInGHFileLines" },
    keys = function()
      local prefix = "<leader>g"
      return {
        { prefix .. "o", "<cmd>OpenInGHRepo<CR>", desc = "Open git repo in web", mode = { "n" } },
        { prefix .. "f", "<cmd>OpenInGHFile<CR>", desc = "Open git file in web", mode = { "n" } },
        { prefix .. "f", "<cmd>OpenInGHFileLines<CR>", desc = "Open git lines in web", mode = { "x" } },
      }
    end,
  },
  {
    "michaelb/sniprun",
    cond = not vim.g.vscode,
    -- there is error when using "<CR>" instead of ":" for visual mode mappings
    -- https://discord.com/channels/939594913560031363/1144604661693812771/1146789150981365761
    -- https://www.reddit.com/r/neovim/comments/y2h8ps/i_have_a_mapping_for_normal_how_to_make_an/
    keys = {
      { "<leader>rs", ":SnipRun<CR>", desc = "Run Snippet", mode = { "n", "x" } },
      { "<leader>rC", ":SnipClose<CR>", desc = "Close SnipRun", mode = { "n", "x" } },
    },
    opts = {},
    build = "bash ./install.sh 1",
    cmd = {
      "SnipRun",
      "SnipInfo",
      "SnipReset",
      "SnipReplMemoryClean",
      "SnipClose",
      "SnipLive",
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
    enabled = function()
      if vim.fn.has "win32" == 1 then
        return false
      end
      return true
    end,
    event = "VeryLazy",
    opts = {
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    },
  },


  { "b0o/schemastore.nvim" },
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },
  -- {
  -- "okuuva/auto-save.nvim",
  -- cmd = "ASToggle", -- optional for lazy loading on command
  -- event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  -- opts = {
  --   -- your config goes here
  --   -- or just leave it empty :)
  -- },
  -- },
  {
    "RRethy/vim-illuminate",
    event = "CursorHold",
    config = function()
      require("illuminate").configure {
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        under_cursor = false,
      }
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  {
    "gbprod/cutlass.nvim",
    event = "BufReadPost",
    opts = {
      cut_key = "x",
      override_del = true,
      exclude = {},
      registers = {
        select = "_",
        delete = "_",
        change = "_",
      },
    },
  },
  {
    "smoka7/multicursors.nvim",
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    opts = {
      updatetime = 10,
      hint_config = false,
    },
    dependencies = {
      "smoka7/hydra.nvim",
    },
  },
  -- {
  --   "olimorris/persisted.nvim",
  --   event = "VimEnter",
  --   opts = {
  --     save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
  --     silent = true, -- silent nvim message when sourcing session file
  --     use_git_branch = true, -- create session files based on the branch of the git enabled repository
  --     autosave = true, -- automatically save session files when exiting Neovim
  --     should_autosave = nil, -- function to determine if a session should be autosaved
  --     autoload = true, -- automatically load the session for the cwd on Neovim startup
  --     on_autoload_no_session = nil,
  --     follow_cwd = true,
  --     -- ignored_dirs = {
  --     --   "~/.config",
  --     --   "~/.local/nvim",
  --     -- },
  --     telescope = { -- options for the telescope extension
  --       reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
  --     },
  --     config = function()
  --       vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
  --       -- require("persisted").setup()
  --       require("telescope").load_extension "persisted"
  --     end,
  --   },
  -- },
  {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      local function text_format(symbol)
      local res = {}

      local round_start = { "", "SymbolUsageRounding" }
      local round_end = { "", "SymbolUsageRounding" }

      if symbol.references then
        local usage = symbol.references <= 1 and "usage" or "usages"
        local num = symbol.references == 0 and "no" or symbol.references
        table.insert(res, round_start)
        table.insert(res, { "󰌹 ", "SymbolUsageRef" })
        table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
        table.insert(res, round_end)
      end

      if symbol.definition then
        if #res > 0 then
          table.insert(res, { " ", "NonText" })
        end
        table.insert(res, round_start)
        table.insert(res, { "󰳽 ", "SymbolUsageDef" })
        table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
        table.insert(res, round_end)
      end

      if symbol.implementation then
        if #res > 0 then
          table.insert(res, { " ", "NonText" })
        end
        table.insert(res, round_start)
        table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
        table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
        table.insert(res, round_end)
      end

      return res
    end

    local function h(name) return vim.api.nvim_get_hl(0, { name = name }) end

    -- hl-groups can have any name
    vim.api.nvim_set_hl(0, 'SymbolUsageRounding', { fg = h('CursorLine').bg, italic = true })
    vim.api.nvim_set_hl(0, 'SymbolUsageContent', { bg = h('CursorLine').bg, fg = h('Comment').fg, italic = true })
    vim.api.nvim_set_hl(0, 'SymbolUsageRef', { fg = h('Function').fg, bg = h('CursorLine').bg, italic = true })
    vim.api.nvim_set_hl(0, 'SymbolUsageDef', { fg = h('Type').fg, bg = h('CursorLine').bg, italic = true })
    vim.api.nvim_set_hl(0, 'SymbolUsageImpl', { fg = h('@keyword').fg, bg = h('CursorLine').bg, italic = true })


    require("symbol-usage").setup {
      text_format = text_format,
      vt_position = 'end_of_line',
    }
    end
  }
}
