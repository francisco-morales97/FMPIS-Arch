local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    -- Plugins para LSP, autocompletado y sintax-highlight
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }
    use 'nvim-treesitter/nvim-treesitter'

    -- Plugins de funcionalidad

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        }
    }

    use {
        'ThePrimeagen/harpoon',
        requires = 'nvim-lua/plenary.nvim'
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'echasnovski/mini.nvim'

    -- Plugins de integracion con Git

    use 'tpope/vim-fugitive'

    use 'lewis6991/gitsigns.nvim'

    -- Plugins extras

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    use 'NvChad/nvim-colorizer.lua'

    use 'mattn/emmet-vim'

    -- Plugins de temas de colores
    use "ellisonleao/gruvbox.nvim"

    use 'Shatur/neovim-ayu'

    use 'navarasu/onedark.nvim'

    use {
        'rose-pine/nvim',
        as = 'rose-pine'
    }

    -- Instala Packer si este no existe
    if packer_bootstrap then
        require('packer').sync()
    end
end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end
        }
    }})
