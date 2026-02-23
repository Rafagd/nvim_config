vim.keymap.set("n", "<leader>pv", function ()
    vim.cmd("Ex")
end)

vim.keymap.set("n", "<leader>e", function ()
    vim.diagnostic.open_float()
end)

vim.keymap.set("n", "<leader>h", function ()
    vim.lsp.buf.hover()
end)
