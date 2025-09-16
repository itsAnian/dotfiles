local colorizer = require("colorizer")
colorizer.setup({
    filetypes = { "css", "html" },
    user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        css = true,
        css_fn = true,
        mode = "background",
    },
})
