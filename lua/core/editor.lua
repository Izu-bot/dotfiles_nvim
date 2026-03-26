local api = vim.api
local opt = vim.opt
local g = vim.g


local function set_globals()
    g.mapleader = " "
end

local function set_options()
    local opt = vim.opt

    opt.number = true
    opt.relativenumber = true
    opt.mouse = 'a'
    opt.clipboard = 'unnamedplus'
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.tabstop = 4
    opt.cursorline = true
    opt.incsearch = true
end

local function set_keymaps()
	local map = vim.keymap.set
	local opts = { noremap = true, silent = true }

	-- Salvar
	map('n',  '<leader>s', ':w<CR>', 	opts)
	map('i',  '<leader>s', '<Esc>:w<CR>a',  opts)

	-- Fechar buffer
	map('n', '<leader>w', ':bd<CR>',  opts)	-- Fecha buffer atual
	map('n', '<leader>q', ':q<CR>',   opts)	-- Fecha a janela
	map('n', '<leader>Q', ':qa!<CR>', opts)	-- Força fechar tudo

	-- Salvar e fechar
	map('n', '<leader>x', ':wq<CR>', opts)

	-- Desfazer / refazer
	map('n', '<leader>z', 'u',	opts)
	map('n', '<leader>y', '<C-r>',	opts)

	-- Selecionar tudo
	map('n', '<leader>a', 'ggVG', opts)

	-- Novo arquivo
	map('n', '<leader>n', ':enew<CR>', opts)

    -- Duplicar linha
    map('n', '<leader>d', 'yyp',        opts)
    map('n', '<leader>d', '<Esc>yypa',  opts)

    -- Navegar entre janelas
    map('n', '<leader><Right>', '<C-w>l', opts)
    map('n', '<leader><Left>',  '<C-w>h', opts)
    map('n', '<leader><Up>',    '<C-w>k', opts)
    map('n', '<leader><Down>',  '<C-w>j', opts)

    -- Abrir terminal
    map('n', '<leader>th', ':split  | terminal<CR>', opts) -- Horizontal
    map('n', '<leader>tv', ':vsplit | terminal<CR>', opts) -- Vertical
    map('n', '<leader>tt', ':terminal<CR>',          opts) -- Janela atual

    -- Sair do modo terminal
    map('t', '<Esc>', '<C-\\><C-n>', opts)
end

set_globals()
set_options()
set_keymaps()
