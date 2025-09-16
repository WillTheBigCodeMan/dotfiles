local uv = vim.loop
local colorFile = "/home/Will/.cache/wal/colors"

local function ternary(cond, a, b)
    if cond then
        return a
    else
        return b
    end
end

local function lighten(hsl, amount)
    return {
        h = hsl.h,
        s = hsl.s,
        l = math.max(math.min(hsl.l + amount, 1), 0),
    }
end

local function hue_to_rgb(p, q, t)
    if t < 0 then
        t = t + 1
    end
    if t > 1 then
        t = t - 1
    end
    if t < 1 / 6 then
        return p + (q - p) * 6 * t
    end
    if t < 1 / 2 then
        return q
    end
    if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
    end
    return p
end

local function to_hex(hsl)
    if hsl == "NONE" then
        return "NONE"
    end
    local r, g, b
    if hsl.s == 0 then
        r = hsl.l
        g = hsl.l
        b = hsl.l
    else
        local q = ternary(hsl.l < 0.5, hsl.l * (1 + hsl.s), hsl.l + hsl.s - hsl.l * hsl.s)
        local p = 2 * hsl.l - q
        r = hue_to_rgb(p, q, hsl.h + 1 / 3)
        g = hue_to_rgb(p, q, hsl.h)
        b = hue_to_rgb(p, q, hsl.h - 1 / 3)
    end

    return "#" .. string.format("%.2x", r * 255) .. string.format("%.2x", g * 255) .. string.format("%.2x", b * 255)
end

local function parse_hex(hex)
    local r = tonumber(string.sub(hex, 2, 3), 16) / 255
    local g = tonumber(string.sub(hex, 4, 5), 16) / 255
    local b = tonumber(string.sub(hex, 6, 7), 16) / 255

    local max = math.max(r, g, b)
    local min = math.min(r, g, b)

    local h = (max + min) / 2
    local s = (max + min) / 2
    local l = h

    if max == min then
        h = 0
        s = 0
    else
        local delta = max - min
        if l > 0.5 then
            s = delta / (2 - max - min)
        else
            s = delta / (max + min)
        end

        if max == r then
            h = (g - b) / delta + ternary(g < b, 6, 0)
        elseif max == g then
            h = (b - r) / delta + 2
        else
            h = (r - g) / delta + 4
        end
        h = h / 6
    end

    return {
        h = h,
        s = s,
        l = l,
    }
end

local function writeHighlight(file, color, name, bgcolor, style)
    file:write(
        "\nhighlight "
            .. name
            .. " guifg="
            .. to_hex(color)
            .. " guibg="
            .. to_hex(bgcolor)
            .. " guisp=NONE blend=NONE gui="
            .. style
    )
end

