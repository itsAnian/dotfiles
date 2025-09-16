local wk = require("which-key")
wk.setup({
    plugins = { spelling = { enabled = false, suggestions = 20 } },
    win = { border = "single", height = { min = 4, max = 15 } },
    layout = { spacing = 6 },
    show_help = true,
    show_keys = true,
})

wk.add({
    { "<leader>l", desc = "Vimtex" },
    { "<leader>f", desc = "Telescope" },
    { "<leader>t", desc = "Toggle" },
    { "<leader>h", desc = "Harpoon" },
    { "<leader>c", desc = "Crates" },
})
