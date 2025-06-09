local acmessages = require("utilitybelt.acmessages")
local views = require("utilitybelt.views")
local ImGui = require("imgui")
local fs = require("filesystem")
local im = ImGui ~= nil and ImGui.ImGui or {}

local buttonMatrix = {
	{label = "Recall", command = "/ub jump"},{label = "Primary", command = "p"},{label = "Secondary", command = "Secondary"},
	{label = "LS", command = "ls"},
	{label = "LS Send", command = "ls"},
	{label = "Ulgrims", command = "ls"},
	{label = "Sanc", command = "ls"}
	}

local buttonMatrix2 = {
	{
		{
			label = "TN", 
			command = "/ub use Town Network Sending Gem", 
			IconTexture = views.Huds.GetIconTexture(7435) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(7435) or nil
		},
		{
			label = "MP", 
			command = "/ub use Marketplace Recall Gem", 
			IconTexture = views.Huds.GetIconTexture(30015) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(30015) or nil
		},
		{	
			label = "Mines", 
			command = "/ub use Abandoned Mines Portal Sending Gem", 
			IconTexture = views.Huds.GetIconTexture(9072) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(9072) or nil
		},
		{
			label = "VOD", 
			command = "/ub use Valley of Death Encampment Gem", 
			IconTexture = views.Huds.GetIconTexture(7927) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(7927) or nil
		},
		{
			label = "Fac Hub 2", 
			command = "/ub use Enlightened Facility Hub Portal Gem", 
			IconTexture = views.Huds.GetIconTexture(12463) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(12463) or nil
		},
		{
			label = "portal_recall", 
			command = "/ub use Portal Recall Gem", 
			IconTexture = views.Huds.GetIconTexture(13337) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(13337) or nil
		}
	},
	{
		{	
			label = "Fac Hub", 
			command = "/ub use Facility Hub Portal Gem", 
			IconTexture = views.Huds.GetIconTexture(13126) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(13126) or nil
		},
		{
			label = "WW", 
			command = "/ub use Wicked Wares Gem", 
			IconTexture = views.Huds.GetIconTexture(9774) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(9774) or nil
		},
		-- {
		-- 	label = "Frozen", 
		-- 	command = "/ub use Frozen Valley Everlasting Portal Gem", 
		-- 	IconTexture = views.Huds.GetIconTexture(29816) or nil,	
		-- 	IconOverlayTexture = views.Huds.GetIconTexture(29816) or nil
		-- },
		{
			label = "VRise", 
			command = "/ub use Viridian Rise Deru Portal Sending Gem", 
			IconTexture = views.Huds.GetIconTexture(30065) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(30065) or nil
		},
		{
			label = "Penthouse", 
			command = "/ub use Penthouse Penthouse Recall Gem", 
			IconTexture = views.Huds.GetIconTexture(30015) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(30015) or nil
		},
		-- {
		-- 	label = "tusker_king", 
		-- 	command = "/ub use Tusker King Sending Gem", 
		-- 	IconTexture = views.Huds.GetIconTexture(10513) or nil,	
		-- 	IconOverlayTexture = views.Huds.GetIconTexture(10513) or nil
		-- },
		{
			label = "Gaerlan", 
			command = "/ub use Gaerlan's Library Portal Sending Gem", 
			IconTexture = views.Huds.GetIconTexture( 10182) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture( 10182) or nil
		},
		{
			label = "ew", 
			command = "/ub use Eldrytch Web Stronghold Portal Gem", 
			IconTexture = views.Huds.GetIconTexture( 9168) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture( 9168) or nil
		},

	}
}

