require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = false,                    -- false will disable the whole extension
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
    ensure_installed = {
      'python',
      'rust',
      'toml',
      'css',
      'json',
      'javascript',
    --   'typescript',
    --   'yaml',
    --   'lua',
    --   'markdown',
    --   'bash',
    --   'html',
    --   'nix',
    --   'vue',
    }
}
require'nvim-treesitter'.setup()
