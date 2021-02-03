local vim = vim

vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

local function setup_plugins()
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
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use 'norcalli/nvim-colorizer.lua'
  -- use 'romgrk/nvim-treesitter-context'
  use 'kosayoda/nvim-lightbulb'
  use 'glepnir/lspsaga.nvim'

  use {
    'romgrk/barbar.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Lsp
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use 'nvim-lua/lsp-status.nvim'
  use 'tjdevries/lsp_extensions.nvim'
  use 'neovim/nvim-lspconfig'

  -- Completion
  -- use {
  --   'nvim-lua/completion-nvim',
  --   requires = {
  --     {'steelsojka/completion-buffers', opt = true},
  --     {'hrsh7th/vim-vsnip', opt = true},
  --     {'hrsh7th/vim-vsnip-integ', opt = true},
  --     -- 'nvim-treesitter/nvim-treesitter',
  --   }
  -- }

  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
    }
  }

  -- Navigation
  use 'justinmk/vim-sneak'
  use 'rhysd/clever-f.vim'
  use 'nvim-lua/popup.nvim'
  use {'nvim-lua/telescope.nvim', requires = {
    'nvim-telescope/telescope-fzy-native.nvim'
  }}

  -- Tmux
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'RyanMillerC/better-vim-tmux-resizer'
  use 'christoomey/vim-tmux-navigator'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'

  -- Utility
  use {'simnalamburt/vim-mundo', opt = true, cmd = {'MundoToggle'}}
  use 'Iron-E/nvim-libmodal'
  use 'Raimondi/delimitMate'
  use {'mhinz/vim-sayonara', opt = true, cmd = {'Sayonara'}}
  use 'pbrisbin/vim-restore-cursor'
  use 'roxma/vim-paste-easy'
  -- use 'tomtom/tcomment_vim'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-repeat'
  use 'zsugabubus/crazy8.nvim'
  use {'liuchengxu/vista.vim', opt = true}
  use 'machakann/vim-sandwich'
  use 'voldikss/vim-floaterm'

  use 'direnv/direnv.vim'
  use 'tpope/vim-dotenv'
end

local function setup_debugger()
  dap_python.setup('/nix/store/iqqhrbkjsdbrhyk0gwri5ng8ksmi78gn-python3-3.8.6-env/bin/python')
  dap_python.test_runner = 'pytest'

  local opts = { noremap=true }
  vim.api.nvim_set_keymap("n", "<leader>bc", "<Cmd>lua require'dap'.continue()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>bi", "<Cmd>lua require'dap'.step_over()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>bu", "<Cmd>lua require'dap'.step_into()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>bb", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>bt", "<Cmd>lua require'dap'.repl.open()<CR>", opts)

  vim.api.nvim_set_keymap("n", "<leader>bt", "<Cmd>lua require'dap-python'.test_method()<CR>", opts)
  vim.api.nvim_set_keymap("v", "<leader>b", "<esc><Cmd>lua require'dap-python'.debug_selection()<CR>", opts)
end

local function setup()
  local packer = require('packer')
  local gitsigns = require('gitsigns')
  -- local dap_python = require('dap-python')
  local telescope = require('telescope')
  local saga = require('lspsaga')
  local kommentary = require('kommentary.config')

  vim.cmd("packadd vim-vsnip")
  packer.startup(setup_plugins)

  gitsigns.setup {
    numhl = true,
  }
  -- setup_debugger()

  local lualine = require('lualine')
  lualine.status()

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = false,
    }
  )

  telescope.setup {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
  telescope.load_extension('fzy_native')

  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
    };
  }

  saga.init_lsp_saga()

  kommentary.configure_language("rust", {
    prefer_single_line_comments = true,
  })

  require('self.lsp')
  -- require('self.treesitter')
  require('self.bufmode')
  require('self.gitmode')
  require('self.format')

  vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({
      sign = { enabled = false },
      float = { enabled = true }
  })]]
end

return {
  setup = setup
}
