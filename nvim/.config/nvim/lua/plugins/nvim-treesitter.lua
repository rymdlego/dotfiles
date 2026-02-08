return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  -- dependencies = {
  --   "windwp/nvim-ts-autotag",
  -- },
  config = function()
    -- import nvim-treesitter plugin
    local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "terraform",
        "hcl",
        "go",
        "dockerfile",
        "gitignore",
        "query",
        "python",
        "gdscript",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-m>",
          node_incremental = "<C-m>",
          scope_incremental = false,
          node_decremental = "<C-p>",
        },
      },
    })
  end,
}
