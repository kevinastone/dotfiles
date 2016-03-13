-- Setup
hs.window.animationDuration = 0

-- Modal activation / deactivation
local modal = hs.hotkey.modal.new({'cmd', 'ctrl'}, 'space')
local modalRect = null

modal:bind({}, 'escape', function() modal:exit() end )
modal:bind({}, 'return', function() modal:exit() end )
modal:bind({'cmd', 'ctrl'}, 'space', function() modal:exit() end )

function modalExit(callback)
    return function()
        callback()
        modal:exit()
    end
end

function modal:entered()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local max = screen:frame()
    modalRect = hs.drawing.rectangle(max)
    modalRect:setFill(false)
    modalRect:setStroke(true)
    modalRect:setStrokeWidth(5.0)
    modalRect:setStrokeColor(hs.drawing.color.colorsFor('System')['alternateSelectedControlColor'])
    modalRect:bringToFront()
    modalRect:show()
end

function modal:exited()
    modalRect:hide()
end


-- Window Management
modal:bind({}, "left", nil, modalExit(function()
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


modal:bind({}, "right", nil, modalExit(function()
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


modal:bind({}, ",", nil, modalExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    win:setFrame(f)
end))


modal:bind({}, ".", nil, modalExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w - f.w
    win:setFrame(f)
end))


modal:bind({}, "v", nil, modalExit(function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y
    f.h = max.h
    win:setFrame(f)
end))


modal:bind({}, "space", nil, modalExit(function()
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
