---@class AssistantWindow
---@field win number?
---@field buf number?
---@field h_ratio number
---@field w_ratio number
---@field h_align "center" | "start" | "end"
---@field v_align "center" | "start" | "end"
---@field config table
---@field buf_opts table?
---@field win_opts table?
---@field enter boolean
---@field access boolean

---@class AssistantWindow.Opts
---@field config table?
---@field h_ratio number
---@field w_ratio number
---@field h_align "center" | "start" | "end"
---@field v_align "center" | "start" | "end"
---@field buf_opts table?
---@field win_opts table?
---@field enter boolean
---@field access boolean

---@class AssistantText
---@field padding number
---@field lines {str:string, hl:string}[][]
