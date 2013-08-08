-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Display Size
local dispWidth = display.contentWidth
local dispHeight = display.contentHeight

-- Background
local background = display.newRect( 0, 0, dispWidth, dispHeight )
background:setFillColor( 255, 255, 255, 255 )

-- Event Area
local area = display.newRect( 10, 10, dispWidth - 20, dispHeight / 2 )
area.strokeWidth = 2
area:setFillColor( 255, 255, 255, 255 )
area:setStrokeColor( 0, 0, 0, 255 )

-- Text Area
local areaText = display.newText("hello", 0, 0, native.systemFontBold, 20)
areaText:setTextColor( 235, 97, 1, 255)
areaText.x = display.contentCenterX
areaText.y = display.contentCenterY / 2

-- Event Listener
local function tapEventListener( event )
	areaText.text = "Tap!"
	areaText.x = display.contentCenterX
	return true
end
local function touchEventListener( event )
	if event.phase == "began" then
		areaText.text = "Press!"
	elseif event.phase == "moved" then
		areaText.text = "Move!"
	elseif event.phase == "ended" or event.phase == "cancelled" then
		areaText.text = "Release!"
	end
	areaText.x = display.contentCenterX
	return true
end
local function shakeEventListener( event )
	if event.isShake then
		areaText.text = "Shake!"
		areaText.x = display.contentCenterX
	end
	return true
end

area:addEventListener( "tap", tapEventListener )
area:addEventListener( "touch", touchEventListener )
Runtime:addEventListener( "accelerometer", shakeEventListener )
