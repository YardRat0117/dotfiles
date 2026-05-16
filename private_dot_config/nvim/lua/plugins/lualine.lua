--[[
  plugins/lualine.lua – 状态栏 + 标签栏
  对应原 ~/.vimrc.d/airline.vim 全部功能
  布局参考原 airline 效果:
    NORMAL  05-16 Saturday 23:27  filename  ...   filetype  battery
]]

-- 读取电池电量（直接读 /sys 文件，避免 fork 进程）
local function battery_level()
  -- 兼容 BAT0 / BATT / BAT1 等常见路径
  for _, name in ipairs({ "BAT0", "BATT", "BAT1" }) do
    local fd = io.open("/sys/class/power_supply/" .. name .. "/capacity", "r")
    if fd then
      local level = fd:read("*line")
      fd:close()
      return tonumber(level)
    end
  end
  return nil
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        -- 纯文本分隔符，不需要特殊字体
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "█", right = "█" },
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "alpha", "dashboard", "lazy" },
          tabline = { "alpha", "dashboard", "lazy" },
        },
      },
      sections = {
        -- 左: 模式（原 airline section_a）
        lualine_a = { "mode" },
        -- 左: 日期时间（原 airline section_b: %m-%d %A %H:%M）
        -- 注意：fmt 是函数回调，style 才是 datetime 的格式字符串！
        lualine_b = {
          {
            "datetime",
            style = "%m-%d %A %H:%M",
          },
        },
        -- 左: 文件名（原 airline section_c）
        lualine_c = {
          "filename",
          "branch",
          "diff",
        },
        -- 右: 诊断
        lualine_x = { "diagnostics" },
        -- 右: 文件类型 + 进度（原 airline: filetype / battery / separators）
        lualine_y = { "filetype", "progress" },
        -- 右: 电池（原 airline section_z）
        lualine_z = {
          {
            function()
              local level = battery_level()
              if level then
                local icon
                if level >= 80 then icon = "󰁹"
                elseif level >= 60 then icon = "󰁿"
                elseif level >= 40 then icon = "󰁼"
                elseif level >= 20 then icon = "󰁻"
                else icon = "󰁺"
                end
                return icon .. " " .. level .. "%%"  -- %% 在 statusline 中转义为 %
              end
              return ""
            end,
          },
        },
      },
      -- 标签栏（对应 airline tabline + unique_tail）
      tabline = {
        lualine_a = {
          {
            "buffers",
            show_filename_only = true,
            hide_filename_extension = false,
            show_modified_status = true,
            mode = 2,
            max_length = vim.o.columns * 2 / 3,
            use_mode_colors = false,
            -- unique_tail 效果：只显示 目录/文件名
            fmt = function(name)
              local tail = vim.fn.fnamemodify(name, ":t")
              local dir = vim.fn.fnamemodify(name, ":h:t")
              if dir and dir ~= "" and dir ~= "." then
                return dir .. "/" .. tail
              end
              return tail
            end,
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      extensions = { "fugitive" },
    })
  end,
}
