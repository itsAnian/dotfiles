vim.g.vimtex_view_method = "brave"
vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_compiler_latexmk = {
    build_dir = "build",
    continuous = 1,
    callback = 1,
    executable = "latexmk",
    options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-shell-escape",
    },
}

vim.g.vimtex_syntax_conceal = {
    accents = 1,
    ligatures = 1,
    cites = 1,
    fancy = 1,
    spacing = 1,
    greek = 1,
    math_bounds = 1,
    math_delimiters = 1,
    math_fracs = 1,
    math_super_sub = 1,
    math_symbols = 1,
}

vim.filetype.add({
    extension = {
        tex = "tex",
    },
})
