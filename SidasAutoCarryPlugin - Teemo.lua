if myHero.charName ~= "Teemo" then return end

--require "AoE_Skillshot_Position"


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
		if QREADY and Menu.useQ2 and GetDistance(Target) <= qRange then CastSpell(_Q) end
		
	end
		if Target and (AutoCarry.MainMenu.AutoCarry) then
		if QREADY and Menu.useQ and GetDistance(Target) <= qRange then CastSpell(_Q) end
	
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
	--Menu:addParam("rMEC", "Crescendo - Use MEC", SCRIPT_PARAM_ONOFF, true)
  --Menu:addParam("rEnemies", "Crescendo - Min Enemies",SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
	Menu:addParam("sep1", "-- Autocarry Mode --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("useQ", "Use - Hymn of Valor", SCRIPT_PARAM_ONOFF, true)
	--Menu:addParam("useR", "Use - Crescendo", SCRIPT_PARAM_ONOFF, true)
	Menu:addParam("sep2", "-- Mixed Mode --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("useQ2", "Use - Hymn of Valor", SCRIPT_PARAM_ONOFF, true)
	--Menu:addParam("useR2", "Use - Crescendo", SCRIPT_PARAM_ONOFF, false)
	Menu:addParam("sep3", "-- Draw Options --", SCRIPT_PARAM_INFO, "")
	Menu:addParam("drawMaster", "Disable Draw", SCRIPT_PARAM_ONOFF, false)
	Menu:addParam("drawQ", "Draw - Hymn of Valor", SCRIPT_PARAM_ONOFF, false)
	--Menu:addParam("drawR", "Draw - Crescendo", SCRIPT_PARAM_ONOFF, false)
end
