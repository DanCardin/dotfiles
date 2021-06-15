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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  LargeFile = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/LargeFile"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n≥\4\0\0\6\0\23\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\20\0'\4\21\0005\5\22\0B\0\5\1K\0\1\0\1\0\1\fnoremap\0021<CMD>lua require('Navigator').previous()<CR>\n<C-p>\1\0\1\fnoremap\2-<CMD>lua require('Navigator').down()<CR>\n<C-j>\1\0\1\fnoremap\2.<CMD>lua require('Navigator').right()<CR>\n<C-l>\1\0\1\fnoremap\2+<CMD>lua require('Navigator').up()<CR>\n<C-k>\1\0\1\fnoremap\2-<CMD>lua require('Navigator').left()<CR>\n<C-h>\6n\20nvim_set_keymap\bapi\bvim\1\0\1\20disable_on_zoom\2\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  ["better-vim-tmux-resizer"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/better-vim-tmux-resizer"
  },
  ["crazy8.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/crazy8.nvim"
  },
  ["direnv.vim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/direnv.vim"
  },
  ["git-messenger.vim"] = {
    config = { "\27LJ\2\n•\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\26<Plug>(git-messenger)\14<neader>m\6n\20nvim_set_keymap\bapi&git_messenger_no_default_mappings\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nl\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nnumhl\2\23current_line_blame\2\vlinehl\1\15signcolumn\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\2\n“\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0K\0\1\0\vmedium gruvbox_material_background\rmaterial\29gruvbox_material_palette#gruvbox_material_enable_italic!gruvbox_material_enable_bold\6g\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  hop = {
    config = { "\27LJ\2\n»\2\0\0\6\0\17\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\15\0'\4\16\0004\5\0\0B\0\5\1K\0\1\0\20:HopPattern<cr>\agp\17:HopWord<cr>\rg<space>\17:HopLine<cr>\agl\18:HopChar2<cr>\6s\18:HopChar1<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/hop"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n˚\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0K\0\1\0004indent_blankline_show_trailing_blankline_indent$indent_blankline_use_treesitter-indent_blankline_show_first_indent_level\1\2\0\0\fComment)indent_blankline_char_highlight_list\6g\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\15:ISwap<cr>\14<leader>s\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/iswap.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nò\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2 prefer_single_line_comments\2\31use_consistent_indentation\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
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
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nΩ\4\0\0\6\0\28\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0034\4\3\0005\5\r\0>\5\1\4=\4\14\0034\4\3\0005\5\15\0>\5\1\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\25\0=\4\16\0035\4\26\0=\4\18\0034\4\0\0=\4\20\0034\4\0\0=\4\22\3=\3\27\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bÓÇ†\14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\23section_separators\1\3\0\0\bÓÇ∞\bÓÇ≤\1\0\2\ntheme\21gruvbox_material\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nord.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÒ\1\0\0\6\0\v\2\0316\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\2\b\1\0\0X\1\19Ä6\1\2\0009\1\3\0019\1\5\1B\1\1\0029\1\6\1\b\1\1\0X\1\bÄ6\1\2\0009\1\3\0019\1\a\0019\3\b\0'\5\t\0B\3\2\0C\1\0\0X\1\6Ä9\1\b\0'\3\t\0D\1\2\0X\1\2Ä9\1\n\0D\1\1\0K\0\1\0\17autopairs_cr\t<cr>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\19nvim-autopairs\frequire˛ˇˇˇ\31¸ˇˇˇ\31ö\3\1\0\6\0\24\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\0016\0\n\0004\1\0\0=\1\v\0006\0\f\0009\0\r\0'\1\15\0=\1\14\0006\0\v\0003\1\17\0=\1\16\0006\0\f\0009\0\18\0009\0\19\0'\2\20\0'\3\21\0'\4\22\0005\5\23\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\20nvim_set_keymap\bapi\0\23completion_confirm\5\27completion_confirm_key\6g\bvim\vMUtils\a_G\14ts_config\vpython\1\2\0\0\vstring\blua\1\0\0\1\2\0\0\vstring\1\0\3\rcheck_ts\2\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nT\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nü\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\t\vbuffer\2\rnvim_lua\2\nvsnip\2\tcalc\2\18snippets_nvim\2\ttags\2\rnvim_lsp\2\nspell\2\tpath\2\1\0\t\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
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
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggleŸ\3\1\0\b\0\20\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0\18\3\0\0009\1\b\0005\4\t\0005\5\n\0=\5\5\4B\1\3\0023\2\v\0007\2\f\0006\2\r\0009\2\14\0029\2\15\2'\4\16\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\fnoremap\2\vsilent\2#<cmd>lua _lazygit_toggle()<CR>\15<leader>df\6n\20nvim_set_keymap\bapi\bvim\20_lazygit_toggle\0\1\0\1\vborder\vcurved\1\0\3\14direction\nfloat\bcmd\flazygit\vhidden\2\bnew\rTerminal\24toggleterm.terminal\15float_opts\1\0\1\vborder\vcurved\1\0\6\17open_mapping\n<c-b>\18close_on_exit\2\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17hide_numbers\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nk\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:NvimTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "", "<C-n>" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nè\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\21ensure_installed\1\14\0\0\vpython\trust\ttoml\bcss\tjson\15javascript\15typescript\tyaml\blua\tbash\thtml\bnix\bvue\14autopairs\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\6m\21node_decremental\6n\19init_selection\bgnn\22scope_incremental\6.\1\0\1\venable\1\14highlight\1\0\0\fdisable\1\2\0\0\bvue\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
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
  ["surround.nvim"] = {
    config = { "\27LJ\2\nh\0\0\3\0\6\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\3\0B\0\2\0029\0\5\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frequire\rsurround\28surround_mappings_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n_\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\24:SymbolsOutline<cr>\n<C-s>\6n\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "", "<C-s>" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n†\3\0\0\a\0\19\0\0306\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\0019\1\b\0'\3\5\0B\1\2\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0'\5\14\0005\6\15\0B\1\5\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\16\0'\5\17\0005\6\18\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2;<CMD>lua require('telescope.builtin').treesitter{}<CR>\agt\1\0\1\fnoremap\2:<CMD>lua require('telescope.builtin').git_files{}<CR>\14<leader>o\6n\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nõ\3\0\0\6\0\19\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\21:TodoTrouble<CR>\agq\1\0\1\fnoremap\0020:TroubleToggle lsp_document_diagnostics<CR>\agw\1\0\1\fnoremap\0021:TroubleToggle lsp_workspace_diagnostics<CR>\agW\1\0\1\fnoremap\2&:TroubleToggle lsp_references<CR>\agr\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0" },
    keys = { { "", "gq" }, { "", "gr" }, { "", "gw" }, { "", "gW" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\2\ng\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\21:MundoToggle<CR>\t<F6>\6n\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "", "<F6>" } },
    loaded = false,
    needs_bufread = false,
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
  ["vim-restore-cursor"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-restore-cursor"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vue"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-vue"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nŒ\1\0\0\6\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\17:ZenMode<CR>\agz\6n\20nvim_set_keymap\bapi\bvim\vwindow\1\0\0\foptions\1\0\0\1\0\2\vnumber\1\15signcolumn\ano\nsetup\rzen-mode\frequire\0" },
    keys = { { "", "gz" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time("Defining packer_plugins", false)
-- Setup for: nvim-tree.lua
time("Setup for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n¯\3\0\0\2\0\16\00016\0\0\0009\0\1\0)\1(\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\3\0\0\14README.md\rMakefile\28nvim_tree_special_files\1\2\0\0\t.git\21nvim_tree_ignore%nvim_tree_highlight_opened_files\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\28nvim_tree_disable_netrw\21nvim_tree_git_hl\25nvim_tree_auto_close\24nvim_tree_auto_open\24nvim_tree_gitignore\20nvim_tree_width\6g\bvim\0", "setup", "nvim-tree.lua")
time("Setup for nvim-tree.lua", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n†\3\0\0\a\0\19\0\0306\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\0019\1\b\0'\3\5\0B\1\2\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0'\5\14\0005\6\15\0B\1\5\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\16\0'\5\17\0005\6\18\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2;<CMD>lua require('telescope.builtin').treesitter{}<CR>\agt\1\0\1\fnoremap\2:<CMD>lua require('telescope.builtin').git_files{}<CR>\14<leader>o\6n\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: lspsaga.nvim
time("Config for lspsaga.nvim", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time("Config for lspsaga.nvim", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\nü\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\t\vbuffer\2\rnvim_lua\2\nvsnip\2\tcalc\2\18snippets_nvim\2\ttags\2\rnvim_lsp\2\nspell\2\tpath\2\1\0\t\25allow_prefix_unmatch\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\n˚\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0K\0\1\0004indent_blankline_show_trailing_blankline_indent$indent_blankline_use_treesitter-indent_blankline_show_first_indent_level\1\2\0\0\fComment)indent_blankline_char_highlight_list\6g\bvim\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: iswap.nvim
time("Config for iswap.nvim", true)
try_loadstring("\27LJ\2\nZ\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\15:ISwap<cr>\14<leader>s\6n\20nvim_set_keymap\bapi\bvim\0", "config", "iswap.nvim")
time("Config for iswap.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\nÒ\1\0\0\6\0\v\2\0316\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\2\b\1\0\0X\1\19Ä6\1\2\0009\1\3\0019\1\5\1B\1\1\0029\1\6\1\b\1\1\0X\1\bÄ6\1\2\0009\1\3\0019\1\a\0019\3\b\0'\5\t\0B\3\2\0C\1\0\0X\1\6Ä9\1\b\0'\3\t\0D\1\2\0X\1\2Ä9\1\n\0D\1\1\0K\0\1\0\17autopairs_cr\t<cr>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\19nvim-autopairs\frequire˛ˇˇˇ\31¸ˇˇˇ\31ö\3\1\0\6\0\24\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\0016\0\n\0004\1\0\0=\1\v\0006\0\f\0009\0\r\0'\1\15\0=\1\14\0006\0\v\0003\1\17\0=\1\16\0006\0\f\0009\0\18\0009\0\19\0'\2\20\0'\3\21\0'\4\22\0005\5\23\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\texpr\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\20nvim_set_keymap\bapi\0\23completion_confirm\5\27completion_confirm_key\6g\bvim\vMUtils\a_G\14ts_config\vpython\1\2\0\0\vstring\blua\1\0\0\1\2\0\0\vstring\1\0\3\rcheck_ts\2\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: nvim-bufferline.lua
time("Config for nvim-bufferline.lua", true)
try_loadstring("\27LJ\2\nT\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time("Config for nvim-bufferline.lua", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\nè\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\21ensure_installed\1\14\0\0\vpython\trust\ttoml\bcss\tjson\15javascript\15typescript\tyaml\blua\tbash\thtml\bnix\bvue\14autopairs\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\6m\21node_decremental\6n\19init_selection\bgnn\22scope_incremental\6.\1\0\1\venable\1\14highlight\1\0\0\fdisable\1\2\0\0\bvue\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: hop
time("Config for hop", true)
try_loadstring("\27LJ\2\n»\2\0\0\6\0\17\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\15\0'\4\16\0004\5\0\0B\0\5\1K\0\1\0\20:HopPattern<cr>\agp\17:HopWord<cr>\rg<space>\17:HopLine<cr>\agl\18:HopChar2<cr>\6s\18:HopChar1<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0", "config", "hop")
time("Config for hop", false)
-- Config for: surround.nvim
time("Config for surround.nvim", true)
try_loadstring("\27LJ\2\nh\0\0\3\0\6\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\3\0B\0\2\0029\0\5\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frequire\rsurround\28surround_mappings_style\6g\bvim\0", "config", "surround.nvim")
time("Config for surround.nvim", false)
-- Config for: nvim-lightbulb
time("Config for nvim-lightbulb", true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-lightbulb")
time("Config for nvim-lightbulb", false)
-- Config for: gruvbox-material
time("Config for gruvbox-material", true)
try_loadstring("\27LJ\2\n“\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0K\0\1\0\vmedium gruvbox_material_background\rmaterial\29gruvbox_material_palette#gruvbox_material_enable_italic!gruvbox_material_enable_bold\6g\bvim\0", "config", "gruvbox-material")
time("Config for gruvbox-material", false)
-- Config for: kommentary
time("Config for kommentary", true)
try_loadstring("\27LJ\2\nò\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2 prefer_single_line_comments\2\31use_consistent_indentation\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time("Config for kommentary", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\nΩ\4\0\0\6\0\28\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0034\4\3\0005\5\r\0>\5\1\4=\4\14\0034\4\3\0005\5\15\0>\5\1\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\25\0=\4\16\0035\4\26\0=\4\18\0034\4\0\0=\4\20\0034\4\0\0=\4\22\3=\3\27\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bÓÇ†\14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\23section_separators\1\3\0\0\bÓÇ∞\bÓÇ≤\1\0\2\ntheme\21gruvbox_material\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\nl\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nnumhl\2\23current_line_blame\2\vlinehl\1\15signcolumn\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: nvim-toggleterm.lua
time("Config for nvim-toggleterm.lua", true)
try_loadstring("\27LJ\2\n$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggleŸ\3\1\0\b\0\20\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0\18\3\0\0009\1\b\0005\4\t\0005\5\n\0=\5\5\4B\1\3\0023\2\v\0007\2\f\0006\2\r\0009\2\14\0029\2\15\2'\4\16\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\fnoremap\2\vsilent\2#<cmd>lua _lazygit_toggle()<CR>\15<leader>df\6n\20nvim_set_keymap\bapi\bvim\20_lazygit_toggle\0\1\0\1\vborder\vcurved\1\0\3\14direction\nfloat\bcmd\flazygit\vhidden\2\bnew\rTerminal\24toggleterm.terminal\15float_opts\1\0\1\vborder\vcurved\1\0\6\17open_mapping\n<c-b>\18close_on_exit\2\17persist_size\2\20start_in_insert\2\20shade_terminals\2\17hide_numbers\2\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time("Config for nvim-toggleterm.lua", false)
-- Config for: Navigator.nvim
time("Config for Navigator.nvim", true)
try_loadstring("\27LJ\2\n≥\4\0\0\6\0\23\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\20\0'\4\21\0005\5\22\0B\0\5\1K\0\1\0\1\0\1\fnoremap\0021<CMD>lua require('Navigator').previous()<CR>\n<C-p>\1\0\1\fnoremap\2-<CMD>lua require('Navigator').down()<CR>\n<C-j>\1\0\1\fnoremap\2.<CMD>lua require('Navigator').right()<CR>\n<C-l>\1\0\1\fnoremap\2+<CMD>lua require('Navigator').up()<CR>\n<C-k>\1\0\1\fnoremap\2-<CMD>lua require('Navigator').left()<CR>\n<C-h>\6n\20nvim_set_keymap\bapi\bvim\1\0\1\20disable_on_zoom\2\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time("Config for Navigator.nvim", false)
-- Keymap lazy-loads
time("Defining lazy-load keymaps", true)
vim.cmd [[noremap <silent> gw <cmd>lua require("packer.load")({'trouble.nvim'}, { keys = "gw", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gW <cmd>lua require("packer.load")({'trouble.nvim'}, { keys = "gW", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-n> <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F6> <cmd>lua require("packer.load")({'vim-mundo'}, { keys = "<lt>F6>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gz <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = "gz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gr <cmd>lua require("packer.load")({'trouble.nvim'}, { keys = "gr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-s> <cmd>lua require("packer.load")({'symbols-outline.nvim'}, { keys = "<lt>C-s>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gq <cmd>lua require("packer.load")({'trouble.nvim'}, { keys = "gq", prefix = "" }, _G.packer_plugins)<cr>]]
time("Defining lazy-load keymaps", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'git-messenger.vim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
