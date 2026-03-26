return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require('telescope').setup {
           }
            vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)    
            vim.keymap.set('n', '<leader>en', function()
                local opts = require('telescope.themes').get_ivy({
                    cwd = vim.fn.stdpath('config')
                })
                require('telescope.builtin').find_files(opts) 
        end)
        
         end
   }
}
