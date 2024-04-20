
-- ซอสเก่าแก่ dinosaur
-- Last Update  11/10/23
-- using DebugId to Verify unit is good than using position and compare Magnitude 
-- and Find a true positon if map position has change 
repeat
	wait()
until game:IsLoaded()
-- Royx
DebugMode = true
--wating until gameload 
require(game:GetService("ReplicatedStorage").Client.Initializers.Audio)
-----
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
function crash()
	while true do
	end
end
foundAnything = ""
local httpService = game:GetService('HttpService')
local SaveManagers = {}
do
	SaveManagers.Folder = 'RoyxTDS';
	SaveManagers.File = 'Defaults';
	SaveManagers.Ignore = {};
	SaveManagers.Parser = {
		Toggle = {
			Save = function(idx, object) 
				return {
					type = 'Toggle',
					idx = idx,
					value = object.Value
				} 
			end,
			Load = function(idx, data)
				if Toggles[idx] then 
					Toggles[idx]:SetValue(data.value)
				end
			end,
		},
		Slider = {
			Save = function(idx, object)
				return {
					type = 'Slider',
					idx = idx,
					value = tostring(object.Value)
				}
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		},
		Dropdown = {
			Save = function(idx, object)
				return {
					type = 'Dropdown',
					idx = idx,
					value = object.Value,
					mutli = object.Multi
				}
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		},
		ColorPicker = {
			Save = function(idx, object)
				return {
					type = 'ColorPicker',
					idx = idx,
					value = object.Value:ToHex()
				}
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValueRGB(Color3.fromHex(data.value))
				end
			end,
		},
		KeyPicker = {
			Save = function(idx, object)
				return {
					type = 'KeyPicker',
					idx = idx,
					mode = object.Mode,
					key = object.Value
				}
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue({
						data.key,
						data.mode
					})
				end
			end,
		},
		Input = {
			Save = function(idx, object)
				return {
					type = 'Input',
					idx = idx,
					value = object.Value
				}
			end,
			Load = function(idx, data)
				if Options[idx] then 
					Options[idx]:SetValue(data.value)
				end
			end,
		}
	}

	function SaveManagers:SetIgnoreIndexes(list)
		for _, key in next, list do
			self.Ignore[key] = true
		end
	end

	function SaveManagers:SetFolder(folder)
		self.Folder = folder;
		self:BuildFolderTree()
	end
    
	function SaveManagers:SetFile(file)
		self.File = file;
		self:BuildFolderTree();
	end

	function SaveManagers:Save()
		wait(0.1)
		local fullPath = string.format("%s/settings/%s.json", self.Folder , self.File)

		local data = {
			objects = {}
		}

		for idx, toggle in next, Toggles do
			if self.Ignore[idx] then
				continue
			end

			table.insert(data.objects, self.Parser[toggle.Type].Save(idx, toggle))
		end

		for idx, option in next, Options do
			if not self.Parser[option.Type] then
				continue
			end
			if self.Ignore[idx] then
				continue
			end

			table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
		end	

		local success, encoded = pcall(httpService.JSONEncode, httpService, data)
		if not success then
			return false, 'failed to encode data'
		end

		writefile(fullPath, encoded)
		return true
	end

	function SaveManagers:Load(name)
		local file = string.format("%s/settings/%s.json", self.Folder , self.File)
		if not isfile(file) then
			return false, 'invalid file'
		end

		local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))
		if not success then
			return false, 'decode error'
		end

		for _, option in next, decoded.objects do
			if self.Parser[option.type] then
				self.Parser[option.type].Load(option.idx, option)
			end
		end

		return true
	end

	function SaveManagers:IgnoreThemeSettings()
		self:SetIgnoreIndexes({
			"BackgroundColor",
			"MainColor",
			"AccentColor",
			"OutlineColor",
			"FontColor",
			"ThemeManager_ThemeList",
			'ThemeManager_CustomThemeList',
			'ThemeManager_CustomThemeName'
		})
	end

	function SaveManagers:BuildFolderTree()
		local paths = {
			self.Folder,
			string.format("%s/themes", self.Folder),
			string.format("%s/settings", self.Folder)
		}

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end
	function SaveManagers:AutoSave()
		task.spawn(function()
			while task.wait(0.5) do
				if Toggles["AutoSave"] and Toggles["AutoSave"].Value then
					self:Save();
				end
			end
		end);
	end
	SaveManagers:BuildFolderTree()
