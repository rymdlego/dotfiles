return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  -- lazy = false,
  -- cond = false,
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "pylint" },
      yaml = { "yamllint" },
      sh = { "shellcheck" },
      terraform = { "tflint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
