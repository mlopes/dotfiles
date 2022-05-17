local get_status = require("telescope.state").get_status
local utils = require("telescope.utils")
local truncate = require("plenary.strings").truncate


local calc_result_length = function(truncate_len)
  local status = get_status(vim.api.nvim_get_current_buf())
  local len = vim.api.nvim_win_get_width(status.results_win) - status.picker.selection_caret:len() - 2
  return type(truncate_len) == "number" and len - truncate_len or len
end

require('telescope').setup{
  defaults = {
    path_display = function(opts, path)
      local tLength = calc_result_length(nil)
      local fileName = utils.path_tail(path)
      local folder =  truncate(path, tLength, nil, -1)
      return string.format("%s (%s)", fileName, folder)
    end
  },
  pickers = {
    buffers = {
      sort_lastused = true
    }
  }
}
