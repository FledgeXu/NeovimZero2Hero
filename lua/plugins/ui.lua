return {
    {
        "akinsho/bufferline.nvim",
        config = true, 
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure()
        end
    },
}
