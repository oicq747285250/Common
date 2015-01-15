if myHero.charName ~= "Teemo" then return end



function PluginOnLoad()
	AutoCarry.SkillsCrosshair.range = 1050
	--> Main Load
	mainLoad()
	--> Main Menu
	mainMenu()
end

function PluginOnTick()
	Checks()
	if Target and (AutoCarry.MainMenu.MixedMode) then
		if QREADY and Menu.useQ2 and GetDistance(Target) <= qRange then CastSpell(_Q,Target) end
		
	end
		if Target and (AutoCarry.MainMenu.AutoCarry) then
		if QREADY and Menu.useQ and GetDistance(Target) <= qRange then CastSpell(_Q,Target) end
	
	end
end

function PluginOnDraw()
	--> Ranges
	if not Menu.drawMaster and not myHero.dead then
		if QREADY and Menu.drawQ then
			DrawCircle(myHero.x, myHero.y, myHero.z, qRange, 0x00FFFF)
		end

	end
end


--> Checks
function Checks()
	Target = AutoCarry.GetAttackTarget()
	QREADY = (myHero:CanUseSpell(_Q) == READY)

end


 

--> Main Load
function mainLoad()
	qRange = 580
	QREADY = false
	Cast = AutoCarry.CastSkillshot
	Menu = AutoCarry.PluginMenu
end

--> Main Menu
function mainMenu()
	Menu:addParam("sep0", "-- Ultimate Options --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("sep1", "-- Autocarry Mode --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("useQ", "Use - Q", SCRIPT_PARAM_ONOFF, true)
	Menu:addParam("sep2", "-- Mixed Mode --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("useQ2", "Use - Q", SCRIPT_PARAM_ONOFF, true)
	Menu:addParam("sep3", "-- Draw Options --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("drawMaster", "Disable Draw", SCRIPT_PARAM_ONOFF, false)
	Menu:addParam("drawQ", "Draw - Q", SCRIPT_PARAM_ONOFF, false)
end
