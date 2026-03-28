vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.cmd([[
  function! LaunchBraveAppMode(url)
    call jobstart(["brave", "--app=" . a:url])
  endfunction
]])

vim.g.mkdp_browserfunc = "LaunchBraveAppMode"
