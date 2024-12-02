local maps = require("assistant.mappings")
local runner = require("assistant.runner")
local ui = require("assistant.ui")
local utils = require("assistant.utils")
local M = {}

M.ids = {}
M.augroup = vim.api.nvim_create_augroup("AssistantGroup", { clear = true })
M.cmds = {
  {
    event = "CursorMoved",
    opts = {
      callback = function()
        local number = utils.get_current_line_number()

        if number then
          ui.render_input(number)
          ui.render_output(number)
        end
      end,
    },
  },
  {
    event = "VimResized",
    opts = {
      callback = ui.update_layout,
    },
  },
  {
    event = "WinClosed",
    opts = {
      callback = function(event)
        if vim.tbl_contains({ ui.home.buf, ui.input.buf, ui.output.buf }, event.buf) then
          ui.close()
        end
      end,
    },
  },
  {
    event = "User",
    opts = {
      pattern = "AssistantViewOpen",
      callback = function()
        ui.render_home()

        -- Utility keys
        maps.set("n", "r", runner.run_unique, ui.home.buf)
        maps.set("n", "R", runner.run_all, ui.home.buf)
        maps.set("n", "c", runner.create_test, ui.home.buf)
        maps.set("n", "d", runner.remove_test, ui.home.buf)
        maps.set("n", "i", ui.prompt_hide_and_save_input, ui.home.buf)
        maps.set("n", "e", ui.prompt_hide_and_save_expect, ui.home.buf)

        -- Navigation keys
        maps.set("n", "<c-l>", ui.move_right, ui.home.buf)
        maps.set("n", "<c-j>", ui.move_down, ui.input.buf)
        maps.set("n", "<c-h>", ui.move_left, ui.input.buf)
        maps.set("n", "<c-k>", ui.move_up, ui.output.buf)
        maps.set("n", "<c-h>", ui.move_left, ui.output.buf)
      end,
    },
  },
  {
    event = "BufEnter",
    opts = {
      callback = function(event)
        if not vim.tbl_contains({ ui.home.buf, ui.input.buf, ui.output.buf, ui.prompt.buf }, event.buf) then
          ui.close()
        end
      end,
    },
  },
}

function M.init()
  for _, cmd in ipairs(M.cmds) do
    M.set(cmd.event, cmd.opts)
  end
end

function M.set(event, opts)
  local id = vim.api.nvim_create_autocmd(event, vim.tbl_deep_extend("force", opts, { group = M.augroup }))
  table.insert(M.ids, id)
end

function M.clear_all()
  for _, id in ipairs(M.ids) do
    vim.api.nvim_del_autocmd(id)
  end
end

return M
