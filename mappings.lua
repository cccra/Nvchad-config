---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["c"] = { '"_c', "Do not yank when changing", opts = {noremap = true} },
    ["C"] = { '"_C', "Do not yank when changing", opts = {noremap = true} },
    ["<leader>u"] = { "<cmd> UndotreeToggle<cr>", "Toggle Undotree", opts = {noremap = true} },
    ["<leader>d"] = { "<cmd> Nvdash<cr>", "Go to dashboard", opts = {noremap = true} },
    ["<leader>G"] = { "<cmd> Neogit<cr>", "Open Neogit", opts = {noremap = true} },
    ["<leader>P"] = { "<cmd> NvChadUpdate<cr>", "Update NvChad", opts = {noremap = true} },
    ["<leader>nn"] = { "<cmd> e ~/dox/.notes/index.norg<cr>", "Open notes", opts = {noremap = true} },
    ["<leader>k"] = { "<cmd> w! | !compiler '<c-r>%'<CR>", "Compile document", opts = {noremap = true} },
    ["<leader>o"] = { ":!opout <c-r>%<CR><CR>", "Open compiled output", opts = {noremap = true} },
    ["<leader>s"] = { "<cmd> setlocal spell! spelllang=en_gb<CR>", "Toggle spellcheck", opts = {noremap = true} },
    ["S"] = { ":%s//g<Left><Left>", "Replace all", opts = {noremap = true} },
    ["<leader>tr"] = { function() require('base46').toggle_transparency() end, "Toggle transparency", opts = {noremap = true} },
    ["<leader>tt"] = { function() require('base46').toggle_theme() end, "Toggle light/dark", opts = {noremap = true} },
    ["<C-Left>"] = { "<cmd> vertical resize +3<CR>", "Increase vertical size of split", opts = { noremap = true, silent = true } },
    ["<C-Right>"] = { "<cmd> vertical resize -3<CR>", "Decrease vertical size of split", opts = { noremap = true, silent = true } },
    ["<C-Up>"] = { "<cmd> resize +3<CR>", "Increase horizontal size of split", opts = { noremap = true, silent = true } },
    ["<C-Down>"] = { "<cmd> resize -3<CR>", "Decrease horizontal size of split", opts = { noremap = true, silent = true } },
    -- ["<leader><Tab>n"] = { "<cmd> tabnew<CR>", "New tab", opts = {noremap = true} },
    -- ["<leader><Tab>e"] = { "<cmd> tabnew<CR> | lua require('telescope.builtin').find_files({no_ignore = true})<CR>", "Search in new tab", opts = {noremap = true} },
    -- ["<leader><Tab>c"] = { "<cmd> tabclose<Space><CR>", "Close tab", opts = {noremap = true} },
    -- ["<leader><Tab>o"] = { "<cmd> tabonly<CR>", "Close all other tabs"},
 },
  v = {
    ["<"] = { "<gv", "Keep selection when indenting", opts = {noremap = true} },
    [">"] = { ">gv", "Keep selection when indenting", opts = {noremap = true} },
  },
  i = {
    ["<c-l>"] = { "<c-g>u<Esc>[s1z=`]a<c-g>u", "Correct last spelling", opts = {noremap = true} },
  },
  c = {
    ["w!!"] = { "execute \'silent! write !sudo tee % >/dev/null\' <bar> edit!", "Save as sudo", opts = {noremap = true} },
  }
}

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>fc"] = { "<cmd> lua require('telescope.builtin').find_files({prompt_title = 'Vim Config', cwd = vim.fn.stdpath('config'), find_command = {'rg', '--files', '-L', 'lua/custom'}})<CR>", "Find config files", opts = {noremap = true} },
 },
}
-- more keybinds!

return M
