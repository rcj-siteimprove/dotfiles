return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        javascriptreact = { 'prettierd', 'prettier' },
        typescriptreact = { 'prettierd', 'prettier' },
        json = { 'prettierd', 'prettier' },
        jsonc = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        markdown = { 'prettierd', 'prettier' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      notify_on_error = true
    }
  end
}
