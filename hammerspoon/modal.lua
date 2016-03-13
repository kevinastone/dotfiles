-- Setup
hs.window.animationDuration = 0

-- Modal activation / deactivation
local modal = hs.hotkey.modal.new({'cmd', 'ctrl'}, 'space')
local modalRect = null

modal:bind({}, 'escape', function() modal:exit() end )
modal:bind({}, 'return', function() modal:exit() end )
modal:bind({'cmd', 'ctrl'}, 'space', function() modal:exit() end )

function modal.runThenExit(this, callback)
    return function()
        callback()
        this:exit()
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
    modalRect:setAlpha(0.8)
    modalRect:setRoundedRectRadii(5.0, 5.0)
    modalRect:bringToFront()
    modalRect:show()
end

function modal:exited()
    modalRect:hide()
end


return modal