local weapons = {
	{
	{
			label = "ae", 
			command = "/ub use Armament of the Eternal", 
			IconTexture = views.Huds.GetIconTexture(12329) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(12329) or nil
		},
		{
			label = "L", 
			command = "/ub use Fallen Hellspike", 
			IconTexture = views.Huds.GetIconTexture(27121) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(29906) or nil
		},
		{
			label = "Tusker", 
			command = "/ub use Tusker's Fate", 
			IconTexture = views.Huds.GetIconTexture(14103) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(14103) or nil
		},
		{	
			label = "spitfire", 
			command = "/ub use Spitfire", 
			IconTexture = views.Huds.GetIconTexture(26163) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(26163) or nil
		},
		{
			label = "doom", 
			command = "/ub use Fallen Doom Hammer", 
			IconTexture = views.Huds.GetIconTexture(27120) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(29906) or nil
		},
		{
			label = "back", 
			command = "/ub use Marge's Back Scratcher", 
			IconTexture = views.Huds.GetIconTexture(7463) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(7463) or nil
		}
	},
	{
		{
			label = "ZS", 
			command = "/ub use Zefir Swatter", 
			IconTexture = views.Huds.GetIconTexture(14207) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(14207) or nil
		},
		-- {
		-- 	label = "MA", 
		-- 	command = "/ub use Mephisto's Anger", 
		-- 	IconTexture = views.Huds.GetIconTexture(5525) or nil,	
		-- 	IconOverlayTexture = views.Huds.GetIconTexture(5525) or nil
		-- },
		{
			label = "BPID", 
			command = "/ub use BPIB", 
			IconTexture = views.Huds.GetIconTexture(12576) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(12576) or nil
		},
		{	
			label = "VH", 
			command = "/ub use Vihaya", 
			IconTexture = views.Huds.GetIconTexture(9714) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(9714) or nil
		},
		{
			label = "Fiery Vihaya", 
			command = "/ub use Fiery Vihaya", 
			IconTexture = views.Huds.GetIconTexture(9720) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(9720) or nil
		},
		{
			label = "Sparking Vihaya", 
			command = "/ub use Sparking Vihaya", 
			IconTexture = views.Huds.GetIconTexture(9716) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(9716) or nil
		},
		{
			label = "Acid Vihaya", 
			command = "/ub use Acid Vihaya", 
			IconTexture = views.Huds.GetIconTexture(9719) or nil,	
			IconOverlayTexture = views.Huds.GetIconTexture(9719) or nil
		}
	}
}

local function runCommand(cmd)
	game.Actions.InvokeChat(cmd.command)
end


if ImGui ~= nil and views ~= nil then
    local hud = views.Huds.CreateHud("Recall Assist", 7435)
    hud.Visible = true
	hud.WindowSettings = ImGui.ImGuiWindowFlags.AlwaysAutoResize

	hud.OnPreRender.Add(function()
		im.SetNextWindowSizeConstraints(Vector2.new(200, 140), Vector2.new(9999, 9999));
		hud.Title = "Recall Assistant"
	end)

	hud.OnRender.Add(function()
		if im.BeginTabBar("RecallAssistBar") then
			if im.BeginTabItem("Recall Gems") then
				if im.BeginTable("GemsTable",#buttonMatrix2[1]) then
					for row = 1, #buttonMatrix2 do
						im.TableNextRow()
		
						for col = 1, #buttonMatrix2[row] do			
							im.TableNextColumn()
							local cmd = buttonMatrix2[row][col]
							
							if cmd.label ~= "none" then		
								if im.ImageButton(cmd.label, cmd.IconTexture.TexturePtr, Vector2.new(33, 33)) then
									runCommand(cmd)
								end
							end
						end
					end

					im.EndTable()
				end	
				im.EndTabItem()
			end
			if im.BeginTabItem("Weapons") then
				if im.BeginTable("WeaponsTable",#weapons[1]) then
					for row = 1, #weapons do
						im.TableNextRow()
		
						for col = 1, #weapons[row] do			
							im.TableNextColumn()
							local cmd = weapons[row][col]
							
							if cmd.label ~= "none" then		
								if im.ImageButton(cmd.label, cmd.IconTexture.TexturePtr, Vector2.new(33, 33)) then
									runCommand(cmd)
								end
							end
						end
					end

					im.EndTable()
				end	
				im.EndTabItem()
			end
			im.EndTabBar()
		end
	end)
end