end
---------------------------------------- Joins  server  
local function TPReturner()
	local PlaceID = 3260590327
	local AllIDs = {}
	local actualHour = os.date("!*t").hour
	local Deleted = false
	local File = pcall(function()
		AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
	end)
	if not File then
		table.insert(AllIDs, actualHour)
		writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
	end
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", PlaceID)))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s", PlaceID, foundAnything)))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i, v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers - 1) > tonumber(v.playing) and tonumber(v.playing) > 5 and tonumber(v.playing) < Options.MaxPlayers.Value then
			for _, Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = true
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile("NotSameServers.json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				wait()
				pcall(function()
					writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					wait()
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					print("Joins")
				end)
				wait(4)
			end
		end
	end
end
local function Hop(Rejoin, PlayerTotal, MaxPlayer)
	if Rejoin and PlayerTotal > MaxPlayer  then
		while wait() do
			TPReturner()
			if foundAnything ~= "" then
				TPReturner()
			end
		end
	end
end
 ----------------------------------------  print Table 
function tprint (tbl, indent)
	if not indent then
		indent = 0
	end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = indent + 2
	for k, v in pairs(tbl) do
		toprint = toprint .. string.rep(" ", indent)
		if (type(k) == "number") then
			toprint = toprint .. "[" .. k .. "] = "
		elseif (type(k) == "string") then
			toprint = toprint  .. k ..  "= "
		end
		if (type(v) == "number") then
			toprint = toprint .. v .. ",\r\n"
		elseif (type(v) == "string") then
			toprint = toprint .. "\"" .. v .. "\",\r\n"
		elseif (type(v) == "table") then
			toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
		else
			toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
		end
	end
	toprint = toprint .. string.rep(" ", indent - 2) .. "}"
	return toprint
end
---------------------------------------- Converter  
local function stringtocf(str)
	return CFrame.new(table.unpack(str:gsub(" ", ""):split(",")))
end
local function stringtopos(str)
	return Vector3.new(table.unpack(str:gsub(" ", ""):split(",")))
end
local stringtoNum = function (str)
	local str = tostring(str):gsub(",", "")
	if str:split("$")[2] then
		return tonumber(str:split("$")[2])
	else
		return tonumber(str:split("$")[1])
	end
end
local function GetMapFucker(c)
	if Options.AutoJMode.Value then
		for i in pairs(Options.AutoSurvival.Value) do
			if i == c then
				for _, v in pairs(listfiles("RoyxTDS/Macro")) do 
					local MapName = loadfile(v)()[2]
					if i == MapName then 
						return v
					end
				end
			end
		end
	else
		for i in pairs(Options.AutoHardcore.Value) do
			if i == c then 
				for _, v in pairs(listfiles("RoyxTDS/Macro")) do 
					local MapName = loadfile(v)()[2]
					if i == MapName then 
						return v
					end
				end
			end
		end
	end
end
---------------------------------------- Get Unit_Id 
local function GET_UID(name, Position)
	for i, v in pairs(game.Workspace.Towers:GetChildren()) do
		if v.Name == name  and  (v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position == Position).magnitude < 4) then
			return v.HumanoidRootPart:GetDebugId()
		end
	end
end
---------------------------------------- Verify
local function Verify_Unit(name, Position, UnitId)
	if type(Position) == "string" then
		Position = stringtopos(Position)
	end
	for i, v in pairs(game.Workspace.Towers:GetChildren()) do
		local UID = v.HumanoidRootPart:GetDebugId()
		if v.HumanoidRootPart.Position == Position or (v.HumanoidRootPart.Position - Position).magnitude < 2 or UID == UnitId then
			print("Ye")
			return {
				Id = v.HumanoidRootPart:GetDebugId(),
				Instance = v
			}
		end
	end
