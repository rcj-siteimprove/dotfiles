return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        markdown = { 'prettier' },
      },
      default_format_opts = {
        lsp_format = "fallback"
      },
      format_on_save = function(bufnr)
        local typescript_like_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
        if vim.tbl_contains(typescript_like_filetypes, vim.bo[bufnr].filetype) then
          require("typescript-tools.api").organize_imports(true)
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      notify_on_error = true
    }
  end
}
