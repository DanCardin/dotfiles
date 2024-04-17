-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/danc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cellular-automaton.nvim"] = {
    config = { "\27LJ\2\nl\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0,<cmd>CellularAutomaton make_it_rain<CR>\16<leader>fml\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "<leader>fml" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvimw\1\0\6\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0003\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\texpr\2\0\n<C-e>\6i\bset\vkeymap\29codeium_disable_bindings\6g\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["crazy8.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/crazy8.nvim",
    url = "https://github.com/zsugabubus/crazy8.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["fold-preview.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17fold-preview\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/fold-preview.nvim",
    url = "https://github.com/anuvyklack/fold-preview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n·\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\4\nnumhl\2\vlinehl\1\23current_line_blame\2\15signcolumn\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\5\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\5\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\5\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\5\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\5\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nû\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0K\0\1\0004indent_blankline_show_trailing_blankline_indent$indent_blankline_use_treesitter-indent_blankline_show_first_indent_level\1\2\0\0\fComment)indent_blankline_char_highlight_list\6g\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\nÅ\2\0\0\4\0\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0024\3\0\0=\3\v\0025\3\f\0=\3\r\0024\3\0\0=\3\14\0024\3\0\0=\3\15\2B\0\2\1K\0\1\0\14overrides\vcolors\25variablebuiltinStyle\1\0\1\vitalic\2\14typeStyle\19statementStyle\1\0\1\tbold\2\17keywordStyle\1\0\1\tbold\2\18functionStyle\17commentStyle\1\0\1\vitalic\2\1\0\4\21specialException\2\14undercurl\2\16transparent\1\18specialReturn\2\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["keymap-amend.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/keymap-amend.nvim",
    url = "https://github.com/anuvyklack/keymap-amend.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireË\1\1\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\1K\0\1\0\18hook_function\0\1\0\3\31multi_line_comment_strings\1\31use_consistent_indentation\2 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-format.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-format\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/tjdevries/lsp_extensions.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n‹\1\0\0\5\0\6\0\0206\0\0\0009\0\1\0009\0\2\0005\2\4\0006\3\0\0009\3\1\0039\3\2\3B\3\1\0029\3\3\3\19\3\3\0=\3\3\0026\3\0\0009\3\1\0039\3\2\3B\3\1\0029\3\5\3\19\3\3\0=\3\5\2B\0\2\1K\0\1\0\18virtual_lines\1\0\0\17virtual_text\vconfig\15diagnostic\bvimp\1\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0B\0\4\1K\0\1\0\0\15<leader>dl\6n\bset\vkeymap\bvim\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n½\4\0\0\6\0\28\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0034\4\3\0005\5\r\0>\5\1\4=\4\14\0034\4\3\0005\5\15\0>\5\1\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\25\0=\4\16\0035\4\26\0=\4\18\0034\4\0\0=\4\20\0034\4\0\0=\4\22\3=\3\27\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bî‚ \14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\25component_separators\1\3\0\0\bî‚±\bî‚³\23section_separators\1\3\0\0\bî‚°\bî‚²\1\0\2\18icons_enabled\2\ntheme\21gruvbox-material\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\nß\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\a\tfind\aSr\badd\aSa\freplace\aSc\14highlight\aSh\vdelete\aSd\14find_left\aSl\19update_n_lines\aSn\1\0\3\fn_lines\3\20\23highlight_duration\3ô\3\20funname_pattern\r[%w_%.]+\nsetup\18mini.surround\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\2\nV\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\nmodes\frequire\15cursorline\bopt\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n‰\2\0\0\a\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0004\3\3\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\4>\4\1\0035\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\5\0045\5\f\0=\5\a\4>\4\2\3=\3\14\0025\3\16\0005\4\15\0=\4\17\3=\3\18\2B\0\2\1K\0\1\0\blsp\rprogress\1\0\0\1\0\1\fenabled\1\vroutes\1\0\0\1\0\1\tskip\2\1\0\0\tkind\1\0\0\1\3\0\0\17search_count\techo\topts\1\0\1\tskip\2\vfilter\1\0\0\1\0\1\tfind\22Pattern not found\nsetup\nnoice\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\næ\1\0\0\3\1\n\2!6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\23€6\0\0\0009\0\1\0009\0\3\0005\2\4\0B\0\2\0029\0\5\0\b\0\1\0X\0\5€-\0\0\0009\0\6\0'\2\a\0D\0\2\0X\0\r€-\0\0\0009\0\6\0'\2\b\0B\0\2\2-\1\0\0009\1\t\1B\1\1\2&\0\1\0L\0\2\0X\0\3€-\0\0\0009\0\t\0D\0\1\0K\0\1\0\0À\17autopairs_cr\n<c-e>\n<c-y>\besc\rselected\1\2\0\0\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31›\2\1\0\a\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3B\1\2\0016\1\n\0009\1\v\0019\1\f\1'\3\r\0'\4\14\0003\5\15\0005\6\16\0B\1\5\0012\0\0€K\0\1\0\1\0\1\texpr\2\0\t<cr>\6i\bset\vkeymap\bvim\14ts_config\vpython\1\2\0\0\vstring\blua\1\0\0\1\2\0\0\vstring\1\0\5\vmap_bs\1\30enable_check_bracket_line\2\rcheck_ts\2\22ignored_next_char\v[%w%.]\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n‡\4\0\0\6\0\25\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\28:BufferLineMoveNext<CR>\22<leader><leader>.\1\0\1\vsilent\2\28:BufferLineMovePrev<CR>\22<leader><leader>,\1\0\1\vsilent\2\29:BufferLineCycleNext<CR>\14<leader>.\1\0\1\vsilent\2\29:BufferLineCyclePrev<CR>\14<leader>,\1\0\1\vsilent\2\24:BufferLinePick<CR>\14<leader>b\6n\bset\vkeymap\bvim\foptions\1\0\0\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\np\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisible¨\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0B\0\1\1X\0\v€6\0\2\0009\0\3\0009\0\4\0)\2ÿÿB\0\2\2\t\0\0\0X\0\4€-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\0À\1À\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2¯\a\1\0\f\0004\0}6\0\0\0'\2\1\0B\0\2\0023\1\2\0009\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0045\5\f\0009\6\t\0009\6\n\0069\6\v\6B\6\1\2=\6\r\0059\6\t\0009\6\n\0069\6\v\6B\6\1\2=\6\14\5=\5\n\0049\5\15\0009\5\16\0059\5\17\0055\a\19\0009\b\15\0009\b\18\b)\nüÿB\b\2\2=\b\20\a9\b\15\0009\b\18\b)\n\4\0B\b\2\2=\b\21\a9\b\15\0009\b\22\bB\b\1\2=\b\23\a9\b\15\0009\b\24\b5\n\25\0B\b\2\2=\b\26\a9\b\15\0003\n\27\0005\v\28\0B\b\3\2=\b\29\a9\b\15\0003\n\30\0005\v\31\0B\b\3\2=\b \aB\5\2\2=\5\15\0049\5\t\0009\5!\0054\a\5\0005\b\"\0>\b\1\a5\b#\0>\b\2\a5\b$\0>\b\3\a5\b%\0>\b\4\a4\b\3\0005\t&\0>\t\1\bB\5\3\2=\5!\4B\2\2\0019\2\3\0009\2'\2'\4(\0005\5+\0009\6\t\0009\6!\0064\b\3\0005\t)\0>\t\1\b4\t\3\0005\n*\0>\n\1\tB\6\3\2=\6!\5B\2\3\0019\2\3\0009\2,\0025\4-\0005\5.\0009\6\15\0009\6\16\0069\6,\6B\6\1\2=\6\15\0054\6\3\0005\a/\0>\a\1\6=\6!\5B\2\3\0019\2\3\0009\2,\2'\0040\0005\0051\0009\6\15\0009\6\16\0069\6,\6B\6\1\2=\6\15\0059\6\t\0009\6!\0064\b\3\0005\t2\0>\t\1\b4\t\3\0005\n3\0>\n\1\tB\6\3\2=\6!\5B\2\3\0012\0\0€K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\rcomplete\n<C-n>\n<C-p>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\nk\0\0\4\1\6\0\t-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\2B\0\2\1K\0\1\0\0À\17virtual_text\1\0\1\fenabled\1\tsign\1\0\0\1\0\1\fenabled\2\21update_lightbulb†\1\1\0\6\0\t\0\r6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0005\4\a\0003\5\6\0=\5\b\4B\1\3\0012\0\0€K\0\1\0\rcallback\1\0\0\0\15CursorHold\24nvim_create_autocmd\bapi\bvim\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rself.lsp\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-lsputils",
    url = "https://github.com/RishabhRD/nvim-lsputils"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n¼\1\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\a\22background_colour\f#1e1e1e\vrender\fminimal\ftimeout\3¸\23\vstages\22fade_in_slide_out\rtop_down\1\14max_width\3<\bfps\3\30\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1À\vtoggle„\3\1\0\b\0\17\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0\18\3\0\0009\1\b\0005\4\t\0005\5\n\0=\5\5\4B\1\3\0023\2\v\0006\3\f\0009\3\r\0039\3\14\3'\5\15\0'\6\16\0\18\a\2\0B\3\4\0012\0\0€K\0\1\0\15<leader>gf\6n\bset\vkeymap\bvim\0\1\0\1\vborder\vcurved\1\0\3\vhidden\2\14direction\nfloat\bcmd\flazygit\bnew\rTerminal\24toggleterm.terminal\15float_opts\1\0\1\vborder\vcurved\1\0\6\17hide_numbers\2\17open_mapping\t<c>t\17persist_size\2\18close_on_exit\2\20shade_terminals\2\20start_in_insert\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nR\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\24:NvimTreeToggle<CR>\n<C-n>\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "<C-n>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treehopper"] = {
    config = { "\27LJ\2\nY\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\1K\0\1\0\nnodes\6m\6v\bset\vkeymap\bvim\ttsht\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¦\5\0\0\6\0 \0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\1\3\0009\1\4\1'\2\6\0=\2\5\0015\1\v\0005\2\b\0005\3\t\0=\3\n\2=\2\4\1=\1\a\0006\1\0\0'\3\f\0B\1\2\0029\1\r\0015\3\15\0005\4\14\0=\4\16\0035\4\17\0005\5\18\0=\5\19\4=\4\20\0035\4\21\0005\5\22\0=\5\23\4=\4\24\0035\4\25\0=\4\26\0035\4\27\0005\5\28\0=\5\19\4=\4\29\0035\4\30\0=\4\31\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\vindent\1\2\0\0\vpython\1\0\1\venable\1\14autopairs\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\3\22scope_incremental\t<CR>\21node_incremental\6n\21node_decremental\6p\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\bvue\1\0\1\venable\2\15playground\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\1\0\1\rfiletype\bpug\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\1\burl1https://github.com/zealot128/tree-sitter-pug\bpug5https://github.com/zealot128/tree-sitter-vue.git\burl\17install_info\bvue\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pounce.nvim"] = {
    config = { "\27LJ\2\n¶\1\0\0\5\0\f\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\t\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\b\0B\0\4\1K\0\1\0\ags\6o\6v\20<cmd>Pounce<cr>\6s\6n\bset\vkeymap\bvim\nsetup\vpounce\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\nÿ\1\0\0\4\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\t\0'\2\n\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\rpatterns\1\n\0\0\rMakefile\17package.json\n.venv\19pyproject.toml\t.git\v_darcs\b.hg\t.bzr\t.svn\22detection_methods\1\0\0\1\3\0\0\fpattern\blsp\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nq\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\1K\0\1\0\19toggle_outline\n<C-s>\6n\bset\vkeymap\bvim\20symbols-outline\frequire\0" },
    keys = { { "", "<C-s>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n½\2\0\0\a\0\18\0\0316\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4B\2\2\0019\2\t\0'\4\6\0B\2\2\0016\2\n\0009\2\v\0029\2\f\2'\4\r\0'\5\14\0009\6\15\1B\2\4\0016\2\n\0009\2\v\0029\2\f\2'\4\r\0'\5\16\0009\6\17\1B\2\4\1K\0\1\0\15treesitter\agt\14git_files\14<leader>o\6n\bset\vkeymap\bvim\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\nsetup\22telescope.builtin\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-lua/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n¹\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\0\1\0\3\17persist_zoom\2\21cycle_navigation\2\31enable_default_keybindings\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\2\nN\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\21:MundoToggle<CR>\t<F6>\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "<F6>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-paste-easy"] = {
    config = { "\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1è\3=\1\2\0K\0\1\0\25paste_char_threshold\6g\bvim\0" },
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-paste-easy",
    url = "https://github.com/roxma/vim-paste-easy"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/danc/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nø\3\0\0\2\0\16\00016\0\0\0009\0\1\0)\1(\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\n\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0005\1\r\0=\1\f\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\3\0\0\14README.md\rMakefile\28nvim_tree_special_files\1\2\0\0\t.git\21nvim_tree_ignore%nvim_tree_highlight_opened_files\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\28nvim_tree_disable_netrw\21nvim_tree_git_hl\25nvim_tree_auto_close\24nvim_tree_auto_open\24nvim_tree_gitignore\20nvim_tree_width\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\nÅ\2\0\0\4\0\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0024\3\0\0=\3\v\0025\3\f\0=\3\r\0024\3\0\0=\3\14\0024\3\0\0=\3\15\2B\0\2\1K\0\1\0\14overrides\vcolors\25variablebuiltinStyle\1\0\1\vitalic\2\14typeStyle\19statementStyle\1\0\1\tbold\2\17keywordStyle\1\0\1\tbold\2\18functionStyle\17commentStyle\1\0\1\vitalic\2\1\0\4\21specialException\2\14undercurl\2\16transparent\1\18specialReturn\2\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n¹\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\0\1\0\3\17persist_zoom\2\21cycle_navigation\2\31enable_default_keybindings\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rself.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireË\1\1\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\1K\0\1\0\18hook_function\0\1\0\3\31multi_line_comment_strings\1\31use_consistent_indentation\2 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¦\5\0\0\6\0 \0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\1\3\0009\1\4\1'\2\6\0=\2\5\0015\1\v\0005\2\b\0005\3\t\0=\3\n\2=\2\4\1=\1\a\0006\1\0\0'\3\f\0B\1\2\0029\1\r\0015\3\15\0005\4\14\0=\4\16\0035\4\17\0005\5\18\0=\5\19\4=\4\20\0035\4\21\0005\5\22\0=\5\23\4=\4\24\0035\4\25\0=\4\26\0035\4\27\0005\5\28\0=\5\19\4=\4\29\0035\4\30\0=\4\31\3B\1\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\vindent\1\2\0\0\vpython\1\0\1\venable\1\14autopairs\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\3\22scope_incremental\t<CR>\21node_incremental\6n\21node_decremental\6p\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\bvue\1\0\1\venable\2\15playground\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\1\0\1\rfiletype\bpug\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\1\burl1https://github.com/zealot128/tree-sitter-pug\bpug5https://github.com/zealot128/tree-sitter-vue.git\burl\17install_info\bvue\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: pounce.nvim
time([[Config for pounce.nvim]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\5\0\f\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\t\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\b\0B\0\4\1K\0\1\0\ags\6o\6v\20<cmd>Pounce<cr>\6s\6n\bset\vkeymap\bvim\nsetup\vpounce\frequire\0", "config", "pounce.nvim")
time([[Config for pounce.nvim]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-format\frequire\0", "config", "lsp-format.nvim")
time([[Config for lsp-format.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\a\22background_colour\f#1e1e1e\vrender\fminimal\ftimeout\3¸\23\vstages\22fade_in_slide_out\rtop_down\1\14max_width\3<\bfps\3\30\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n‹\1\0\0\5\0\6\0\0206\0\0\0009\0\1\0009\0\2\0005\2\4\0006\3\0\0009\3\1\0039\3\2\3B\3\1\0029\3\3\3\19\3\3\0=\3\3\0026\3\0\0009\3\1\0039\3\2\3B\3\1\0029\3\5\3\19\3\3\0=\3\5\2B\0\2\1K\0\1\0\18virtual_lines\1\0\0\17virtual_text\vconfig\15diagnostic\bvimp\1\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0B\0\4\1K\0\1\0\0\15<leader>dl\6n\bset\vkeymap\bvim\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n‡\4\0\0\6\0\25\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\28:BufferLineMoveNext<CR>\22<leader><leader>.\1\0\1\vsilent\2\28:BufferLineMovePrev<CR>\22<leader><leader>,\1\0\1\vsilent\2\29:BufferLineCycleNext<CR>\14<leader>.\1\0\1\vsilent\2\29:BufferLineCyclePrev<CR>\14<leader>,\1\0\1\vsilent\2\24:BufferLinePick<CR>\14<leader>b\6n\bset\vkeymap\bvim\foptions\1\0\0\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvimw\1\0\6\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0003\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\texpr\2\0\n<C-e>\6i\bset\vkeymap\29codeium_disable_bindings\6g\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: fold-preview.nvim
time([[Config for fold-preview.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17fold-preview\frequire\0", "config", "fold-preview.nvim")
time([[Config for fold-preview.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\n$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1À\vtoggle„\3\1\0\b\0\17\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0\18\3\0\0009\1\b\0005\4\t\0005\5\n\0=\5\5\4B\1\3\0023\2\v\0006\3\f\0009\3\r\0039\3\14\3'\5\15\0'\6\16\0\18\a\2\0B\3\4\0012\0\0€K\0\1\0\15<leader>gf\6n\bset\vkeymap\bvim\0\1\0\1\vborder\vcurved\1\0\3\vhidden\2\14direction\nfloat\bcmd\flazygit\bnew\rTerminal\24toggleterm.terminal\15float_opts\1\0\1\vborder\vcurved\1\0\6\17hide_numbers\2\17open_mapping\t<c>t\17persist_size\2\18close_on_exit\2\20shade_terminals\2\20start_in_insert\2\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\np\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_next_item\fvisible¨\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0B\0\1\1X\0\v€6\0\2\0009\0\3\0009\0\4\0)\2ÿÿB\0\2\2\t\0\0\0X\0\4€-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\0À\1À\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2¯\a\1\0\f\0004\0}6\0\0\0'\2\1\0B\0\2\0023\1\2\0009\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0045\5\f\0009\6\t\0009\6\n\0069\6\v\6B\6\1\2=\6\r\0059\6\t\0009\6\n\0069\6\v\6B\6\1\2=\6\14\5=\5\n\0049\5\15\0009\5\16\0059\5\17\0055\a\19\0009\b\15\0009\b\18\b)\nüÿB\b\2\2=\b\20\a9\b\15\0009\b\18\b)\n\4\0B\b\2\2=\b\21\a9\b\15\0009\b\22\bB\b\1\2=\b\23\a9\b\15\0009\b\24\b5\n\25\0B\b\2\2=\b\26\a9\b\15\0003\n\27\0005\v\28\0B\b\3\2=\b\29\a9\b\15\0003\n\30\0005\v\31\0B\b\3\2=\b \aB\5\2\2=\5\15\0049\5\t\0009\5!\0054\a\5\0005\b\"\0>\b\1\a5\b#\0>\b\2\a5\b$\0>\b\3\a5\b%\0>\b\4\a4\b\3\0005\t&\0>\t\1\bB\5\3\2=\5!\4B\2\2\0019\2\3\0009\2'\2'\4(\0005\5+\0009\6\t\0009\6!\0064\b\3\0005\t)\0>\t\1\b4\t\3\0005\n*\0>\n\1\tB\6\3\2=\6!\5B\2\3\0019\2\3\0009\2,\0025\4-\0005\5.\0009\6\15\0009\6\16\0069\6,\6B\6\1\2=\6\15\0054\6\3\0005\a/\0>\a\1\6=\6!\5B\2\3\0019\2\3\0009\2,\2'\0040\0005\0051\0009\6\15\0009\6\16\0069\6,\6B\6\1\2=\6\15\0059\6\t\0009\6!\0064\b\3\0005\t2\0>\t\1\b4\t\3\0005\n3\0>\n\1\tB\6\3\2=\6!\5B\2\3\0012\0\0€K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\rcomplete\n<C-n>\n<C-p>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\næ\1\0\0\3\1\n\2!6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\23€6\0\0\0009\0\1\0009\0\3\0005\2\4\0B\0\2\0029\0\5\0\b\0\1\0X\0\5€-\0\0\0009\0\6\0'\2\a\0D\0\2\0X\0\r€-\0\0\0009\0\6\0'\2\b\0B\0\2\2-\1\0\0009\1\t\1B\1\1\2&\0\1\0L\0\2\0X\0\3€-\0\0\0009\0\t\0D\0\1\0K\0\1\0\0À\17autopairs_cr\n<c-e>\n<c-y>\besc\rselected\1\2\0\0\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31›\2\1\0\a\0\17\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3B\1\2\0016\1\n\0009\1\v\0019\1\f\1'\3\r\0'\4\14\0003\5\15\0005\6\16\0B\1\5\0012\0\0€K\0\1\0\1\0\1\texpr\2\0\t<cr>\6i\bset\vkeymap\bvim\14ts_config\vpython\1\2\0\0\vstring\blua\1\0\0\1\2\0\0\vstring\1\0\5\vmap_bs\1\30enable_check_bracket_line\2\rcheck_ts\2\22ignored_next_char\v[%w%.]\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n½\4\0\0\6\0\28\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0034\4\3\0005\5\r\0>\5\1\4=\4\14\0034\4\3\0005\5\15\0>\5\1\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\f\0034\4\0\0=\4\14\0035\4\25\0=\4\16\0035\4\26\0=\4\18\0034\4\0\0=\4\20\0034\4\0\0=\4\22\3=\3\27\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\16file_status\2\14lualine_b\1\2\1\0\vbranch\ticon\bî‚ \14lualine_a\1\0\0\1\2\1\0\tmode\nupper\2\foptions\1\0\0\25component_separators\1\3\0\0\bî‚±\bî‚³\23section_separators\1\3\0\0\bî‚°\bî‚²\1\0\2\18icons_enabled\2\ntheme\21gruvbox-material\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\4\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\t\0'\2\n\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\rpatterns\1\n\0\0\rMakefile\17package.json\n.venv\19pyproject.toml\t.git\v_darcs\b.hg\t.bzr\t.svn\22detection_methods\1\0\0\1\3\0\0\fpattern\blsp\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-treehopper
time([[Config for nvim-treehopper]], true)
try_loadstring("\27LJ\2\nY\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\1K\0\1\0\nnodes\6m\6v\bset\vkeymap\bvim\ttsht\frequire\0", "config", "nvim-treehopper")
time([[Config for nvim-treehopper]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n·\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\4\nnumhl\2\vlinehl\1\23current_line_blame\2\15signcolumn\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\5\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\5\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\ttext\5\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\5\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\5\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\nß\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\a\tfind\aSr\badd\aSa\freplace\aSc\14highlight\aSh\vdelete\aSd\14find_left\aSl\19update_n_lines\aSn\1\0\3\fn_lines\3\20\23highlight_duration\3ô\3\20funname_pattern\r[%w_%.]+\nsetup\18mini.surround\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: vim-paste-easy
time([[Config for vim-paste-easy]], true)
try_loadstring("\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1è\3=\1\2\0K\0\1\0\25paste_char_threshold\6g\bvim\0", "config", "vim-paste-easy")
time([[Config for vim-paste-easy]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nû\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0K\0\1\0004indent_blankline_show_trailing_blankline_indent$indent_blankline_use_treesitter-indent_blankline_show_first_indent_level\1\2\0\0\fComment)indent_blankline_char_highlight_list\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: modes.nvim
time([[Config for modes.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\nmodes\frequire\15cursorline\bopt\bvim\0", "config", "modes.nvim")
time([[Config for modes.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n½\2\0\0\a\0\18\0\0316\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4B\2\2\0019\2\t\0'\4\6\0B\2\2\0016\2\n\0009\2\v\0029\2\f\2'\4\r\0'\5\14\0009\6\15\1B\2\4\0016\2\n\0009\2\v\0029\2\f\2'\4\r\0'\5\16\0009\6\17\1B\2\4\1K\0\1\0\15treesitter\agt\14git_files\14<leader>o\6n\bset\vkeymap\bvim\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\25override_file_sorter\2\28override_generic_sorter\1\nsetup\22telescope.builtin\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\nk\0\0\4\1\6\0\t-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\2B\0\2\1K\0\1\0\0À\17virtual_text\1\0\1\fenabled\1\tsign\1\0\0\1\0\1\fenabled\2\21update_lightbulb†\1\1\0\6\0\t\0\r6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0005\4\a\0003\5\6\0=\5\b\4B\1\3\0012\0\0€K\0\1\0\rcallback\1\0\0\0\15CursorHold\24nvim_create_autocmd\bapi\bvim\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'CodeActionMenu', function(cmdargs)
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-code-action-menu'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CodeActionMenu ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <C-s> <cmd>lua require("packer.load")({'symbols-outline.nvim'}, { keys = "<lt>C-s>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-n> <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F6> <cmd>lua require("packer.load")({'vim-mundo'}, { keys = "<lt>F6>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>fml <cmd>lua require("packer.load")({'cellular-automaton.nvim'}, { keys = "<lt>leader>fml", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