end
---------------------------------------- Misc 
getgenv().LastRemote = nil
getgenv().LastRemoteAction = nil
getgenv().Mode = "N/A"
getgenv().chars = {}
local Idenity = {}
local a = getrawmetatable(game)
local backs = a.__namecall
local Write = {}
getgenv().MapName = false
getgenv().count = 0
getgenv().UnitCF = ""
getgenv().UnitIds = ""
local PlyHasJoin = false
if not game.Workspace:FindFirstChild("Elevators") then
	getgenv().Moduel = require(game:GetService("ReplicatedStorage").Client.Modules.Game.Interface.Elements.Upgrade.upgradeHandler)
end
 ----------------------------------------  loadunit
function loadunit(file)
	local file = loadfile(file)()[1]
	local Unit = {}
	for i, v in pairs(file) do
		if v["Action"] == "Place" and not table.find(Unit, v.Unit) then
			table.insert(Unit, v.Unit)
		end
	end
	for i, v in pairs(Unit) do
		task.spawn(function()
			local args = {
				[1] = "Inventory",
				[2] = "Equip",
				[3] = "tower",
				[4] = v
			}
			game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
		end)
	end
end
function AutoJfunc()
	if game.Workspace:FindFirstChild("Elevators") then
		while true do
			wait()
			if not Toggles.AutoJoin.Value then
				return
			end
			for i, v in pairs(game:GetService("Workspace").Elevators:GetChildren()) do
				local MdS = require(v.Settings)
				local MAPFUCKER = GetMapFucker(v.State.Map.Title.Value)
				if v.State.Players.Value  == 0 and game.Players.LocalPlayer.Level.Value > MdS.Level and MdS.Type == Options.AutoJMode.Value and ( (Toggles.AutoJoin.Value and Options.AutoJMode.Value == "Survival" and MAPFUCKER  ) or (Toggles.AutoJoin.Value and Options.AutoJMode.Value == "Hardcore" and  MAPFUCKER)) then
					if Toggles.LoadUnit.Value and Toggles.MacroNameMap.Value then
						loadunit(MAPFUCKER)						
					end
					game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Elevators", "Enter", v)
					repeat
						if v.State.Players.Value > 1 or not Toggles.AutoJoin.Value  then
							game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Elevators", "Leave")
						end
						wait(0.25)
					until v.State.Timer.Value <= 0 
				end
			end
		end
	end
end
local Mapshitty = {
	Normal = {},
	Hardcore = {}
}
local function GrabMap(mode, tables)
	for i, v in pairs(tables) do 
		table.insert( Mapshitty[mode], v.Name)
	end
end
GrabMap("Hardcore", game:GetService("ReplicatedStorage").Assets.Maps.Hardcore:GetChildren())
GrabMap("Normal", game:GetService("ReplicatedStorage").Assets.Maps.Survival:GetChildren())
local PlacePrice = function(name, golden)
	print(name, golden)
	local a = require(game:GetService("ReplicatedStorage").Content.Tower[name].Stats)
	local price = a.Stats.Default.Defaults.Price
	if golden then
		price = a.Stats.Golden.Defaults.Price
	end
	return price
end
function writeRecord()
	return writefile(string.format("/RoyxTDS/Macro/%s", Options.MarcoProfiles.Value:split([[\]])[2]), string.format([[a = %s; function Royx_hub()  return {a,"%s"} end  return Royx_hub() ]], tprint(Write), game.ReplicatedStorage.State.Map.Value))
end
---------------------------------------- An Troops Checking
if not game.Workspace:FindFirstChild("Elevators") then
	local b = Moduel.selectTroop
	Moduel.selectTroop = function(m1, p1)
     -- print(tprint(m))
		setthreadidentity(8)
		Unit_Ids = p1.HumanoidRootPart:GetDebugId()
		Main_Path = Write[#Write]
		if Options.Mode.Value == "Record" and Main_Path and Main_Path.Action == "Place" and not Main_Path["Unit_Id"]  then
			print("YEs")
			local IsGolden
			if p1:FindFirstChild("Torso") then
				IsGolden = p1.Torso:FindFirstChild("Shine")
			end
			local UnitName = Main_Path["Unit"]
			Main_Path["Unit_Id"] = Unit_Ids
			Main_Path["Price"] = PlacePrice(UnitName, IsGolden)
			writeRecord()
		end
		UnitCF = p1.HumanoidRootPart
		return b(m1, p1)
	end
end
----------------------------------------UnitControl Main
local function UnitControl(Instance, UID, Actions)
	if Actions == "Sell" then
		return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops", Actions,  {
			["Troop"] = Instance
		})
	else
		return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops", Actions, "Set",  {
			["Troop"] = Instance
		})
	end
