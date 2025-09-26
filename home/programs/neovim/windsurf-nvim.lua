require("codeium").setup({
  enable_cmp_source = true,
  virtual_text = {
    enabled = true,
    idle_delay = 75,
    key_bindings = {
      accept = "<Tab>",
      next = "<M-]>",
      prev = "<M-[>",
    },
  },
})
