-- Setup
hs.window.animationDuration = 0

local modal = require "modal"

-- Window Management
modal:bind({}, "left", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end))


modal:bind({}, "right", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end))


modal:bind({}, ",", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    win:setFrame(f)
end))


modal:bind({}, ".", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w - f.w
    win:setFrame(f)
end))


modal:bind({}, "v", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y
    f.h = max.h
    win:setFrame(f)
end))


modal:bind({"shift"}, "\\", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y
    f.h = max.h
    win:setFrame(f)
end))


modal:bind({}, "space", modal:runThenExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end))