end
 ---------------------------------------- Check
 --- lol wtf this is idk what i do 
if not game.Workspace:FindFirstChild("Elevators") then
	getgenv().Control = game:GetService("Workspace").Towers.DescendantAdded:Connect(function(desc)
		if Mode == "Play"  and Toggles.Marco.Value then
			if desc.Name == "Owner" and desc.Value == game.Players.LocalPlayer then
				count = count  + 1
			end
		end
	end)
end 	

---------------------------------------- Plays Main
local function Plays()
	if Mode == "Play"  and Toggles.Marco.Value and not game.Workspace:FindFirstChild("Elevators") then
		local loads
		if Toggles.MacroNameMap.Value then 
			for i, v in pairs(listfiles("RoyxTDS/Macro")) do 
				local MapName = loadfile(v)()[2]
				if game.ReplicatedStorage.State.Map.Value == MapName then 
					loads = loadfile(v)()[1]
				end
			end
		else
			loads = loadfile(Options.MarcoProfile.Value)()[1]
		end
		for i = 1, #loads do
			if DebugMode then
				print("Attemps to Do Macro At : " .. i)
			end
			ve = loads[i]
			if ve["Action"] == "Place" then
				repeat
					local Unit = Verify_Unit(ve['Unit'], ve['Position'], ve['Unit_Id'])
					if Unit   then 
						Idenity[ve["Unit_Id"]] = Unit["Id"]
					end
					local Ply_Money = stringtoNum(game.Players.LocalPlayer.PlayerGui.GameGui.Hotbar.Stats.Cash.Amount.Text)
					if Ply_Money >=  stringtoNum(ve["Price"]) then
						game.ReplicatedStorage.RemoteFunction:InvokeServer("Troops", ve["Action"], ve["Unit"], {
							["Position"] = stringtopos(ve["Position"]),
							["Rotation"] = stringtocf(ve["Rotation"])
						}
                    )
					end
					task.wait(0.25)
				until  Unit
			elseif ve["Action"] == "Sell" or ve["Action"] == "Target" then
				local Unit = Verify_Unit(ve['Unit'], vve['Stamp'] or ve['Position'], ve['Unit_Id'])

				UnitControl(Unit["Instance"], ve["Unit_Id"], ve["Action"])
			elseif  ve["Action"] == "Upgrade" then
				repeat
					local Unit
					local Ply_Money = stringtoNum(game.Players.LocalPlayer.PlayerGui.GameGui.Hotbar.Stats.Cash.Amount.Text)
					if Ply_Money >= stringtoNum(ve['Price']) then
						Unit = Verify_Unit(ve['Unit'], ve['Stamp'] or ve['Position'], ve['Unit_Id'])
						UnitControl(Unit["Instance"], ve["Unit_Id"], ve["Action"])
					end
					task.wait(0.27)
				until Unit
			end
			wait(Options.Wait.Value)
		end
	end
end

----------------------------------------MarcoFolder
if not isfolder("/RoyxTDS/Macro") then
	makefolder("/RoyxTDS/Macro")
