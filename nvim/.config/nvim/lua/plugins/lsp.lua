return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "Hoffs/omnisharp-extended-lsp.nvim",
      lazy = true,
    }
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    require 'lspconfig'.lua_ls.setup { capabilities = capabilities }
    require 'lspconfig'.racket_langserver.setup {}

    local omnisharp_extended = require("omnisharp_extended")

    require("lspconfig").omnisharp.setup({
      cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      handlers = {
        ["textDocument/definition"] = omnisharp_extended.handler,
      },
      enable_import_completion = true,
      organize_imports_on_format = true,
      capabilities = capabilities,
    })
  end,
}
