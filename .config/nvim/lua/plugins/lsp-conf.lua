----------------------------------
-- LSP Setup ---------------------
----------------------------------

local lsp_status = require('lsp-status')
lsp_status.register_progress()


metals_config = require'metals'.bare_config()
-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl'}
}
metals_config.init_options.statusBarProvider = "on"
-- Example of how to ovewrite a handler
metals_config.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = {prefix = ''}})
-- Example if you are including snippets
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = lsp_status.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
metals_config.capabilities = capabilities
metals_config.on_attach = lsp_status.on_attach

-- better UI
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        -- Use a sharp border with `FloatBorder` highlights
        border = "single"
    }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        -- Use a sharp border with `FloatBorder` highlights
        border = "single"
    }
)

local signs = { Error = "🔥", Warn = "⚠️ ", Hint = "✨", Info = "ℹ️ " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- virtual text is not too useful
vim.diagnostic.config({ virtual_text = false, signs = true })

require'lspconfig'.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
})
