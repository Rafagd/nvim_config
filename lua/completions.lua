vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim.git" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
    { src = "https://github.com/neovim/nvim-lspconfig.git" },
    { src = "https://github.com/hrsh7th/nvim-cmp.git" },
})

local on_attach = function (client, bufnr)
    
end

local configs = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.expand("$XDG_CONFIG_HOME/nvim/lua"),
                    },
                },
                hint = {
                    enable = true,
                },
            },
        },
        on_attach = on_attach,
    },
    rust_analyzer = {
        on_attach = on_attach
    },
}

local keys = {}
for k, _ in pairs(configs) do
    table.insert(keys, k)
end

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = keys,
})

for k, v in pairs(configs) do
    vim.lsp.config(k, v)
    vim.lsp.enable(k)
end
