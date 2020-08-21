local lsp_status = require('lsp-status')
local treesitter = require'nvim-treesitter'
local api = vim.api
local icons = require 'devicon'
local M = {}

-- Different colors for mode
local purple = '#bd93f9'
local blue = '#8be9fd'
local yellow = '#f1fa8c'
local green = '#50fa7b'
local red = '#ff5555'

-- fg and bg
local white_fg = '#e6e6e6'
local black_fg = '#282c34'
local bg = '#4d4d4d'

-- Separators
local left_separator = ''
local right_separator = ''

-- Blank Between Components
local blank = ' '

------------------------------------------------------------------------
--                             StatusLine                             --
------------------------------------------------------------------------

-- Mode Prompt Table
local current_mode = setmetatable({
      ['n'] = 'NORMAL',
      ['no'] = 'N·Operator Pending',
      ['v'] = 'VISUAL',
      ['V'] = 'V·Line',
      ['^V'] = 'V·Block',
      ['s'] = 'Select',
      ['S'] = 'S·Line',
      ['^S'] = 'S·Block',
      ['i'] = 'INSERT',
      ['ic'] = 'INSERT',
      ['ix'] = 'INSERT',
      ['R'] = 'Replace',
      ['Rv'] = 'V·Replace',
      ['c'] = 'COMMAND',
      ['cv'] = 'Vim Ex',
      ['ce'] = 'Ex',
      ['r'] = 'Prompt',
      ['rm'] = 'More',
      ['r?'] = 'Confirm',
      ['!'] = 'Shell',
      ['t'] = 'TERMINAL'
    }, {
      -- fix weird issues
      __index = function(_, _)
        return 'V·Block'
      end
    }
)

-- Filename Color
local file_bg = purple
local file_fg = black_fg
local file_gui = 'bold'
api.nvim_command('hi File guibg='..file_bg..' guifg='..file_fg..' gui='..file_gui)
api.nvim_command('hi FileSeparator guifg='..file_bg)

-- Working directory Color
local dir_bg = bg
local dir_fg = white_fg
local dir_gui = 'bold'
api.nvim_command('hi Directory guibg='..dir_bg..' guifg='..dir_fg..' gui='..dir_gui)
api.nvim_command('hi DirSeparator guifg='..dir_bg)

-- FileType Color
local filetype_bg = 'None'
local filetype_fg = blue
local filetype_gui = 'bold'
api.nvim_command('hi Filetype guibg='..filetype_bg..' guifg='..filetype_fg..' gui='..filetype_gui)

-- row and column Color
local line_bg = 'None'
local line_fg = white_fg
local line_gui = 'bold'
api.nvim_command('hi Line guibg='..line_bg..' guifg='..line_fg..' gui='..line_gui)

