local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local state = require('telescope.actions.state')

local conf = require("telescope.config").values


local command = 'zsh-history-utils decode ' ..  vim.fn.shellescape(vim.fn.expand('~/.zsh_history'))


local get = function ()
  local lines = vim.fn.systemlist(command)
  lines = vim.list_slice(lines, #lines - 1000)

  local result = {}
  for i = #lines, 1, -1 do
    local line = lines[i]
    table.insert(result, vim.fn.json_decode(line))
  end

  return result
end

return function (opts)
  opts = opts or {}

  local result = get()

  pickers.new(opts, {
    prompt_title = 'rg',
    finder = finders.new_table {
      results = result,
      entry_maker = function (entry)
        return {
          value = entry.command,
          display = entry.command,
          ordinal = entry.command,
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local data = state.get_selected_entry().value
        vim.fn.setreg('"', data)
      end)
      return true
    end,
  }):find()
end
