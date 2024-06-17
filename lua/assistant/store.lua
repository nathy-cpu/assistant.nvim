local utils = require("assistant.utils")

local M = {}

M.CWD = nil
M.TAB = 1
M.FILETYPE = nil
M.FILENAME_WITHOUT_EXTENSION = nil
M.FILENAME_WITH_EXTENSION = nil

function M.init()
  M.CWD = vim.fn.expand("%:p:h")
  M.TAB = 1
  M.FILETYPE = vim.bo.filetype
  M.FILENAME_WITHOUT_EXTENSION = vim.fn.expand("%:t:r")
  M.FILENAME_WITH_EXTENSION = vim.fn.expand("%:t")

  if M.FILENAME_WITHOUT_EXTENSION ~= "" then
    M.PROBLEM_DATA = utils.fetch(string.format("%s/.ast/%s.json", M.CWD, M.FILENAME_WITHOUT_EXTENSION))
  end
end

return M
