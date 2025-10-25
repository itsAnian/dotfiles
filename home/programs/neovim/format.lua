require("conform").setup({
  -- Map filetypes to formatters installed via Nix
  formatters_by_ft = {
    lua = { "stylua" }, -- Make sure stylua is in home.packages if you use this
    nix = { "alejandra" },
    json = { "jq" },
    yaml = { "yamlfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    -- python = { "black" }, -- Add if black is in home.packages
  },

  -- Configure format on save
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true, -- Try LSP formatter if conform fails or isn't configured
  },
})
