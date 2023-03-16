-- Mapping data with "desc" stored directly by vim.keymap.set().
local map = vim.api.nvim_set_keymap -- Defining local variable (shortcut)

function NM(key, command)           -- Sets (normal mode) key - {string}
  map("n", key, command, { noremap = true })
end

function IM(key, command) -- Sets (input mode) key - {string}
  map("i", key, command, { noremap = true })
end

function VM(key, command) -- Sets (visual mode) key - {string}
  map("v", key, command, { noremap = true })
end

function TM(key, command) -- Sets (terminal mode) key - {string}
  map("t", key, command, { noremap = true })
end

NM("<END>", ":ZenMode<CR>") -- ZenMode
NM("<Tab>", ":bnext<cr>")   -- Switch to the next tab on <Tab>
-- NM("<S-Tab>", ":bpev<cr>") -- Switch to the previous tab on <Shift + Tab>
IM("<C-s>", "<ESC>:w<cr>")  -- Save file in input mode
-- NM("<BS>", ":bd!<cr>") -- Close current tab on BackSpace

NM("<S-Tab>", ":bprev<cr>") -- Switch to the previous tab on <Shift + Tab>

-- VM("<S-l>", "<ESC>$")
-- VM("<S-h>", "<ESC>^")

-- Move Lines
NM("<S-j>", "o<ESC>")
-- Move single line or multiple selected lines down with Alt+J
NM("<A-j>", ":m .+1<CR>==")
VM("<A-k>", ":m '<-2<CR>gv")

-- Move single line or multiple selected lines up with Alt+K
NM("<A-k>", ":m .-2<CR>==")
VM("<A-j>", ":m '>+1<CR>gv")

map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
