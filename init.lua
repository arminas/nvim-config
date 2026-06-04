vim.g.mapleader = " "

vim.opt.number = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

-- Works best if 'completeopt' has "noselect".
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
vim.cmd [[set completeopt+=menuone,noselect,popup]]
