return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },
    config = function()
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            pyright = {},
            jsonls = {},
            marksman = {},
            volar = {},
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            ocamllsp = {},
            taplo = {},
            ruff_lsp = {},
        }
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        settings = servers[server_name],
                        on_attach = on_attach,
                    }
                end,
            }
        })
    end
}
