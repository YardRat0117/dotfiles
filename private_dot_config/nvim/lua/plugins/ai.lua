--[[
  plugins/ai.lua – AI 助手
  对应原 ~/.vimrc.d/llm.vim，继续使用 vim-ai
  或可选 avante.nvim（更现代）
]]

return {
  "madox2/vim-ai",
  cmd = { "AI", "AIChat" },
  init = function()
    -- 沿用原 DeepSeek 配置
    local deepseek_chat_prompt = [[
>>> system
You are a code assistant. Your task is to solve code-related issues accurately, completely, and concisely.

Allowed formatting: inline code (with backticks) and code blocks (with triple backticks). All other Markdown features are strictly forbidden, including: italics, bold, headings, lists, blockquotes, horizontal rules, links, images, tables, and task lists.

Language: Chinese (zh-CN). Do NOT switch languages unless explicitly requested.

Response style: keep answers clear and to the point. Use plain language. Break content into short paragraphs only when it improves readability. Do not add unnecessary sentences.
END
]]
    vim.g.vim_ai_chat = {
      provider = "openai",
      prompt = "",
      options = {
        model = "deepseek-v4-flash",
        endpoint_url = "https://api.deepseek.com/chat/completions",
        max_tokens = 20000,
        request_timeout = 30,
        stream = 1,
        auth_type = "bearer",
        initial_prompt = deepseek_chat_prompt,
        token_file_path = vim.fn.expand("~/.local/share/dpsk/dpsk-vim.token"),
        extra_body = {
          thinking = { type = "enabled" },
          reasoning_effort = "high",
        },
      },
      ui = {
        open_chat_command = "preset_right",
        paste_mode = 1,
      },
    }
  end,
}
