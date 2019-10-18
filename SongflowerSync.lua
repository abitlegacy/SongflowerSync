local RightClickDisabled = false;
local function disableRightClick()
	RightClickDisabled = true;
end
local function enableRightClick()
	RightClickDisabled = false;
end

WorldFrame:HookScript(
	"OnMouseUp", function(self, button)
	if 
		button == "RightButton" and RightClickDisabled then
		MouselookStop();
	end
end
);

SLASH_SONGFLOWERSYNC1 = "/pick"
SlashCmdList["SONGFLOWERSYNC"] = function(msg)
	disableRightClick();
   DBM:CreatePizzaTimer(10, "Click Flower!", true);
   DBM:Schedule(10, enableRightClick)
end

DBM:RegisterCallback("DBM_TimerStart", disableRightClick);
DBM:RegisterCallback("DBM_TimerStop", enableRightClick);