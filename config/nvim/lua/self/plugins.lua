vim.cmd [[packadd packer.nvim]]

function setup_plugins()
  use {'wbthomason/packer.nvim', opt = true}

  -- Themes
  use 'lifepillar/vim-gruvbox8'
  use 'sainnhe/gruvbox-material'
  use 'romgrk/doom-one.vim'

  -- Visual Additions
  use 'sheerun/vim-polyglot'
  use {'rhysd/git-messenger.vim', opt = true, event = 'VimEnter *'}
  use 'Yggdroot/indentLine'
  use 'danilamihailov/beacon.nvim'
  use 'Xuyuanp/scrollbar.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use {
    'romgrk/barbar.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- Lsp
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use 'nvim-lua/lsp-status.nvim'
  use 'tjdevries/lsp_extensions.nvim'
  use 'neovim/nvim-lspconfig'

  -- Completion
  use {
    'haorenW1020/completion-nvim',
    requires = {
      {'steelsojka/completion-buffers', opt = true},
      {'hrsh7th/vim-vsnip', opt = true},
      {'hrsh7th/vim-vsnip-integ', opt = true},
      'nvim-treesitter/nvim-treesitter',
    }
  }

  -- Navigation
  use 'justinmk/vim-sneak'
  use 'rhysd/clever-f.vim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'

  -- Tmux
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'RyanMillerC/better-vim-tmux-resizer'
  use 'christoomey/vim-tmux-navigator'

  -- Utility
  use {'simnalamburt/vim-mundo', opt = true, cmd = {'MundoToggle'}}
  use 'Iron-E/nvim-libmodal'
  use 'Raimondi/delimitMate'
  use {'mhinz/vim-sayonara', opt = true, cmd = {'Sayonara'}}
  use 'pbrisbin/vim-restore-cursor'
  use 'roxma/vim-paste-easy'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-repeat'
  use 'zsugabubus/crazy8.nvim'
  use {'liuchengxu/vista.vim', opt = true}
  use 'machakann/vim-sandwich'
  use 'voldikss/vim-floaterm'

  use 'direnv/direnv.vim'
  use 'tpope/vim-dotenv'


  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
end


local packer = require('packer')
local gitsigns = require('gitsigns')

require('self.lsp')
require('self.treesitter')
require('self.bufmode')
require('self.gitmode')
require('self.format')
require('self.debugger')

function setup()
  vim.cmd("packadd nvim-treesitter")
  packer.startup(setup_plugins)

  gitsigns.setup()

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = false,
    }
  )
end

return {
  setup = setup
}
