local libmodal = require('libmodal')
local dap = require('dap')

local debugmode = {}

function debugmode._callback()
    local uinput = string.char(vim.api.nvim_get_var('debugModeInput'))

    if vim.tbl_contains({'c'} , uinput) then
        dap.repl.open()
        dap.continue()

    elseif vim.tbl_contains({'n'}, uinput) then
        dap.step_over()

    elseif vim.tbl_contains({'u'}, uinput) then
        dap.step_out()

    elseif vim.tbl_contains({'e'}, uinput) then
        dap.step_into()

    elseif vim.tbl_contains({'b'}, uinput) then
        dap.toggle_breakpoint()

	elseif vim.tbl_contains({'p'} , uinput) then
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))

    end
end

function debugmode.enter()
	libmodal.mode.enter('DEBUG', debugmode._callback)
end

return debugmode
