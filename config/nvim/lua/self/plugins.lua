vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

local function setup_plugins()
  use {
    "wbthomason/packer.nvim",
    opt = true
  }

  -- Themes
  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_palette = "material"
      vim.g.gruvbox_material_background = "medium"
    end
  }
  use "shaunsingh/nord.nvim"
  use "posva/vim-vue"

  -- Visual Additions
  use "sheerun/vim-polyglot"
  use {
    "rhysd/git-messenger.vim",
    opt = true,
    event = "VimEnter *",
    config = function()
      vim.g.git_messenger_no_default_mappings = true

      vim.api.nvim_set_keymap("n", "<neader>m", "<Plug>(git-messenger)", {noremap = true})
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    branch = "lua",
    config = function()
      vim.g.indent_blankline_char_highlight_list = {"Comment"}
      vim.g.indent_blankline_show_first_indent_level = false
      vim.g.indent_blankline_use_treesitter = true
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require "gitsigns".setup {
        signcolumn = true,
        numhl = true,
        linehl = false,
        current_line_blame = true
      }
    end
  }
  use "norcalli/nvim-colorizer.lua"
  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb { sign = {enabled = false}, float = { enabled = true} }]]
    end
  }
  use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        diagnostics = "nvim_lsp"
      }
    end
  }

  use {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = function()
      require "lualine".setup {
        options = {
          theme = "gruvbox_material",
          section_separators = {"", ""},
          component_separators = {"", ""},
          icons_enabled = true
        },
        sections = {
          lualine_a = {{"mode", upper = true}},
          lualine_b = {{"branch", icon = ""}},
          lualine_c = {{"filename", file_status = true}},
          lualine_x = {"encoding", "fileformat", "filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"location"},
          lualine_y = {},
          lualine_z = {}
        }
      }
    end
  }

  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  -- Lsp
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga()
    end
  }
  use "RishabhRD/popfix"
  use "RishabhRD/nvim-lsputils"
  use "nvim-lua/lsp-status.nvim"
  use "tjdevries/lsp_extensions.nvim"
  use "neovim/nvim-lspconfig"
  use {
    "ray-x/lsp_signature.nvim"
  }
  -- use {"ahmedkhalf/lsp-rooter.nvim"}

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "nvim-treesitter.configs".setup {
        highlight = {
          -- false will disable the whole extension
          enable = true,
          disable = {"vue"}
        },
        incremental_selection = {
          enable = false,
          keymaps = {
            -- mappings for incremental selection (visual mappings)
            init_selection = "gnn", -- maps in normal mode to init the node/scope selection
            node_incremental = "m", -- increment to the upper named parent
            scope_incremental = ".", -- increment to the upper scope (as defined in locals.scm)
            node_decremental = "n" -- decrement to the previous node
          }
        },
        autopairs = {enable = true},
        -- indent = {enable = true},
        ensure_installed = {
          "python",
          "rust",
          "toml",
          "css",
          "json",
          "javascript",
          "typescript",
          "yaml",
          "lua",
          -- 'markdown',
          "bash",
          "html",
          "nix",
          "vue"
        }
      }
    end
  }

  use {
    "hrsh7th/nvim-compe",
    requires = {
      "hrsh7th/vim-vsnip"
    },
    config = function()
      -- vim.cmd("packadd vim-vsnip")

      require "compe".setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        allow_prefix_unmatch = false,
        source = {
          path = true,
          buffer = true,
          calc = true,
          vsnip = true,
          nvim_lsp = true,
          nvim_lua = true,
          spell = true,
          tags = true,
          snippets_nvim = true
        }
      }
    end
  }

  -- Navigation
  use {
    "kyazdani42/nvim-tree.lua",
    keys = "<C-n>",
    setup = function()
      vim.g.nvim_tree_width = 40
      vim.g.nvim_tree_gitignore = 1
      vim.g.nvim_tree_auto_open = 0
      vim.g.nvim_tree_auto_close = 1
      vim.g.nvim_tree_git_hl = 1
      vim.g.nvim_tree_disable_netrw = 1
      vim.g.nvim_tree_add_trailing = 1
      vim.g.nvim_tree_group_empty = 1
      vim.g.nvim_tree_lsp_diagnostics = 1
      vim.g.nvim_tree_highlight_opened_files = 1
      vim.g.nvim_tree_ignore = {".git"}
      vim.g.nvim_tree_special_files = {"README.md", "Makefile"}
    end,
    config = function()
      vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true})
    end
  }
  use {
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      require("hop").setup {}

      vim.api.nvim_set_keymap("n", "f", ":HopChar1<cr>", {})
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", {})
      vim.api.nvim_set_keymap("n", "gl", ":HopLine<cr>", {})
      vim.api.nvim_set_keymap("n", "g<space>", ":HopWord<cr>", {})
      vim.api.nvim_set_keymap("n", "gp", ":HopPattern<cr>", {})
    end
  }
  use "nvim-lua/popup.nvim"
  use {
    "nvim-lua/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-fzy-native.nvim"
    },
    config = function()
      local telescope = require "telescope"
      telescope.setup {
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
          }
        }
      }
      telescope.load_extension("fzy_native")
      -- telescope.load_extension("dap")

      vim.api.nvim_set_keymap(
        "n",
        "<leader>o",
        "<CMD>lua require('telescope.builtin').git_files{}<CR>",
        {noremap = true}
      )
      vim.api.nvim_set_keymap("n", "gt", "<CMD>lua require('telescope.builtin').treesitter{}<CR>", {noremap = true})
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    keys = {"gq", "gr", "gw", "gW"},
    config = function()
      require("trouble").setup {}

      vim.api.nvim_set_keymap("n", "gr", ":TroubleToggle lsp_references<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "gW", ":TroubleToggle lsp_workspace_diagnostics<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "gw", ":TroubleToggle lsp_document_diagnostics<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "gq", ":TodoTrouble<CR>", {noremap = true})
    end
  }
  use {
    "folke/zen-mode.nvim",
    keys = "gz",
    config = function()
      require("zen-mode").setup {
        window = {
          options = {
            signcolumn = "no",
            number = false
          }
        }
      }

      vim.api.nvim_set_keymap("n", "gz", ":ZenMode<CR>", {noremap = true})
    end
  }

  -- Tmux
  use {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({disable_on_zoom = true})

      vim.api.nvim_set_keymap("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", {noremap = true})
      vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>lua require('Navigator').previous()<CR>", {noremap = true})
    end
  }
  use "RyanMillerC/better-vim-tmux-resizer"

  -- Utility
  use {
    "simnalamburt/vim-mundo",
    opt = true,
    keys = "<F6>",
    config = function()
      vim.api.nvim_set_keymap("n", "<F6>", ":MundoToggle<CR>", {noremap = true})
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup(
        {
          enable_check_bracket_line = true,
          ignored_next_char = "[%w%.]",
          check_ts = true,
          ts_config = {
            lua = {"string"},
            python = {"string"}
          }
        }
      )

      _G.MUtils = {}

      vim.g.completion_confirm_key = ""
      MUtils.completion_confirm = function()
        local npairs = require("nvim-autopairs")
        if vim.fn.pumvisible() ~= -1 then
          if vim.fn.complete_info()["selected"] ~= -2 then
            return vim.fn["compe#confirm"](npairs.esc("<cr>"))
          else
            return npairs.esc("<cr>")
          end
        else
          return npairs.autopairs_cr()
        end
      end

      vim.api.nvim_set_keymap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
    end
  }
  -- use {
  --   "steelsojka/pears.nvim",
  --   config = function()
  --     require "pears".setup(
  --       function(conf)
  --         conf.on_enter(
  --           function(pears_handle)
  --             if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
  --               return vim.fn["compe#confirm"]("<CR>")
  --             else
  --               pears_handle()
  --             end
  --           end
  --         )
  --       end
  --     )
  --   end
  -- }

  use "pbrisbin/vim-restore-cursor"
  use "roxma/vim-paste-easy"
  use {
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").configure_language(
        "default",
        {
          use_consistent_indentation = true,
          prefer_single_line_comments = true
        }
      )
    end
  }
  use "zsugabubus/crazy8.nvim"
  use {
    "simrat39/symbols-outline.nvim",
    keys = "<C-s>",
    config = function()
      vim.api.nvim_set_keymap("n", "<C-s>", ":SymbolsOutline<cr>", {})
    end
  }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      vim.g.surround_mappings_style = "surround"
      require "surround".setup({})
    end
  }
  use {
    "mizlan/iswap.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>s", ":ISwap<cr>", {})
    end
  }

  use "direnv/direnv.vim"
  use "vim-scripts/LargeFile"

  --[[ use {
    "mfussenegger/nvim-dap-python",
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      local dap_python = require("dap-python")
      dap_python.setup("~/.nix-profile/bin/nvim-python3")
      dap_python.test_runner = "pytest"

      vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('dap-python').test_method()<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>tc", ":lua require('dap-python').test_class()<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>ts", ":lua require('dap-python').debug_selection()<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>tb", ":lua require('dap').toggle_breakpoint()<CR>", {})
    end
  }
  use "theHamsta/nvim-dap-virtual-text"
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      require("dapui").setup()
    end
  } ]]
  use {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-b>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
        float_opts = {
          border = "curved"
        }
      }

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit =
        Terminal:new(
        {
          cmd = "lazygit",
          hidden = true,
          direction = "float",
          float_opts = {
            border = "curved"
          }
        }
      )

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end
  }
end

local function setup()
  require "packer".startup(setup_plugins)
  require("self.lsp")
end

return {
  setup = setup
}