local function process_colors()
    local cols = {}
    local counter = 1
    for line in io.lines(colorFile) do
        cols[counter] = parse_hex(line)
        counter = counter + 1
    end

    local colors = {
        black = cols[1],
        red = cols[2],
        green = cols[3],
        yellow = cols[4],
        blue = cols[5],
        magenta = cols[6],
        cyan = cols[7],
        white = cols[8],
        br_black = cols[9],
        br_red = lighten(cols[2], 0.1),
        br_green = lighten(cols[3], 0.1),
        br_yellow = lighten(cols[4], 0.1),
        br_blue = lighten(cols[5], 0.1),
        br_magenta = lighten(cols[6], 0.1),
        br_cyan = lighten(cols[7], 0.1),
    }

    local schemeFile = io.open("/home/Will/.config/nvim/colors/testScheme.vim", "w+")
    if schemeFile == nil then
        return
    end
    schemeFile:write(
        "set background=dark\nif exists('g:colors_name')\nhi clear\nif exists('syntax_on')\nsyntax reset\nendif\nendif\nlet g:colors_name='lushwal'"
    )

    writeHighlight(schemeFile, colors.white, "Normal", colors.black, "NONE")
    writeHighlight(schemeFile, colors.white, "Bold", colors.black, "bold")
    writeHighlight(schemeFile, colors.black, "Cursor", lighten(colors.white, -0.1), "NONE")
    writeHighlight(schemeFile, colors.br_cyan, "CursorColumn", "NONE", "NONE")
    writeHighlight(schemeFile, "NONE", "CursorLine", lighten(colors.black, 0.1), "NONE")
    writeHighlight(schemeFile, colors.br_red, "CursorLineNr", colors.black, "NONE")
    writeHighlight(schemeFile, colors.br_magenta, "ColorColumn", "NONE", "bold")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "Conceal", colors.black, "NONE")

    writeHighlight(schemeFile, colors.br_red, "Boolean", "NONE", "NONE")
    writeHighlight(schemeFile, colors.green, "Character", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_black, "Comment", "NONE", "italic")
    writeHighlight(schemeFile, colors.blue, "Conditional", "NONE", "italic")
    writeHighlight(schemeFile, colors.red, "Constant", "NONE", "italic")
    writeHighlight(schemeFile, colors.red, "Debug", "NONE", "NONE")
    writeHighlight(schemeFile, colors.white, "Define", "NONE", "NONE")
    writeHighlight(schemeFile, colors.cyan, "Delimiter", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_red, "DiagnosticError", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_blue, "DiagnosticHint", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_yellow, "DiagnosticWarn", "NONE", "NONE")
    writeHighlight(schemeFile, colors.cyan, "DiagnosticUnderlineInfo", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_red, "DiagnosticUnderlineError", "NONE", "underline")
    writeHighlight(schemeFile, colors.br_blue, "DiagnosticUnderlineHint", "NONE", "underline")
    writeHighlight(schemeFile, colors.br_yellow, "DiagnosticUnderlineWarn", "NONE", "underline")
    writeHighlight(schemeFile, colors.cyan, "DiagnosticUnderlineInfo", "NONE", "underline")

    writeHighlight(schemeFile, colors.white, "BufferLineBackground", "NONE", "NONE")
    writeHighlight(schemeFile, colors.white, "BufferLineBufferSelected", lighten(colors.br_black, -0.1), "NONE")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "BufferLineBufferVisible", "NONE", "NONE")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "BufferLineCloseButton", "NONE", "NONE")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "BufferLineCloseButtonVisible", "NONE", "NONE")
    writeHighlight(schemeFile, colors.red, "BufferLineCloseButtonSelected", "NONE", "NONE")
    writeHighlight(schemeFile, "NONE", "BufferLineFill", colors.black, "NONE")
    writeHighlight(schemeFile, colors.yellow, "BufferLineIndicatorSelected", colors.black, "NONE")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "BufferLineSeparator", colors.black, "NONE")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "BufferLineSeparatorSelected", colors.black, "NONE")
    writeHighlight(schemeFile, lighten(colors.black, 0.1), "BufferLineSeparatorVisible", colors.black, "NONE")
    writeHighlight(schemeFile, colors.br_red, "BufferLineTab", colors.black, "NONE")
    writeHighlight(schemeFile, colors.red, "BufferLineTabClose", "NONE", "NONE")
    writeHighlight(schemeFile, colors.red, "BufferLineTabSelected", colors.br_black, "NONE")

    writeHighlight(schemeFile, colors.br_green, "@attribute", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_red, "@boolean", "NONE", "NONE")
    writeHighlight(schemeFile, colors.green, "@character", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_blue, "@character.special", "NONE", "NONE")
    writeHighlight(schemeFile, colors.br_black, "@comment", "NONE", "italic")

    schemeFile:close()
end

local function watch()
    local handle = uv.new_fs_event()
    if handle == nil then
        return
    end

    local flags = {
        watch_entry = false,
        stat = false,
        recursive = false,
    }

    local event_cb = function(err, _, _)
        if err then
            print("ERRORER!!!")
        else
            process_colors()
            vim.defer_fn(function()
                vim.cmd("colorscheme testScheme")
            end, 1)
        end
    end

    uv.fs_event_start(handle, colorFile, flags, event_cb)
end

watch()
