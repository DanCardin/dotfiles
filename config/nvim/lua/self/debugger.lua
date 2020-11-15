local dap = require("dap")

function test_nearest_method()
  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  local query_str = [[
    (class_definition
      name: (identifier) @name) @definition.class

    (function_definition
      name: (identifier) @name) @definition.function
  ]]
  local query = vim.treesitter.parse_query(ft, query_str)
  assert(query, "Could not parse treesitter query. Cannot find test method")
  local parser = vim.treesitter.get_parser(0)
  local tree = parser:parse()
  if not tree then return end

  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local is_class = false
  local classname = nil
  local closest_function = nil
  for id, node in query:iter_captures(tree:root(), 0, 0, row) do
    local name = query.captures[id]
    local type = node:type()
    if name == "definition.class" then
      is_class = true
    end
    local row1, col1, row2, col2 = node:range()
    if row1 == row2 then
      row2 = row2 +1
    end
    local lines = vim.api.nvim_buf_get_lines(0, row1, row2, true)
    local ident = nil
    if type == "identifier" and lines and #lines == 1 then
      ident = (lines[1]):sub(col1 + 1, col2)
    end
    if name == "name" and type == "identifier" then
      if is_class then
        is_class = false
        classname = ident
      else
        closest_function = ident
      end
    end
  end

  local path = "${workspaceFolder}/${file}"
  local fqn = path

  if classname and closest_function then
    fqn = table.concat({path, classname, closest_function}, "::")
  elseif closest_function then
    fqn = table.concat({path, closest_function}, "::")
  end

  return fqn
end

dap.adapters.python = {
  type = "executable";
  command = ".venv/bin/python";
  args = { "-m", "debugpy.adapter" };
}

dap.configurations.python = {
  {
    type = "python";
    request = "launch";
    name = "Run file";
    program = "${workspaceFolder}/${file}";
    console = "internalConsole";
    -- console = "integratedTerminal";
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      return cwd .. "/.venv/bin/python"
    end;
  },
  {
    type = "python";
    request = "launch";
    name = "Run pytest";
    module = "pytest";
    console = "internalConsole";
    -- console = "integratedTerminal";
    args = function()
      return {test_nearest_method()} -- "${workspaceFolder}/${file}", "-x"}
    end;
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      return cwd .. "/.venv/bin/python"
    end;
  },
}

vim.g.dap_virtual_text = true

-- local opts = { noremap=true }
-- vim.api.nvim_set_keymap("n", "<leader>bc", "<Cmd>lua require'dap'.continue()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>bi", "<Cmd>lua require'dap'.step_over()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>bu", "<Cmd>lua require'dap'.step_into()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>bb", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>bt", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
