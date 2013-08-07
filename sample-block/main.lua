-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require("physics")
physics.setDrawMode("normal")
physics.setGravity( 0, 90 )
physics.start()

-- Display Size
local dispWidth = display.contentWidth
local dispHeight = display.contentHeight

-- Background
local background = display.newRect( 0, 0, dispWidth, dispHeight )
background:setFillColor( 160, 216, 239, 255 )

-- Ground
local groundHeight = ( dispHeight / 100 ) * 10
local ground = display.newRect( 0, dispHeight - groundHeight, dispWidth, groundHeight )
ground:setFillColor( 148, 98, 67, 255 )
physics.addBody( ground, "static", { friction=0.5, bounce=0.3, isSensor=false } )

local fallBlock =  function()
	local block = display.newRect( math.random( 0, dispWidth ), 0, 150, 50)
	block.strokeWidth = 1
	block:setFillColor( math.random(0,256), math.random(0,256), math.random(0,256) )
	block:setStrokeColor( 220, 214, 217 )
	block.rotation = math.random( 360 )
	physics.addBody( block, "dynamic", { density=0.6, friction=0.6, bounce=0.3 } )
end

-- run the above function 14 times
timer.performWithDelay( 1500, fallBlock, 14 )