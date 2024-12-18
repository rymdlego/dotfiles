return {
  "williamboman/mason.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
  lazy = false,
  -- cmd = "Mason",
  dependencies = {
    -- "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    -- local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason_lspconfig.setup({
    --   -- list of servers for mason to install
    --   ensure_installed = {
    --     "gopls",
    --     "lua_ls",
    --     "pyright",
    --     "terraformls",
    --     "yamlls",
    --   },
    -- })

    mason_tool_installer.setup({
      ensure_installed = {
        "stylua", -- lua formatter
        "yamlfmt", -- yaml formatter
        "isort", -- python formatter
        "black", -- python formatter
        "shfmt", -- shell script formatter
        "prettier", -- generic formatter
        "pylint", -- python linter
        "yamllint", -- yaml linter
        "tflint", -- terraform linter
        "shellcheck", -- shell script linter
      },
    })
  end,
}
