require("fidget").setup({})

-- Capabilities for completion
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

-- Common on_attach
local function on_attach(client, bufnr)
    client.server_capabilities.documentHighlightProvider = false
    client.server_capabilities.semanticTokensProvider = nil
end

-- LSP configurations
local lspconfig = require("lspconfig")

-- C / C++
lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose", "--fallback-style=webkit" },
    init_options = {
        fallbackFlags = { "-std=c99" },
    },
    root_dir = require("lspconfig.util").root_pattern("CMakeLists.txt", ".git"),
})

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            },
        },
    },
})

-- Nix
lspconfig.nil_ls.setup({
    autostart = true,
    on_attach = on_attach,
    settings = {
        ['nil'] = {
            formatting = { command = { "alejandra" } },
        },
    },
})

-- Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
            diagnostics = {
                enable = true,
                disabled = {},
                enableExperimental = true,
            },
            inlayHints = {
                enable = true,
            },
        },
    },
})

-- Python
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = cmp_lsp.default_capabilities(),
    settings = {
        python = {
            checkOnType = true,
            diagnostics = true,
            inlayHints = true,
            smartCompletion = true,
        },
    },
})