-- Redraw different colors for different mode
local RedrawColors = function(mode)
  if mode == 'n' then
    api.nvim_command('hi Mode guibg='..green..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi ModeSeparator guifg='..green)
    api.nvim_command('hi TabLineSel guibg='..green..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi TabLineSelSeparator guifg='..green)
  end
  if mode == 'i' then
    api.nvim_command('hi Mode guibg='..blue..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi ModeSeparator guifg='..blue)
    api.nvim_command('hi TabLineSel guibg='..blue..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi TabLineSelSeparator guifg='..blue)
  end
  if mode == 'v' or mode == 'V' or mode == '^V' then
    api.nvim_command('hi Mode guibg='..purple..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi ModeSeparator guifg='..purple)
    api.nvim_command('hi TabLineSel guibg='..purple..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi TabLineSelSeparator guifg='..purple)
  end
  if mode == 'c' then
    api.nvim_command('hi Mode guibg='..yellow..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi ModeSeparator guifg='..yellow)
    api.nvim_command('hi TabLineSel guibg='..yellow..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi TabLineSelSeparator guifg='..yellow)
  end
  if mode == 't' then
    api.nvim_command('hi Mode guibg='..red..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi ModeSeparator guifg='..red)
    api.nvim_command('hi TabLineSel guibg='..red..' guifg='..black_fg..' gui=bold')
    api.nvim_command('hi TabLineSelSeparator guifg='..red)
  end
end

local TrimmedDirectory = function(dir)
  local home = os.getenv("HOME")
  local _, index = string.find(dir, home, 1)
  if index ~= nil and index ~= string.len(dir) then
    -- TODO Trimmed Home Directory
    return string.gsub(dir, home, '~')
  end
  return dir
end

function M.activeLine()
  local statusline = ""

  -- Component: Mode
  local mode = api.nvim_get_mode()['mode']
  RedrawColors(mode)

  local mode_string = current_mode[mode]
  statusline = statusline.."%#ModeSeparator#"..left_separator.."%#Mode# "..mode_string.." %#ModeSeparator#"..right_separator
  statusline = statusline..blank

  -- Component: Working Directory
  local dir = api.nvim_call_function('getcwd', {})
  local trimmed_dir = TrimmedDirectory(dir)
  statusline = statusline.."%#DirSeparator#"..left_separator.."%#Directory# "..trimmed_dir.." %#DirSeparator#"..right_separator
  statusline = statusline..blank

  -- Alignment to left
  statusline = statusline.."%="

  -- statusline = statusline..(treesitter.statusline(30) or '')
  local middle = lsp_status.status()

  -- Component: row and col
  local line = api.nvim_call_function('line', {"."})
  local col = api.nvim_call_function('col', {"."})
  local row_col = "Ln "..line.." Col "..col.." "

  local width = api.nvim_win_get_width(0)
  local left_len = string.len(mode_string..trimmed_dir) + 2 * 3
  local right_len = string.len(row_col)

  local rhs = "%#Line# "..row_col

  middle = string.sub(middle, 1, width - left_len - right_len)

  return statusline..middle..rhs
end

local InactiveLine_bg = '#1c1c1c'
local InactiveLine_fg = white_fg
api.nvim_command('hi InActive guibg='..InactiveLine_bg..' guifg='..InactiveLine_fg)

function M.inActiveLine()
  local file_name = api.nvim_call_function('expand', {'%F'})
  return "%#InActive# "..file_name
end

------------------------------------------------------------------------
--                              TabLine                               --
------------------------------------------------------------------------

local getTabLabel = function(n)
  local file_name = api.nvim_buf_get_name(n)
  if file_name == '' then
    return ''
  end
  if string.find(file_name, 'term://') ~= nil then
    return ' '..api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
  end
  file_name = api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
  local icon = icons.deviconTable[file_name]
  if icon ~= nil then
    file_name = icon..' '..file_name
  end

  if api.nvim_buf_get_option(n, 'modified') then
    file_name = file_name..'*'
  end
  return file_name
end

api.nvim_command('hi TabLine guibg=#4d4d4d guifg=#c7c7c7 gui=None')
api.nvim_command('hi TabLineSeparator guifg=#4d4d4d')
api.nvim_command('hi TabLineFill guibg=None gui=None')

local shouldShowBuffer = function(n)
  return (
    api.nvim_call_function('buffer_exists', {n}) and
    api.nvim_buf_get_option(n, 'ft') ~= 'qf' and
    api.nvim_buf_get_option(n, 'buflisted')
  )
end

function wrap( t, l )
    for i = 1, l do
        table.insert( t, 1, t[#t] )
        table.remove( t, #t )
    end
end

function M.TabLine()
  local tabline = ''

  local mode = api.nvim_get_mode()['mode']
  RedrawColors(mode)

  local tab_list = api.nvim_call_function('bufnr', {'$'})

  local current_tab = api.nvim_get_current_buf()
  local visible_tabs = {}

  for val=1, tab_list do
    local success, show = pcall(shouldShowBuffer, val)
    if success and show then
      local file_name = getTabLabel(val)
      if file_name ~= '' then
        table.insert(visible_tabs, val, file_name)
        if val == current_tab then
          tabline = tabline.."%#TabLineSelSeparator# "..left_separator
          tabline = tabline.."%#TabLineSel# "..file_name
          tabline = tabline.." %#TabLineSelSeparator#"..right_separator
        else
          tabline = tabline.."%#TabLineSeparator# "..left_separator
          tabline = tabline.."%#TabLine# "..file_name
          tabline = tabline.." %#TabLineSeparator#"..right_separator
        end
      end
    end
  end

  -- for val, file_name in pairs(visible_tabs) do
    -- if val == current_tab then
    --   tabline = tabline.."%#TabLineSelSeparator# "..left_separator
    --   tabline = tabline.."%#TabLineSel# "..file_name
    --   tabline = tabline.." %#TabLineSelSeparator#"..right_separator
    -- else
    --   tabline = tabline.."%#TabLineSeparator# "..left_separator
    --   tabline = tabline.."%#TabLine# "..file_name
    --   tabline = tabline.." %#TabLineSeparator#"..right_separator
    -- end
  -- end
  return tabline
end

return M
