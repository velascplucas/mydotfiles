return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          go = { "goimports", "gofumpt", "gofmt" },
          python = { "ruff" },
          lua = { "stylua" },
          rust = { "rustfmt" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          svelte = { "prettier" },
          markdown = { "mdformat-wrap" },
          java = {"google-java-format"},
          c = {"astyle"},
        },
        formatters = {
          ["mdformat-wrap"] = {
            command = "mdformat",
            args = {
              "--wrap",
              "80",
              "$FILENAME",
            },
            stdin = false,
          },
        },
        format_after_save = {
          lsp_fallback = false,
          async = true,
          timeout_ms = 1000,
        },
      })
    end,
  },
}
