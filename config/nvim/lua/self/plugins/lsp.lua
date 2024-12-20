return {
  {
    'neovim/nvim-lspconfig',
    config = function(_, opts)
      require('self.lsp').setup()
    end
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    name = "lsp_lines",
    config = function()
      vim.diagnostic.config({ virtual_lines = true })
      require("lsp_lines").setup()
    end,
  },
  {
    "RishabhRD/nvim-lsputils",
    dependencies = { "RishabhRD/popfix" },
  },
  "tjdevries/lsp_extensions.nvim",
  "ray-x/lsp_signature.nvim",
  {
    "aznhe21/actions-preview.nvim",
    cmd = "CodeActionMenu",
  },
  {
    "ahmedkhalf/project.nvim",
    name = "project_nvim",
    event = "BufReadPre",
    opts = {
      detection_methods = { "pattern", "lsp" },
      patterns = {
        "Makefile",
        "package.json",
        ".venv",
        "pyproject.toml",
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
      },
    },
  },
  "lukas-reineke/lsp-format.nvim",
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = require("self.lsp").on_attach,
          settings = {
            ["rust-analyzer"] = {
              -- Enable clippy on save
              checkOnSave = {
                command = "clippy",
                extraArgs = "--target-dir /tmp/rust-analyzer-check",
              },
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              rustfmt = {
                extraArgs = { "+nightly" },
              },
              cargo = {
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
            },
          },
          tools = {
            inlay_hints = {
              auto = false,
            },
          },
        },
      })
    end
  }
}
