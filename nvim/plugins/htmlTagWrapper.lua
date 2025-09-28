function WrapWithTag()
    local tagName = vim.fn.input("Enter tag: ")
    if tagName == "" then
        return
    end

    local cursor = vim.fn.getpos(".")
    local vend = vim.fn.getpos("v")

    local firstLine = math.min(cursor[2], vend[2]) - 1
    local lastLine = math.max(cursor[2], vend[2]) - 1
    local startCol = cursor[2] < vend[2] and cursor[3] or vend[3]
    local endCol = cursor[2] > vend[2] and cursor[3] or vend[3]

    if startCol == endCol then
        startCol = math.min(cursor[3], vend[3])
        endCol = math.max(cursor[3], vend[3])
    end

    if vim.fn.mode(1) == "V" then
        startCol = 1
        endCol = #vim.api.nvim_buf_get_lines(0, lastLine, lastLine + 1, false)[1]
    end

    -- or use api.nvim_buf_get_lines
    local lines = vim.api.nvim_buf_get_text(0, firstLine, startCol - 1, lastLine, endCol, {})

    lines[1] = "<" .. tagName .. ">" .. lines[1]
    lines[#lines] = lines[#lines] .. "</" .. tagName .. ">"

    vim.api.nvim_buf_set_text(0, firstLine, startCol - 1, lastLine, endCol - 1, lines)
end
