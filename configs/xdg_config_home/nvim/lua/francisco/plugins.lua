-- local function get_config(name)
--     return string.format('require("francisco.plugins.%s")', name)
-- end

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
      'neovim/nvim-lspconfig',
      config = function()
          require('francisco.plugins.lspconfig')
      end
  }

  use {
      'williamboman/mason.nvim',
      config = function()
          require('francisco.plugins.mason')
      end,
      requires = { 'williamboman/mason-lspconfig.nvim' }
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
          require('francisco.plugins.treesitter')
      end
  }

  use {
      'hrsh7th/nvim-cmp',
      config = function()
          require('francisco.plugins.nvim-cmp-lsp')
      end,
      requires = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip'
      }
  }

  -- Plugins de funcionalidad

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      config = function()
          require('francisco.plugins.telescope')
      end,
      requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
      'nvim-tree/nvim-tree.lua',
      config = function()
          require('francisco.plugins.nvim-tree')
      end,
      requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
      'nvim-lualine/lualine.nvim',
      config = function()
          require('francisco.plugins.lualine')
      end,
      requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      config = function()
          require('francisco.plugins.bufferline-conf')
      end,
      requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
      'echasnovski/mini.nvim',
      config = function()
          require('francisco.plugins.mini-nvim')
      end
  }

  -- Plugins de integracion con Git

  use 'tpope/vim-fugitive'

  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('francisco.plugins.gitsigns')
      end
  }

  -- Plugins extras

  use {
      'folke/todo-comments.nvim',
      config = function()
          require('francisco.plugins.todo-comments')
      end,
      requires = 'nvim-lua/plenary.nvim'
  }

  use {
      'NvChad/nvim-colorizer.lua',
      config = function()
          require('francisco.plugins.colorizer')
      end
  }

  use {
      'goolord/alpha-nvim',
      config = function()
          require('francisco.plugins.alpha')
      end,
      requires = 'nvim-tree/nvim-web-devicons'
  }

  use 'mattn/emmet-vim'

  -- Plugins de temas de colores

  use {
      "ellisonleao/gruvbox.nvim",
      config = function()
          require('francisco.plugins.gruvbox')
      end
  }

  use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
          require('francisco.plugins.catppuccin')
      end
  }

  use {
      'navarasu/onedark.nvim',
      config = function()
          require('francisco.plugins.onedark')
      end
  }

  use {
      'Shatur/neovim-ayu',
      config = function()
          require('francisco.plugins.ayu')
      end
  }

  -- Instala Packer si este no existe
  if packer_bootstrap then
      require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
