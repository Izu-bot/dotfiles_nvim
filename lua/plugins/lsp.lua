return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim", opts = {} },
            "stevearc/conform.nvim",
            "b0o/SchemaStore.nvim",
        },
        config = function()
            -- Mason setup
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            -- Mason Tool Installer
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "prettier",
                    "eslint_d",
                },
                auto_update = true,
                run_on_start = true,
            })

            -- LSP Configuration
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Keymaps aplicados quando LSP conecta ao buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                end,
            })

            -- Mason-LSPConfig setup (unificado com handlers)
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {
                    "rust_analyzer",
                    "clangd",
                    "csharp_ls",
                    "bashls",
                },
                handlers = {
                    -- Handler padrão para todos os servidores
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- Configuração específica para rust_analyzer
                    ["rust_analyzer"] = function()
                        lspconfig.rust_analyzer.setup({
                            capabilities = capabilities,
                            settings = {
                                ["rust-analyzer"] = {
                                    checkOnSave = {
                                        command = "clippy",
                                    },
                                },
                            },
                        })
                    end,

                    -- Configuração específica para clangd
                    ["clangd"] = function()
                        lspconfig.clangd.setup({
                            capabilities = capabilities,
                            cmd = {
                                "clangd",
                                "--background-index",
                                "--clang-tidy",
                                "--header-insertion=iwyu",
                            },
                        })
                    end,

                    -- jsonls com SchemaStore
                    ["jsonls"] = function()
                        lspconfig.jsonls.setup({
                            capabilities = capabilities,
                            settings = {
                                json = {
                                    schemas = require("schemastore").json.schemas(),
                                    validate = { enable = true },
                                },
                            },
                        })
                    end,
                },
            })

            -- Diagnósticos visuais
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
}
