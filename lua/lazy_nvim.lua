local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local opts = {
    install = {
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "tokyonight-storm" },
    },
}
require("lazy").setup("plugins", opts)
