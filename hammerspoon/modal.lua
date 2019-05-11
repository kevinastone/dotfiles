-- Setup
hs.window.animationDuration = 0

-- Modal activation / deactivation
local modal = hs.hotkey.modal.new({'cmd', 'ctrl'}, 'space')

modal:bind({}, 'escape', function() modal:exit() end )
modal:bind({}, 'return', function() modal:exit() end )
modal:bind({'cmd', 'ctrl'}, 'space', function() modal:exit() end )

function modal.runThenExit(self, callback)
    return function()
        callback()
        self:exit()
    end
end

-- Modal Indicator
local modalRect = hs.drawing.rectangle(hs.geometry(0, 0, 1, 1))
modalRect:setFill(false)
modalRect:setStroke(true)
modalRect:setStrokeWidth(5.0)
modalRect:setStrokeColor(hs.drawing.color.colorsFor('System')['controlAccentColor'])
modalRect:setAlpha(0.8)
modalRect:setRoundedRectRadii(5.0, 5.0)

function modal.entered(self)
    local win = hs.window.focusedWindow()
    if not win then
        self:exit()
    end
    -- -- For full-screen:
    -- local screen = win:screen()
    -- local frame = screen:frame()
    local frame = win:frame()
    modalRect:setFrame(frame)
    modalRect:bringToFront()
    modalRect:show()
end

function modal.exited()
    modalRect:hide()
end


return modal
