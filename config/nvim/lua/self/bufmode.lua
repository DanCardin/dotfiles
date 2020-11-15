local libmodal = require('libmodal')

local _contains = vim.tbl_contains
local _api = vim.api

local bufmode = {}

local _go_to_beginning = {'^', '0'}
local _go_to_end = {'$'}

local _move_left = {'b', 'k', 'h', ',', '<Left>'}
local _move_right = {'e', 'j', 'w', 'l', '.', '<Right>'}

local _close_buffer = {'d', 'q'}
local _new_buffer = {'a'}

function bufmode._callback()
    local uinput = string.char(vim.api.nvim_get_var('bufModeInput'))

    if _contains(_go_to_beginning , uinput) then
        _api.nvim_command('bfirst')
    elseif _contains(_go_to_end , uinput) then
        _api.nvim_command('blast')
    elseif _contains(_move_left, uinput) then
        _api.nvim_command('bprevious')
    elseif _contains(_move_right, uinput) then
        _api.nvim_command('bnext')
    elseif _contains(_close_buffer, uinput) then
        _api.nvim_command('Sayonara!')
    elseif _contains(_new_buffer, uinput) then
        _api.nvim_command('enew')
    end
end

function bufmode.enter()
	libmodal.mode.enter('BUF', bufmode._callback)
end

return bufmode
