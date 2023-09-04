local opt = vim.opt
local g = vim.g

g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
opt.relativenumber = true
opt.linebreak = true
opt.wildmode = 'longest:full'
opt.completeopt = 'menuone,preview,noselect,noinsert'
opt.hlsearch = false
opt.title = true
opt.titleold = "st"

local disabled_built_ins = {
	"2html_plugin",
	"fzf",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"tar",
	"tarPlugin",
	"rrhelper",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end

local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Vertical help
function HelpfulHelp()
	if vim.opt.buftype:get(0) == 'help' then
		local columns = vim.opt.columns:get(0)
		local winwidth = vim.fn.winwidth(0)
		if ( winwidth >= 81 and columns >= 162 ) then
			vim.cmd("wincmd L | vert res 81")
			vim.wo.winfixwidth = true
		end
	end
end

autocmd("BufEnter", { pattern = "*", callback = HelpfulHelp })

-- Highlight on yank
autocmd("TextYankPost", { pattern = "*", command = "silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=200}" })

-- Ensure files are read as what I want
autocmd({"BufRead", "BufNewFile"}, { pattern = {"/tmp/calcurse*", "/.calcurse/notes/*"},  command = "set filetype=markdown" })
autocmd({"BufRead", "BufNewFile"}, { pattern = {"*.ms", "*.me", "*.mom", "*.man"},  command = "set filetype=groff | setlocal spell" })
autocmd({"BufRead", "BufNewFile"}, { pattern = "*.tex",  command = "set filetype=tex | setlocal spell" })
autocmd({"BufRead", "BufNewFile"}, { pattern = "*.norg",  command = "set filetype=norg | setlocal spell" })

-- Automatically deletes all trailing whitespace and blank lines at end of file on save
autocmd("BufWritePre", { pattern = "*",  command = "%s/\\s\\+$//e" })
autocmd("BufWritePre", { pattern = "*",  command = "%s/\\n\\+\\%$//e" })
--, autocmd("BufWritePre" { pattern = "*.[ch]",  command = "%s/\\%$/\\r/e" })

-- Cleans out tex build files whenever I close out of a .tex file (requires external script)
autocmd("VimLeave", { pattern = "*.tex",  command = "!texclear %" })

-- Run xrdb whenever Xdefaults or Xresources are updated
autocmd({"BufRead", "BufNewFile"}, { pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"}, command = "set filetype=xdefaults" })
autocmd("BufWritePost", { pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"}, command = "!xrdb %" })

-- Run make after editing dwmblocks config.h
autocmd("BufWritePost", { pattern = "*dwmblocks/config.h", command = "!cd ~/.local/src/dwmblocks/;sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }" })

-- Update shortcuts when shortcut files are updated (requires external script)
autocmd("BufWritePost", { pattern = {"bm-files", "bm-dirs"}, command = "!shortcuts" })

-- Restart dunst when dunstrc updated
autocmd("BufWritePost", { pattern = "dunstrc", command = "!killall -q dunst;setsid dunst &" })

-- Disables automatic commenting on newline
autocmd("FileType", { pattern = "*",  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })

-- Close help and netrw buffer with q
autocmd("FileType", { pattern = "help", command = "nnoremap <buffer> q ZQ" })
autocmd("FileType", { pattern = "netrw", command = "nnoremap <buffer> q ZQ" })
