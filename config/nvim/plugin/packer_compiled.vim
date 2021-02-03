" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/beacon.nvim"
  },
  ["better-vim-tmux-resizer"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/better-vim-tmux-resizer"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/clever-f.vim"
  },
  ["crazy8.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/crazy8.nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["direnv.vim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/direnv.vim"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/doom-one.vim"
  },
  ["git-messenger.vim"] = {
    loaded = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  indentLine = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  kommentary = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-libmodal"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-libmodal"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-dotenv"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-mundo"] = {
    commands = { "MundoToggle" },
    loaded = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/vim-mundo"
  },
  ["vim-paste-easy"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-paste-easy"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-restore-cursor"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-restore-cursor"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vista.vim"] = {
    loaded = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/vista.vim"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'git-messenger.vim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
