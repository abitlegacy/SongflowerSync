local RightClickDisabled = false;
local function disableRightClick(_, _, text, time)
	if text == "Click Flower!" then
		DBM:Schedule(time, function ()
			RightClickDisabled = false;
		end)
		RightClickDisabled = true;
	end
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
end

DBM:RegisterCallback("DBM_TimerStart", disableRightClick);