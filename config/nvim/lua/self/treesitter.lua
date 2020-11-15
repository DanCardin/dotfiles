require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,                    -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {                       -- mappings for incremental selection (visual mappings)
      init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
      node_incremental = "m",       -- increment to the upper named parent
      scope_incremental = ".",      -- increment to the upper scope (as defined in locals.scm)
      node_decremental = "n",      -- decrement to the previous node
    }
  },
  refactor = {
    highlight_definitions = {
      enable = true
    },
    highlight_current_scope = {
      enable = false
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr"          -- mapping to rename reference under cursor
      }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",      -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD"      -- mapping to list all definitions in current file
      }
    }
  },
  ensure_installed = {
    'python',
    'rust',
    'toml',
    'css',
    'json',
    'javascript',
    'typescript',
    'yaml',
    'lua',
    'markdown',
    'bash',
    'html',
    'nix',
    'vue',
  }
}
require "nvim-treesitter.parsers".get_parser_configs().markdown = nil
