-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd(":command Singularity :normal i # singularity run docker://registry.c4science.ch/lvg/")
if vim.g.vscode then
  vim.opt.clipboard = ""
end
