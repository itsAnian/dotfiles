require("snacks").setup({
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
            { section = "header" },
            { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
            -- { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
            -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
            -- { section = "startup" },
        },
        preset = {
            header = {
                [[
//////////////////////////////////////////////////////////////////////
//██████╗  █████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗██╗███╗   ███╗ //
//██╔══██╗██╔══██╗████╗  ██║██╔══██╗██╔══██╗██║   ██║██║████╗ ████║ //
//██████╔╝███████║██╔██╗ ██║██║  ██║███████║██║   ██║██║██╔████╔██║ //
//██╔═══╝ ██╔══██║██║╚██╗██║██║  ██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║ //
//██║     ██║  ██║██║ ╚████║██████╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║ //
//╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ //
//////////////////////////////////////////////////////////////////////
                                                                           ]]
            },
        },
    },
    explorer = {
        enabled = false,
    },
    image = {
        enabled = true,
        formats = {
            "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff",
            "heic", "avif", "mp4", "mov", "avi", "mkv", "webm", "pdf",
        },
        force = false,
        doc = {
            enabled = true,
            inline = true,
            float = true,
            max_width = 80,
            max_height = 40,
        },
        convert = {
            notify = true,
            math = {
                font_size = "Large",
                packages = {
                    "amsmath", "amssymb", "amsfonts", "amscd",
                    "mathtools", "physics", "siunitx", "mhchem",
                },
            },
        },
        cache = vim.fn.stdpath("cache") .. "/snacks/image",
        debug = {
            request = false,
            convert = false,
            placement = false,
        },
    },
    indent = { enabled = false },
    input = { enabled = false },
    picker = {
        hidden = true,
        ignored = true,
        sources = {
            explorer = {
                hidden = true,
                ignored = true,
            },
        },
    },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = {
        enabled = false,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
            open = false,
            git_hl = false,
        },
        git = {
            patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50,
    },
    words = { enabled = false },
})
