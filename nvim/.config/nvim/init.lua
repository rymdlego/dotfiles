local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("config")

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    -- version = false, -- always use the latest git commit
  },
  -- install = { colorscheme = { "catppuccin-frappe" } },
  checker = { enabled = true, frequency = 86400, notify = false },
  -- checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
