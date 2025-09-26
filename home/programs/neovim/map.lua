vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle Nvim Tree" })

vim.keymap.set("n", "<leader>r", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>tc", "<cmd>ColorizerToggle<CR>", { desc = "Toggle Colorizer" })

vim.keymap.set("n", "<leader>f", function() Snacks.picker.files() end, { noremap = true, silent = true }, { desc = "Snacks picker" })

vim.keymap.set("n", "<leader>tm", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Command palette" })
vim.keymap.set("n", "<leader>fC", "<cmd>Telescope command_history<CR>", { desc = "Command history" })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope builtin<CR>", { desc = "Telescope pickers" })

vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Start compilation" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", { desc = "Clean aux files" })
