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

-- C / C++
vim.lsp.config('clangd', {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose", "--fallback-style=webkit" },
    init_options = {
        fallbackFlags = { "-std=c99" },
    },
    root_markers = { "CMakeLists.txt", ".git" }, -- Native root resolution
})

-- Lua
vim.lsp.config('lua_ls', {
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
vim.lsp.config('nil_ls', {
    on_attach = on_attach,
    settings = {
        ['nil'] = {
            formatting = { command = { "alejandra" } },
        },
    },
})

-- Rust
vim.lsp.config('rust_analyzer', {
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
vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = true },
                pycodestyle = { enabled = true },
            }
        }
    }
})

-- Bash
vim.lsp.config('bashls', {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Finally, enable all the configured servers
local servers = { "clangd", "lua_ls", "nil_ls", "rust_analyzer", "pylsp", "bashls" }
for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end
