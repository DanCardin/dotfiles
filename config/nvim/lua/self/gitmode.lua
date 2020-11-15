local libmodal = require('libmodal')

local gitmode = {}

function gitmode._callback()
    local uinput = string.char(vim.api.nvim_get_var('gitModeInput'))

    if vim.tbl_contains({'p'} , uinput) then
        vim.api.nvim_call_function('gitgutter#hunk#prev_hunk', {'1'})
    elseif vim.tbl_contains({'n'}, uinput) then
        vim.api.nvim_call_function('gitgutter#hunk#next_hunk', {'1'})
    elseif vim.tbl_contains({'s'}, uinput) then
        vim.api.nvim_call_function('gitgutter#hunk#stage', {})
    elseif vim.tbl_contains({'u'}, uinput) then
        vim.api.nvim_call_function('gitgutter#hunk#undo', {})
    elseif vim.tbl_contains({'r'}, uinput) then
        vim.api.nvim_call_function('gitgutter#hunk#reset', {''})
	elseif vim.tbl_contains({'h'} , uinput) then
        vim.api.nvim_call_function('gitgutter#hunk#summary', {''})
    end
end

function gitmode.enter()
	libmodal.mode.enter('GIT', gitmode._callback)
end

return gitmode
