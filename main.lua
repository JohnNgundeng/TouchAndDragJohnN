-- Title: TouchAndDrag
-- Name: John Ngundeng
-- Course: ICS2O/3C
-- This program displays images that can be dragged around the screen.
-------------------------------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("images/space.png", 2048, 1536)
local girl1 = display.newImageRect("Images/girl1.png", 150, 150)
local girl1Width = girl1.width
local girl1Height = girl1.girl1Height

local girl2 = display.newImageRect("Images/girl2.png", 150, 150)
local girl2Width = girl2.width
local girl2Height = girl2.girl2Height

--my boolean variables to keep track of which object I touched first
local alreadyTouchedGirl1 = false
local alreadyTouchedGirl2 = false

--set the initial x and y position of myImage
girl1.x = 400
girl1.y = 500

girl2.x = 300
girl2.y = 200

--Funtion: Girl1Listener
--Input: touch listener
--Output: none
--Description: when girl 1 is touched, move her
local function Girl1Listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedGirl2 == false) then
			alreadyTouchedGirl1 = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirl1 == true) ) then
		girl1.x = touch.x
		girl1.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirl1 = false
		alreadyTouchedGirl2 = false
	end
end

girl1:addEventListener("touch", Girl1Listener)

--Funtion: Girl2Listener
--Input: touch listener
--Output: none
--Description: when girl 2 is touched, move her
local function Girl2Listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedGirl1 == false) then
			alreadyTouchedGirl2 = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirl2 == true) ) then
		girl2.x = touch.x
		girl2.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirl2 = false
		alreadyTouchedGirl1 = false
	end
end