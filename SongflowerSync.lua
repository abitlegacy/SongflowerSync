local RightClickDisabled = false;
local function disableRightClick(_, _, text)
	if text == "Click Flower!" then
		RightClickDisabled = true;
	end
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
   DBM:CreatePizzaTimer(10, "Click Flower!", true);
   DBM:Schedule(10, enableRightClick)
end

DBM:RegisterCallback("DBM_TimerStart", disableRightClick);