end
---------------------------------------- Ui Creating
Library:SetWatermark("Royx Tower Defends Simulator IsLoadded")
local Window = Library:CreateWindow({
	Title = 'Royx Hub [v0.2]',
	Center = true,
	AutoShow = true,
	TabPadding = 8,
	MenuFadeTime = 0.2
})
local GeneralTab = Window:AddTab("Marco")
local MainBOX = GeneralTab:AddLeftTabbox("Main")
local Main = MainBOX:AddTab("Main")
Main:AddDropdown("Mode", {
	Text = "Mode",
	Default = 1,
	Values = {
		"N/A",
		"Record",
		"Play"
	}
}):OnChanged(function()
	Mode = Options.Mode.Value
end)
Main:AddDropdown("Difficulty", {
	Text = "In-game Difficulty",
	Default = 1,
	Values = {
		"Easy",
		"Normal",
		"Insane"
	},
}):OnChanged(function()
	game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Difficulty", "Vote", Options.Difficulty.Value);
end)
Main:AddToggle("Marco", {
	Text = "Enable"
}):OnChanged(function()
	if   Toggles.Marco.Value  then
		task.spawn(Plays)
	end
end)
Main:AddToggle("Skip", {
	Text = "Auto Skip"
})
Main:AddSlider("Wait", {
	Text = "Wait x time",
	Min = 1,
	Max = 10,
	Default = 1,
	Rounding = 3
})
---------------------------------------- file
local MainBOXs = GeneralTab:AddRightTabbox("Main")
local Mains = MainBOXs:AddTab("file")
Mains:AddInput("file", {
	Text = "File to Record"
})
Mains:AddButton("Create Files", function()
	writefile(string.format("/RoyxTDS/Macro/%s.lua", Options.file.Value)	, "")
	Options.MarcoProfile.Values = listfiles("/RoyxTDS/Macro")
	Options.MarcoProfile:SetValues()
	Options.MarcoProfile:SetValue("N/A")
	Options.MarcoProfiles.Values = listfiles("/RoyxTDS/Macro")
	Options.MarcoProfiles:SetValues()
	Options.MarcoProfiles:SetValue("N/A")
end)
Mains:AddDropdown("MarcoProfiles", {
	Text = "Macro Profile Record",
	Default = 1,
	Values = listfiles("/RoyxTDS/Macro")
})
local Marcos = Mains:AddDropdown("MarcoProfile", {
	Text = "Macro Profile Play",
	Default = 1,
	Values = listfiles("/RoyxTDS/Macro")
})
Mains:AddToggle("MacroNameMap", {
	Text = "Auto Load Macro"
})
Mains:AddToggle("LoadUnit", {
	Text = "Auto Load unit"
})
------------------------------ Rejoin Max
local MainBOX = GeneralTab:AddRightTabbox("Rejoin")
local Main = MainBOX:AddTab("Rejoin Selection")
Main:AddSlider("MaxPlayers", {
	Text = "MaxPlayers",
	Min = 1,
	Max = 60,
	Default = 25,
	Rounding = 0
})

