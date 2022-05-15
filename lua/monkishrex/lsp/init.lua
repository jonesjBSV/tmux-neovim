local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
    return
end

require('monkishrex.lsp.configs')
require('monkishrex.lsp.handlers').setup()
