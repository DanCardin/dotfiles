local vim = vim
local map = vim.api.nvim_set_keymap

local function setup()
    map('i', '<c-c>', '<esc>', {noremap = true})

    -- Move to beginning/end of line
    map('n', '0', '^', {})
    map('n', 'B', '^', {noremap = true})
    map('n', 'E', '$', {noremap = true})

    -- Stop space from searching
    map('n', '<space>', '<nop>', {noremap = true})

    -- middle-click paste
    map('n', '<s-insert>', '<middlemouse>', {noremap = true})

    -- No Ex mode
    map('n', 'Q', '<nop', {noremap = true})

    -- Half page up/down
    map('n', 'K', '<c-u>', {noremap = true})
    map('n', 'J', '<c-d>', {noremap = true})

    -- Copy to clipboard
    map('n', 'Y', '"+y', {})
    map('v', 'Y', '"+y', {})

    -- Copy/paste to system clipboard
    map('v', '<c-c>', '"*y', {noremap = true})
    map('i', '<c-p>', '<c-o> "*p', {})

    -- Sets // to search for the visually selected text
    map('v', '/', 'y/<C-R>"<CR>', {noremap = true})

    -- Start a command
    map('n', '<leader>;', ':', {noremap = true})

    -- Quick save
    map('n', '<leader>w', ':w!<cr>', {noremap = true})

    -- Splits
    map('n', '<leader>\\h', ':sp<cr>', {noremap = true})
    map('n', '<leader>\\v', ':vs<cr>', {noremap = true})

    -- Force update the current file
    map('n', '<leader>e', ':e!<cr>', {noremap = true})

    -- Write the selected text out to less
    map('v', '<leader>z', ':write !less<cr>', {noremap = true})

    -- Terminal settings
    map('t', ';<esc>', '<C-\\><C-n>', {noremap = true})
    map('t', '<c-h>', '<C-\\><C-n><C-w>h', {noremap = true})
    map('t', '<c-j>', '<C-\\><C-n><C-w>j', {noremap = true})
    map('t', '<c-k>', '<C-\\><C-n><C-w>k', {noremap = true})
    map('t', '<c-l>', '<C-\\><C-n><C-w>l', {noremap = true})

    map('n', '<leader>Q', ':DeleteHiddenBuffers<cr>', {noremap = true})
end


return {
    setup = setup
}