Main:AddToggle("Rejoins", {
	Text = "Rejoin",
	Tooltip = "Rejoin if Player > MaxPlayers Slider"
}):OnChanged(function()
	task.spawn(Hop, Toggles.Rejoins.Value , #game.Players:GetPlayers(), Options.MaxPlayers.Value)
end)
Main:AddToggle("RejoinsEnd", {
	Text = "Rejoins After game ended"
})--
---------------------------------------- AutoJoins
local MainBOX = GeneralTab:AddLeftTabbox("Joins Selection")
local Main = MainBOX:AddTab("AutoJoins")
Main:AddDropdown("AutoJMode", {
	Text = "Auto Join Mode",
	Default = 1,
	Values = {
		"N/A",
		"Survival",
		"Hardcore"
	}
})
Main:AddDropdown("AutoSurvival", {
	Text = "Survival",
	Default = 1,
	Values = Mapshitty.Normal,
	Multi = true 
})
Main:AddDropdown("AutoHardcore", {
	Text = "Hardcore",
	Default = 1,
	Values = Mapshitty.Hardcore,
	Multi = true 
})
Main:AddToggle("AutoJoin", {
	Text = "AutoJoin"
}):OnChanged(function()
	if  Toggles.AutoJoin.Value then
		task.spawn(AutoJfunc)
	end
end)
SaveManagers:Load("Defaults")
SaveManagers:AutoSave()
---------------------------------------- Auto Save and UI Setting
local SettingSave = Window:AddTab('UI Settings')
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:SetIgnoreIndexes({
	'MenuKeybind'
}) 
ThemeManager:SetFolder('RoyxTDS')
SaveManager:SetFolder('RoyxTDS')
SaveManager:BuildConfigSection(SettingSave) 
ThemeManager:ApplyToTab(SettingSave)
SaveManager:LoadAutoloadConfig()
local MainBOX = SettingSave:AddRightTabbox("Save UI")
local Main = MainBOX:AddTab("Save")
Main:AddToggle("AutoSave", {
	Text = "AutoSave"
}):OnChanged(function()
	if Toggles.AutoSave.Value then
		SaveManagers:AutoSave()
	end
end)
local function GetPrice()
	return game.Players.LocalPlayer.PlayerGui.RoactUpgrades.upgrades.bottom.upgrade.buy.button.content.value.Text:split("Upgrade: $")[2]
end
---------------------------------------- Any Load Config 
Mode = Options.Mode.Value
----------------------------------------Marco for Metamethod
setreadonly(a, false)
a.__namecall = function(...)
	if Options.Mode.Value == "Record" then
		arg = {
			...
		}
		self = arg[1]
		if self == game.ReplicatedStorage.RemoteFunction or getcallingscript() ==  game.Players.LocalPlayer.PlayerScripts.Client then
			if arg[3] == "Place" or arg[3] == "Upgrade" or arg[3] == "Target" or arg[3] == "Sell" then
				LastRemoteAction = arg[3]
				LastRemote = arg[5]
				if arg[3] == "Place" then
					print("YES1")
					tbl = {
						["Action"] = LastRemoteAction,
						["Unit"] = arg[4],
						["Position"] = arg[5]["Position"],
						["Rotation"] = arg[5]["Rotation"],
						["cframe"] = LastRemote["Rotation"] + LastRemote["Position"],
					}
					print(#tbl)
					table.insert(Write, tbl)
				elseif  arg[3] == "Upgrade" or arg[3] == "Target" then
					local Position_Unit = UnitCF.Position
					local Ply_Money = stringtoNum(game.Players.LocalPlayer.PlayerGui.GameGui.Hotbar.Stats.Cash.Amount.Text)
					if Ply_Money >= stringtoNum(GetPrice()) then
						tbl = {
							["Action"] = LastRemoteAction,
							["Price"] = GetPrice(),
							["Stamp"] = Position_Unit,
							["cframe"] = UnitCF.CFrame,
							["Unit_Id"] = Unit_Ids,
							["Unit"] = UnitCF.parent.Name
						}
					end
					print(#tbl)
					table.insert(Write, tbl)
				elseif  arg[3] == "Sell" then
					local Position_Unit = UnitCF.Position
					tbl = {
						["Action"] = LastRemoteAction,
						["Price"] = GetPrice(),
						["Stamp"] = Position_Unit,
						["cframe"] = UnitCF.CFrame,
						["Unit_Id"] = Unit_Ids,
						["Unit"] = UnitCF.parent.Name
					}
					print(#tbl)
					table.insert(Write, tbl)
				end
				writeRecord()
			end
		end
	end
	return backs(...)
end
setreadonly(a, true)
------------------------------ Play Main Function
task.spawn(Plays)
task.spawn(AutoJfunc)
task.spawn(Hop, Toggles.Rejoins.Value , #game.Players:GetPlayers(), Options.MaxPlayers.Value)

if not game.Workspace:FindFirstChild("Elevators") then
	game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Difficulty", "Vote", Options.Difficulty.Value);
end
local Skipcount = 0 
task.spawn(function()
	while true do 
		wait(1)
		if Toggles.Skip.Value then
			game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Waves.Content.Yes.Visible = false
		end
	end	
end)
if not game.Workspace:FindFirstChild("Elevators") then
	game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Waves.Content.Yes.Changed:connect(function(a)
		if tostring(a) == "Visible"  and Toggles.Skip.Value then
			Skipcount = Skipcount + 1
			if Skipcount % 2 == 1 then
				game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Waves", "Skip")
			end
		end
	end)
	game:GetService("Players").LocalPlayer.PlayerGui.RoactGame.Rewards.content.gameOver.DescendantAdded:connect(function()
		if game:GetService("Players").LocalPlayer.PlayerGui.RoactGame.Rewards.content.gameOver.content.info.stats.duration.Text ~= "0 sec" and Toggles.RejoinsEnd.Value then
			print("Teleporting ...")
			while true do
				wait(10)
				game:GetService("TeleportService"):Teleport(3260590327, game.Players.LocalPlayer)
			end
		end
	end)
end
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
