vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").install({
    "C", "lua", "rust",
})
