
local TipsView = {}

function TipsView.Hotfix( )
	local tipsView = CS.Younne.TipsView
	xlua.hotfix(tipsView, "SetTips", 
		function ( ... )
			tipsView.tipsText = 'New'
		end
	)
end


TipsView.Hotfix()

return TipsView