local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
    "latex",
    "bibtex",
    "bash",
    "python",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "texlab",
  },
}

M.telescope = {
  pickers = {
    find_files = {
      find_command = { "fd", "-t", "f", "-uL", "--ignore-file=/home/gus/.telignore" }
    },
  }
}

return M
