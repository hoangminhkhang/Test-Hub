if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
	repeat wait()
		if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
			if _G.Team == "Pirate" then
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			elseif _G.Team == "Marine" then
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			else
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			end
		end
	until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end


local foldername = "Evo Hub"
local filename = "Kaitun Blox Fruit "..game.Players.LocalPlayer.Name.." Config.json"

function saveSettings()
	local HttpService = game:GetService("HttpService")
	local json = HttpService:JSONEncode(_G.AxcScript)
	if (writefile) then
		if isfolder(foldername) then
			if isfile(foldername.."\\"..filename) then
				writefile(foldername.."\\"..filename, json)
			else
				writefile(foldername.."\\"..filename, json)
			end
		else
			makefolder(foldername)
			writefile(foldername.."\\"..filename, json)
		end
	end
end

function loadSettings()
	local HttpService = game:GetService("HttpService")
	if isfile(foldername.."\\"..filename) then
		_G.AxcScript = HttpService:JSONDecode(readfile(foldername.."\\"..filename))
	end
end

loadSettings()

_G.AxcScript = {
	AutoFarm = true;
}

local CodeApi = loadstring(game:HttpGet('https://raw.githubusercontent.com/AXCScript/Src/main/CodeBloxFruit'))()

function Redeem(value)
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
end

local Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Yellow>Welcome "..game.Players.LocalPlayer.Name.." Evo Hub Premium Kaitub Wait Run Script <Color=/>"):Display()


function AutoHaki()
	if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
		print("Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
	end
end
function Click()
	local bc = game:GetService("VirtualUser")
	bc:CaptureController()
	bc:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
AutoHaki()

function TeleportTopos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/250, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 2000 then
    tween:Cancel()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
    tween:Cancel()
    _G.Clip = false
    end
    end

function TweentoMon(Pos)
	if game.Players.LocalPlayer.Character:FindFirstChild("Root") then
		game.Players.LocalPlayer.Character:FindFirstChild("Root"):Destroy()
	end
	TeleportTopos(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,Pos.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
	Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
	pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
	tween:Play()
	if Distance <= 250 then
		tween:Cancel()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
	end
	if _G.StopTween == true then
		tween:Cancel()
		_G.Clip = false
	end
end

function TweentoIsland(Pos)
    TeleportTopos(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,Pos.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
    local r = game:GetService("Players").LocalPlayer
    local xTweenPosition = {}
    if not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
        local K = Instance.new("Part",game.Players.LocalPlayer.Character) -- Create part
        K.Size = Vector3.new(14,1,14)
        K.Name = "Root"
        K.Anchored = true
        K.Transparency = 1
        K.BrickColor = BrickColor.new("Really blue")
        K.CanCollide = false
        K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,-4,0) --spawn at player
    end
    local Tween_Service = game:service"TweenService"
    local TweenPosition = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- diatance 
    local Magnitude=TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.Root.Position-Pos.Position).Magnitude/300,Enum.EasingStyle.Linear) -- Create Tween
    local function PartToPlayers() --teleport part to player
        game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
    
    local function PlayersToPart() -- teleport player to part
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.Root.CFrame
    end
    
    function xTweenPosition:Stop() --stop tween
            tween:Cancel()
        return tween
    end
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then 
        game.Players.LocalPlayer.Character.Humanoid.Sit = false 
    end
    if TweenPosition <= 10 then
        pcall(function()
            tween:Cancel()
            game.Players.LocalPlayer.Character.Root.CFrame = Pos
        end)
    end
    Tween = true
    spawn(function()
        pcall(function()
        while task.wait() do -- or RenderStepped
                if Tween then
                    PlayersToPart()
                if(game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1 then
                    PartToPlayers()
                end
                if Tween == false then
                    game.Players.LocalPlayer.Character:FindFirstChild("Root"):Destroy()
                end
                end
            end
        end)
    end)
    local tween,error = pcall(function()
        tween=Tween_Service:Create(
            game.Players.LocalPlayer.Character["Root"],Magnitude,{CFrame=Pos})
        tween:Play() 
    end)
    if not tween then return error end
    return xTweenPosition
    end

function CheckQuest()
	local Id = game.PlaceId
	local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
	if Id == 2753915549 then
		if Level == 1 or Level <= 9 then
			SkipTele = false
			Mon = "Bandit [Lv. 5]"
			MonPos = CFrame.new(1198.5999755859375, 38.06475830078125, 1543.47119140625)
			LQuest = 1
			NQuest = "BanditQuest1"
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
		elseif Level == 10 or Level <= 14 then
			Mon = "Monkey [Lv. 14]"
			MonPos = CFrame.new(-1403.5555419921875, 98.59825134277344, 90.24476623535156)
			LQuest = 1
			NQuest = "JungleQuest"
			NameMon = "Monkey"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 15 or Level <= 29 then
			Mon = "Gorilla [Lv. 20]"
			MonPos = CFrame.new(-1320.2811279296875, 81.85315704345703, -458.73248291015625)
			LQuest = 2
			NQuest = "JungleQuest"
			NameMon = "Gorilla"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 30 or Level <= 39 then
			Mon = "Pirate [Lv. 35]"
			MonPos = CFrame.new(-1140.37109375, 53.04805374145508, 3972.119384765625)
			LQuest = 1
			NQuest = "BuggyQuest1"
			NameMon = "Pirate"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 40 or Level <= 59 then
			Mon = "Brute [Lv. 45]"
			MonPos = CFrame.new(-1133.1185302734375, 94.3675537109375, 4307.36376953125)
			LQuest = 2
			NQuest = "BuggyQuest1"
			NameMon = "Brute"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 60 or Level <= 74 then
			Mon = "Desert Bandit [Lv. 60]"
			MonPos = CFrame.new(978.1805419921875, 21.926359176635742, 4407.97119140625)
			LQuest = 1
			NQuest = "DesertQuest"
			NameMon = "Desert Bandit"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
		elseif Level == 75 or Level <= 89 then
			Mon = "Desert Officer [Lv. 70]"
			MonPos = CFrame.new(1558.972900390625, 15.365246772766113, 4280.10302734375)
			LQuest = 2
			NQuest = "DesertQuest"
			NameMon = "Desert Officer"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
		elseif Level == 90 or Level <= 99 then
			Mon = "Snow Bandit [Lv. 90]"
			MonPos = CFrame.new(1352.8118896484375, 105.67132568359375, -1324.64697265625)
			LQuest = 1
			NQuest = "SnowQuest"
			NameMon = "Snow Bandit"
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
		elseif Level == 100 or Level <= 119 then
			Mon = "Snowman [Lv. 100]"
			MonsPos = CFrame.new(1201.8741455078125, 144.61459350585938, -1546.5943603515625)
			LQuest = 2
			NQuest = "SnowQuest"
			NameMon = "Snowman"
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
		elseif Level == 120 or Level <= 149 then
			Mon = "Chief Petty Officer [Lv. 120]"
			MonPos = CFrame.new(-4855.8466796875, 23.68708038330078, 4308.84814453125)
			LQuest = 1
			NQuest = "MarineQuest2"
			NameMon = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 150 or Level <= 174 then
			Mon = "Sky Bandit [Lv. 150]"
			MonPos = CFrame.new(-4951.14501953125, 295.77923583984375, -2899.656005859375)
			LQuest = 1
			NQuest = "SkyQuest"
			NameMon = "Sky Bandit"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 175 or Level <= 189 then
			Mon = "Dark Master [Lv. 175]"
			MonPos = CFrame.new(-5224.60107421875, 429.73699951171875, -2280.69677734375)
			LQuest = 2
			NQuest = "SkyQuest"
			NameMon = "Dark Master"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 190 or Level <= 209 then
			Mon = "Prisoner [Lv. 190]"
			MonsPos = CFrame.new(5285.59033203125, 88.68693542480469, 476.51483154296875)
			LQuest = 1
			NQuest = "PrisonerQuest"
			NameMon = "Prisoner"
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
		elseif Level == 210 or Level <= 249 then
			Mon = "Dangerous Prisoner [Lv. 210]"
			MonsPos = CFrame.new(5543.451171875, 88.6868896484375, 696.1821899414062)
			LQuest = 2
			NQuest = "PrisonerQuest"
			NameMon = "Dangerous Prisoner"
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
		elseif Level == 250 or Level <= 299 then
			Mon = "Toga Warrior [Lv. 250]"
			MonPos = CFrame.new(-1772.7384033203125, 38.839969635009766, -2745.384521484375)
			LQuest = 1
			NQuest = "ColosseumQuest"
			NameMon = "Toga Warrior"
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
                                --[[elseif Level == 275 or Level <= 299 then
                            Mon = "Gladiator [Lv. 275]"
                            MonPos = CFrame.new(-1283.224853515625, 7.567874908447266, -3253.5498046875)
                            LQuest = 2
                            NQuest = "ColosseumQuest"
                            NameMon = "Gladiator"
                            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
                                ]]
		elseif Level == 300 or Level <= 324 then
			Mon = "Military Soldier [Lv. 300]"
			MonPos = CFrame.new(-5410.20751953125, 11.10084342956543, 8456.4111328125)
			LQuest = 1
			NQuest = "MagmaQuest"
			NameMon = "Military Soldier"
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
		elseif Level == 325 or Level <= 374 then
			Mon = "Military Spy [Lv. 325]"
			MonPos = CFrame.new(-5800.2548828125, 98.19547271728516, 8781.802734375)
			LQuest = 2
			NQuest = "MagmaQuest"
			NameMon = "Military Spy"
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
		elseif Level == 375 or Level <= 399 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
			end
			SkipTele = true
			Mon = "Fishman Warrior [Lv. 375]"
			MonPos = CFrame.new(60890.0859375, 95.70665740966797, 1546.843017578125)
			LQuest = 1
			NQuest = "FishmanQuest"
			NameMon = "Fishman Warrior"
			CFrameQuest = CFrame.new(61119.890625, 18.50667381286621, 1567.489990234375)
		elseif Level == 400 or Level <= 449 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
			end
			SkipTele = true
			Mon = "Fishman Commando [Lv. 400]"
			MonPos = CFrame.new(61872.09765625, 75.50736999511719, 1403.5740966796875)
			LQuest = 2
			NQuest = "FishmanQuest"
			NameMon = "Fishman Commando"
			CFrameQuest = CFrame.new(61119.890625, 18.50667381286621, 1567.489990234375)
		elseif Level == 450 or Level <= 474 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(3864.53466796875, 5.4081878662109375, -1925.2999267578125)).Magnitude >= 17000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.53466796875, 5.4081878662109375, -1925.2999267578125))
			end
			SkipTele = true
			Mon = "God's Guard [Lv. 450]"
			MonPos = CFrame.new(-4627.390625, 866.9378051757812, -1945.0068359375)
			LQuest = 1
			NQuest = "SkyExp1Quest"
			NameMon = "God's Guard"
			CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
		elseif Level == 475 or Level <= 524 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
			end
			SkipTele = true
			Mon = "Shanda [Lv. 475]"
			MonPos = CFrame.new(-7685.2890625, 5567.029296875, -497.586181640625)
			LQuest = 2
			NQuest = "SkyExp1Quest"
			NameMon = "Shanda"
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
		elseif Level == 525 or Level <= 549 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
			end
			SkipTele = true
			Mon = "Royal Squad [Lv. 525]"
			MonPos = CFrame.new(-7647.44775390625, 5637.11572265625, -1416.885009765625)
			LQuest = 1
			NQuest = "SkyExp2Quest"
			NameMon = "Royal Squad"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 550 or Level <= 624 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
			end
			SkipTele = true
			Mon = "Royal Soldier [Lv. 550]"
			MonPos = CFrame.new(-7831.77197265625, 5622.3154296875, -1777.7586669921875)
			LQuest = 2
			NQuest = "SkyExp2Quest"
			NameMon = "Royal Soldier"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 625 or Level <= 649 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125)).Magnitude >= 10000 then
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
			end
			SkipTele = true
			Mon = "Galley Pirate [Lv. 625]"
			MonPos = CFrame.new(5634.70751953125, 95.40705108642578, 4037.620849609375)
			LQuest = 1
			NQuest = "FountainQuest"
			NameMon = "Galley Pirate"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
		elseif Level >= 650 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
			end
			SkipTele = true
			Mon = "Galley Captain [Lv. 650]"
			MonPos = CFrame.new(5687.47998046875, 43.858909606933594, 4886.95263671875)
			LQuest = 2
			NQuest = "FountainQuest"
			NameMon = "Galley Captain"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
		end
	elseif Id == 4442272183 then
		if Level == 700 or Level <= 724 then
			SkipTele = false
			Mon = "Raider [Lv. 700]"
			LQuest = 1
			NQuest = "Area1Quest"
			NameMon = "Raider"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			MonPos = CFrame.new(-746,39,2389)
		elseif Level == 725 or Level <= 774 then
			Mon = "Mercenary [Lv. 725]"
			LQuest = 2
			NQuest = "Area1Quest"
			NameMon = "Mercenary"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)	
                            --[[if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-950.9469604492188, 73.59642791748047, 1687.7239990234375)).Magnitude >= 200 then
                                --repeat task.wait()
                                    MonPos = CFrame.new(-950.9469604492188, 73.59642791748047, 1687.7239990234375)
                                --until (Vector3.new(-950.9469604492188, 73.59642791748047, 1687.7239990234375) - game.Players.LocalPlayer.Character.HumanoidRootPart).Magnitude <= 10
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1101.5570068359375, 73.59659576416016, 1155.75)).Magnitude >= 200 then
                                --repeat task.wait()
                                    MonPos = CFrame.new(-1101.5570068359375, 73.59659576416016, 1155.75)
                                --until (Vector3.new(-1101.5570068359375, 73.59659576416016, 1155.75) - game.Players.LocalPlayer.Character.HumanoidRootPart).Magnitude <= 10
                            end]]
			MonPos = CFrame.new(-874,141,1312)
		elseif Level == 775 or Level <= 874 then
			Mon = "Swan Pirate [Lv. 775]"
			MonPos = CFrame.new(879.0155029296875, 121.6172103881836, 1236.484619140625)
			LQuest = 1
			NQuest = "Area2Quest"
			NameMon = "Swan Pirate"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                                --[[elseif Level == 800 or Level <= 874 then
                            Mon = "Factory Staff [Lv. 800]"
                            MonPos = CFrame.new(-49.088504791259766, 149.4334259033203, -150.80809020996094)
                            NQuest = "Area2Quest"
                            LQuest = 2
                            NameMon = "Factory Staff"
                            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
                            ]]
		elseif Level == 875 or Level <= 899 then
			Mon = "Marine Lieutenant [Lv. 875]"
			MonPos = CFrame.new(-2846.595703125, 73.00115966796875, -2985.402099609375)
			LQuest = 1
			NQuest = "MarineQuest3"
			NameMon = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 900 or Level <= 949 then
			Mon = "Marine Captain [Lv. 900]"
			MonPos = CFrame.new(-1838.5380859375, 91.05396270751953, -3209.526611328125)
			LQuest = 2
			NQuest = "MarineQuest3"
			NameMon = "Marine Captain"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
		elseif Level == 950 or Level <= 974 then
			Mon = "Zombie [Lv. 950]"
			MonPos = CFrame.new(-5710, 126.0670166015625, -775)
			LQuest = 1
			NQuest = "ZombieQuest"
			NameMon = "Zombie"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
		elseif Level == 975 or Level <= 999 then
			Mon = "Vampire [Lv. 975]"
			MonPos = CFrame.new(-6037.7578125, 6.437739849090576, -1326.2755126953125)
			LQuest = 2
			NQuest = "ZombieQuest"
			NameMon = "Vampire"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
		elseif Level == 1000 or Level <= 1049 then
			Mon = "Snow Trooper [Lv. 1000]"
			MonPos = CFrame.new(609.858826, 400.119904, -5372.25928)
			LQuest = 1
			NQuest = "SnowMountainQuest"
			NameMon = "Snow Trooper"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
		elseif Level == 1050 or Level <= 1099 then
			Mon = "Winter Warrior [Lv. 1050]"
			MonPos = CFrame.new(1240.4923095703125, 460.9142761230469, -5192.29345703125)
			LQuest = 2
			NQuest = "SnowMountainQuest"
			NameMon = "Winter Warrior"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
		elseif Level == 1100 or Level <= 1124 then
			Mon = "Lab Subordinate [Lv. 1100]"
			MonPos = CFrame.new(-5780.4345703125, 42.55501174926758, -4482.74853515625)
			LQuest = 1
			NQuest = "IceSideQuest"
			NameMon = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
		elseif Level == 1125 or Level <= 1174 then
			Mon = "Horned Warrior [Lv. 1125]"
			MonPos = CFrame.new(-6349.41015625, 21.453861236572266, -5834.12841796875)
			LQuest = 2
			NQuest = "IceSideQuest"
			NameMon = "Horned Warrior"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
		elseif Level == 1175 or Level <= 1199 then
			Mon = "Magma Ninja [Lv. 1175]"
                            --[[if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5627.03662109375, 30.024616241455078, -5899.95654296875)).Magnitude >= 200 then
                                MonPos = CFrame.new(-5627.03662109375, 30.024616241455078, -5899.95654296875)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5275.21435546875, 39.44550704956055, -6133.7392578125)).Magnitude >= 200 then
                                MonPos = CFrame.new(-5275.21435546875, 39.44550704956055, -6133.7392578125)
                            end]]
			LQuest = 1
			NQuest = "FireSideQuest"
			NameMon = "Magma Ninja"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			MonPos = CFrame.new(-5428, 78, -5959)
		elseif Level == 1200 or Level <= 1249 then
			Mon = "Lava Pirate [Lv. 1200]"
			MonPos = CFrame.new(-5232.8466796875, 51.79249954223633, -4729.9609375)
			LQuest = 2
			NQuest = "FireSideQuest"
			NameMon = "Lava Pirate"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
		elseif Level == 1250 or Level <= 1274 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Deckhand [Lv. 1250]"
			MonPos = CFrame.new(1197.23583984375, 125.09214782714844, 33047.83984375)
			LQuest = 1
			NQuest = "ShipQuest1"
			NameMon = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
		elseif Level == 1275 or Level <= 1299 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Engineer [Lv. 1275]"
			MonPos = CFrame.new(922.4091186523438, 43.57904052734375, 32783.21875)
			LQuest = 2
			NQuest = "ShipQuest1"
			NameMon = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
		elseif Level == 1300 or Level <= 1324 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Steward [Lv. 1300]"
			MonPos = CFrame.new(918.0401000976562, 129.07810974121094, 33419.45703125)
			LQuest = 1
			NQuest = "ShipQuest2"
			NameMon = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
		elseif Level == 1325 or Level <= 1349 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1037.80127, 125.092171, 32911.6016)).Magnitude >= 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(1037.80127, 125.092171, 32911.6016))
			end
			Mon = "Ship Officer [Lv. 1325]"
			MonPos = CFrame.new(1188.7747802734375, 181.18414306640625, 33311.84765625)
			LQuest = 2
			NQuest = "ShipQuest2"
			NameMon = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
		elseif Level == 1350 or Level <= 1374 then
			Mon = "Arctic Warrior [Lv. 1350]"
			MonPos = CFrame.new(5984.4443359375, 59.70625686645508, -6170.4990234375)
			LQuest = 1
			NQuest = "FrostQuest"
			NameMon = "Arctic Warrior"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
		elseif Level == 1375 or Level <= 1424 then
			Mon = "Snow Lurker [Lv. 1375]"
			MonPos = CFrame.new(5656.3681640625, 43.96525573730469, -6785.47998046875)
			LQuest = 2
			NQuest = "FrostQuest"
			NameMon = "Snow Lurker"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
		elseif Level == 1425 or Level <= 1449 then
			Mon = "Sea Soldier [Lv. 1425]"
                            --[[if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-3201.64599609375, 35.59043884277344, -9796.525390625)).Magnitude >= 200 then
                                MonPos = CFrame.new(-3201.64599609375, 35.59043884277344, -9796.525390625)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-2766.245849609375, 46.5843505859375, -9836.3525390625)).Magnitude >= 200 then
                                MonPos = CFrame.new(-2766.245849609375, 46.5843505859375, -9836.3525390625)
                            end]]
			LQuest = 1
			NQuest = "ForgottenQuest"
			NameMon = "Sea Soldier"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			MonPos = CFrame.new(-3038, 15, -9720)
		elseif Level >= 1450 then
			SkipTele = false
			Mon = "Water Fighter [Lv. 1450]"
			MonPos = CFrame.new(-3286.5224609375, 252.3995819091797, -10515.396484375)
			LQuest = 2
			NQuest = "ForgottenQuest"
			NameMon = "Water Fighter"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
		end
	elseif Id == 7449423635 then
		if Level == 1500 or Level <= 1524 then
			if (CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 15000 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281)
			end
			SkipTele = true
			Mon = "Pirate Millionaire [Lv. 1500]"
			MonPos = CFrame.new(-292.1559753417969, 43.8282470703125, 5582.9287109375)
			LQuest = 1
			NQuest = "PiratePortQuest"
			NameMon = "Pirate Millionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 1525 or Level <= 1574 then
			if (CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 15000 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281)
			end
			SkipTele = true
			Mon = "Pistol Billionaire [Lv. 1525]"
			MonPos = CFrame.new(-315.38531494140625, 119.50130462646484, 6005.96630859375)
			LQuest = 2
			NQuest = "PiratePortQuest"
			NameMon = "Pistol Billionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
		elseif Level == 1575 or Level <= 1599 then
			if (CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 8000 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281)
			end
			SkipTele = true
			Mon = "Dragon Crew Warrior [Lv. 1575]"
			MonPos = CFrame.new(6414.8330078125, 121.43488311767578, -807.5617065429688)
			LQuest = 1
			NQuest = "AmazonQuest"
			NameMon = "Dragon Crew Warrior"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
		elseif Level == 1600 or Level <= 1624 then 
			if (CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 8000 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281)
			end
			SkipTele = true
			Mon = "Dragon Crew Archer [Lv. 1600]"
			MonPos = CFrame.new(6622.6787109375, 378.4330749511719, 182.57872009277344)
			NQuest = "AmazonQuest"
			LQuest = 2
			NameMon = "Dragon Crew Archer"
			CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
		elseif Level == 1625 or Level <= 1649 then
			if (CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 8000 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281)
			end
			SkipTele = true
			Mon = "Female Islander [Lv. 1625]"
			MonPos = CFrame.new(5719.08203125, 781.7914428710938, 871.026123046875)
			NQuest = "AmazonQuest2"
			LQuest = 1
			NameMon = "Female Islander"
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
		elseif Level == 1650 or Level <= 1699 then 
			if (CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 8000 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5742.3642578125, 611.947509765625, -281.8950500488281)
			end
			SkipTele = true
			Mon = "Giant Islander [Lv. 1650]"
			MonPos = CFrame.new(4937.7333984375, 604.96728515625, -237.5341796875)
			NQuest = "AmazonQuest2"
			LQuest = 2
			NameMon = "Giant Islander"
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
		elseif Level == 1700 or Level <= 1724 then
			SkipTele = false
			Mon = "Marine Commodore [Lv. 1700]"
			MonPos = CFrame.new(2394.572998046875, 121.98365020751953, -7600.91943359375)
			LQuest = 1
			NQuest = "MarineTreeIsland"
			NameMon = "Marine Commodore"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
		elseif Level == 1725 or Level <= 1774 then
			Mon = "Marine Rear Admiral [Lv. 1725]"
			MonPos = CFrame.new(3637.744873046875, 160.55908203125, -7037.28857421875)
			NameMon = "Marine Rear Admiral"
			NQuest = "MarineTreeIsland"
			LQuest = 2
			CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
		elseif Level == 1775 or Level <= 1799 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375)).Magnitude >= 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375))
			end
			SkipTele = true
			Mon = "Fishman Raider [Lv. 1775]"
			MonPos = CFrame.new(-10352.6923828125, 344.1450500488281, -8169.39111328125)
			LQuest = 1
			NQuest = "DeepForestIsland3"
			NameMon = "Fishman Raider"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
		elseif Level == 1800 or Level <= 1824 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375)).Magnitude >= 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375))
			end
			SkipTele = true
			Mon = "Fishman Captain [Lv. 1800]"
			MonPos = CFrame.new(-11087.44140625, 331.79766845703125, -8934.5576171875)
			LQuest = 2
			NQuest = "DeepForestIsland3"
			NameMon = "Fishman Captain"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
		elseif Level == 1825 or Level <= 1849 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375)).Magnitude >= 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375))
			end
			SkipTele = true
			Mon = "Forest Pirate [Lv. 1825]"
			MonPos = CFrame.new(-13241.498046875, 428.2030944824219, -7748.095703125)
			LQuest = 1
			NQuest = "DeepForestIsland"
			NameMon = "Forest Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
		elseif Level == 1850 or Level <= 1899 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375)).Magnitude >= 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375))
			end
			SkipTele = true
			Mon = "Mythological Pirate [Lv. 1850]"
			MonPos = CFrame.new(-13427.259765625, 511.83453369140625, -6943.66162109375)
			LQuest = 2
			NQuest = "DeepForestIsland"
			NameMon = "Mythological Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
		elseif Level == 1900 or Level <= 1924 then
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375)).Magnitude >= 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 473.94024658203, -7551.677734375))
			end
			SkipTele = true
			Mon = "Jungle Pirate [Lv. 1900]"
			MonPos = CFrame.new(-12113.16796875, 441.3117980957031, -10540.6298828125)
			LQuest = 1
			NQuest = "DeepForestIsland2"
			NameMon = "Jungle Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
		elseif Level == 1925 or Level <= 1974 then
			SkipTele = false
			Mon = "Musketeer Pirate [Lv. 1925]"
			MonPos = CFrame.new(-13249.8271484375, 496.2460632324219, -9584.373046875)
			LQuest = 2
			NQuest = "DeepForestIsland2"
			NameMon = "Musketeer Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
		elseif Level == 1975 or Level <= 1999 then
			Mon = "Reborn Skeleton [Lv. 1975]"
			MonPos = CFrame.new(-8766.345703125, 174.2373809814453, 6169.01513671875)
			LQuest = 1
			NQuest = "HauntedQuest1"
			NameMon = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 2000 or Level <= 2024 then
			Mon = "Living Zombie [Lv. 2000]"
			MonPos = CFrame.new(-9925.1884765625, 158.6781005859375, 6036.7314453125)
			LQuest = 2
			NQuest = "HauntedQuest1"
			NameMon = "Living Zombie"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
		elseif Level == 2025 or Level <= 2049 then
			Mon = "Demonic Soul [Lv. 2025]"
			MonPos = CFrame.new(-9542.6875, 272.1398010253906, 6249.53515625)
			LQuest = 1
			NQuest = "HauntedQuest2"
			NameMon = "Demonic Soul"
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
		elseif Level == 2050 or Level <= 2074 then
			Mon = "Posessed Mummy [Lv. 2050]"
			MonPos = CFrame.new(-9544.2744140625, 60.294342041015625, 6348.95849609375)
			LQuest = 2
			NQuest = "HauntedQuest2"
			NameMon = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2075 or Level <= 2099 then
			Mon = "Peanut Scout [Lv. 2075]"
			MonPos = CFrame.new(-2063.197021484375, 78.91095733642578, -10137.9287109375)
			LQuest = 1
			NQuest = "NutsIslandQuest"
			NameMon = "Peanut Scout"
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2100 or Level <= 2124 then
			Mon = "Peanut President [Lv. 2100]"
			MonPos = CFrame.new(-2133.56396484375, 70.31375885009766, -10523.0908203125)
			LQuest = 2
			NQuest = "NutsIslandQuest"
			NameMon = "Peanut President"
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2125 or Level <= 2149 then
			Mon = "Ice Cream Chef [Lv. 2125]"
			MonPos = CFrame.new(-893.8236083984375, 116.68982696533203, -10938.47265625)
			LQuest = 1
			NQuest = "IceCreamIslandQuest"
			NameMon = "Ice Cream Chef"
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2150 or Level <= 2199 then
			Mon = "Ice Cream Commander [Lv. 2150]"
			MonPos = CFrame.new(-585.1178588867188, 203.74639892578125, -11267.0107421875)
			LQuest = 2
			NQuest = "IceCreamIslandQuest"
			NameMon = "Ice Cream Commander"
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		elseif Level == 2200 or Level <= 2224 then
			Mon = "Cookie Crafter [Lv. 2200]"
			MonPos = CFrame.new(-2286.31103515625, 91.31655883789062, -12041.6884765625)
			LQuest = 1
			NQuest = "CakeQuest1"
			NameMon = "Cookie Crafter"
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
		elseif Level == 2225 or Level <= 2249 then
			Mon = "Cake Guard [Lv. 2225]"
			MonPos = CFrame.new(-1630.3675537109375, 195.69100952148438, -12275.96875)
			LQuest = 2
			NQuest = "CakeQuest1"
			NameMon = "Cake Guard"
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
		elseif Level == 2250 or Level <= 2274 then
			Mon = "Baking Staff [Lv. 2250]"
			MonPos = CFrame.new(-1824.580810546875, 95.08509826660156, -12891.3232421875)
			LQuest = 1
			NQuest = "CakeQuest2"
			NameMon = "Baking Staff"
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
		elseif Level == 2275 or Level <= 2299 then
			Mon = "Head Baker [Lv. 2275]"
			MonPos = CFrame.new(-2068.284912109375, 68.5050048828125, -12950.775390625)
			LQuest = 2
			NQuest = "CakeQuest2"
			NameMon = "Head Baker"
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
		elseif Level == 2300 or Level <= 2324 then
			Mon = "Cocoa Warrior [Lv. 2300]"
			MonPos = CFrame.new(43.3896598815918, 56.341636657714844, -12324.78515625)
			LQuest = 1
			NQuest = "ChocQuest1"
			NameMon = "Cocoa Warrior"
			CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
		elseif Level == 2325 or Level <= 2349 then
			Mon = "Chocolate Bar Battler [Lv. 2325]"
			MonPos = CFrame.new(719.6046752929688, 69.9678955078125, -12597.25390625)
			LQuest = 2
			NQuest = "ChocQuest1"
			NameMon = "Chocolate Bar Battler"
			CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
		elseif Level == 2350 or Level <= 2374 then
			Mon = "Sweet Thief [Lv. 2350]"
			MonPos = CFrame.new(155.99618530273438, 54.82904815673828, -12580.7265625)
			LQuest = 1
			NQuest = "ChocQuest2"
			NameMon = "Sweet Thief"
			CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
		elseif Level == 2375 or Level <= 2399 then
			Mon = "Candy Rebel [Lv. 2375]"
			MonPos = CFrame.new(-7.535787105560303, 35.526527404785156, -12896.34375)
			LQuest = 2
			NQuest = "ChocQuest2"
			NameMon = "Candy Rebel"
			CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
		elseif Level == 2400 or Level <= 2424 then
			Mon = "Candy Pirate [Lv. 2400]"
			MonPos = CFrame.new(-1393.447021484375, 13.819832801818848, -14419.154296875)
			LQuest = 1
			NQuest = "CandyQuest1"
			NameMon = "Candy Pirate"
			CFrameQuest = CFrame.new(-1147.6239013671875, 16.133047103881836, -14444.970703125)
		elseif Level <= 2450 then
			Mon = "Snow Demon [Lv. 2425]"
			MonPos = CFrame.new(-820.8795166015625, 49.07795715332031, -14329.525390625)
			LQuest = 2
			NQuest = "CandyQuest1"
			NameMon = "Snow Demon"
			CFrameQuest = CFrame.new(-1147.6239013671875, 16.133047103881836, -14444.970703125)
		end
	end
end


function EquipTool(ToolSe)
	if not _G.NotAutoEquip then
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.1)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
		end
	end
end
_G.AutoStatsMelee = true
spawn(function()
	while wait() do
		if _G.AutoStatsMelee then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",9999)
		end
	end
end)

function BringMob(name,CFrameMon)
	spawn(function()
		for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
			if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 400 then
				v.Humanoid.WalkSpeed = 0
				v.Humanoid.JumpPower = 0
				v.HumanoidRootPart.CanCollide = false
				v.Head.CanCollide = false
				v.HumanoidRootPart.CFrame = CFrameMon
				if v.Humanoid:FindFirstChild('Animator') then
					v.Humanoid.Animator:Destroy()
				end
				v.Humanoid:ChangeState(11)
				v.Humanoid:ChangeState(14)
				sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
			end
		end
	end)
end

local aP = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local aQ = getupvalues(aP)[2]
local aR = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local aS = getupvalues(aR)[2]
local aT = require(game.ReplicatedStorage.CombatFramework.RigLib)
local aU = tick()
local aV = require(game.ReplicatedStorage.Util.CameraShaker)
aV:Stop()

function CurrentWeapon()
	local ac = aQ.activeController
	local aW = ac.blades[1]
	if not aW then
		return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
	end
	pcall(
		function()
			while aW.Parent ~= game.Players.LocalPlayer.Character do
				aW = aW.Parent
			end
		end
	)
	if not aW then
		return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
	end
	return aW
end
function getAllBladeHitsPlayers(aX)
	Hits = {}
	local aY = game.Players.LocalPlayer
	local aZ = game:GetService("Workspace").Characters:GetChildren()
	for r = 1, #aZ do
		local v = aZ[r]
		Human = v:FindFirstChildOfClass("Humanoid")
		if
			v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and
			aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5
		then
			table.insert(Hits, Human.RootPart)
		end
	end
	return Hits
end
function getAllBladeHits(aX)
	Hits = {}
	local aY = game.Players.LocalPlayer
	local a_ = game:GetService("Workspace").Enemies:GetChildren()
	for r = 1, #a_ do
		local v = a_[r]
		Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5 then
			table.insert(Hits, Human.RootPart)
		end
	end
	return Hits
end
bo1 = 1
function AxcAttackFunction()
	if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
		return nil
	end
	local ac = aQ.activeController
	if ac and ac.equipped then
		for b0 = 1, 1 do
			local b2 =
				require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
			game.Players.LocalPlayer.Character,
			{game.Players.LocalPlayer.Character.HumanoidRootPart},
			60
			)
			if #b2 > 0 then
				local b3 = debug.getupvalue(ac.attack, 5)
				local b4 = debug.getupvalue(ac.attack, 6)
				local b5 = debug.getupvalue(ac.attack, 4)
				local b6 = debug.getupvalue(ac.attack, 7)
				local b7 = (b3 * 798405 + b5 * 727595) % b4
				local b8 = b5 * 798405
				(function()
					b7 = (b7 * b4 + b8) % 1099511627776
					b3 = math.floor(b7 / b4)
					b5 = b7 - b3 * b4
				end)()
				b6 = b6 + 1
				debug.setupvalue(ac.attack, 5, b3)
				debug.setupvalue(ac.attack, 6, b4)
				debug.setupvalue(ac.attack, 4, b5)
				debug.setupvalue(ac.attack, 7, b6)
				for k, v in pairs(ac.animator.anims.basic) do
					v:Play()
				end
				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
					"weaponChange",
					tostring(CurrentWeapon())
					)
					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(b7 / 1099511627776 * 16777215), b6)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", b2, 2, "")
				end
			end
		end
	end
end
for i,v in pairs(CodeApi) do
Redeem(v)
end

spawn(function()
	pcall(function()
		while wait() do
		game.ReplicatedStorage.Effect.Container.Death:Destroy()
		game.ReplicatedStorage.Effect.Container.Respawn:Destroy()
		game.ReplicatedStorage.Effect.Container.Hit:Destroy()
end
	end)
end)

FileGuiCore = game.CoreGui.TopBarApp

local Lib = {}
function Lib:CGui()
local RobloxGui1 = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local GradientRot = Instance.new("UIGradient")
local NameHub = Instance.new("TextLabel")
local NameHub_GradientRot = Instance.new("UIGradient")
local Function = Instance.new("TextLabel")
local Function_UIGra = Instance.new("UIGradient")
RobloxGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RobloxGui1.Name = "RobloxGui1"
RobloxGui1.Parent = FileGuiCore
Background.AutomaticSize = Enum.AutomaticSize.X
Background.BorderSizePixel = 0
Background.Size = UDim2.new(0, 350, 0, 60)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.Name = "Background"
Background.Position = UDim2.new(0.02, 0, 0.065, 0)
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.Parent = RobloxGui1
UICorner.Name = "UICorner"
UICorner.Parent = Background
UIStroke.Name = "UIStroke"
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Parent = Background
GradientRot.Name = "GradientRot"
GradientRot.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 41, 255)), ColorSequenceKeypoint.new(0.849741, Color3.fromRGB(220.591, 222.845, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) }
GradientRot.Parent = UIStroke
NameHub.BorderSizePixel = 0
NameHub.TextYAlignment = Enum.TextYAlignment.Top
NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameHub.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
NameHub.TextSize = 20
NameHub.Position = UDim2.new(0.0228571, 0, 0.0833333, 0)
NameHub.Size = UDim2.new(0, 295, 0, 50)
NameHub.Name = "NameHub"
NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
NameHub.Text = "Axc Script Kaitun Premium"
NameHub.BackgroundTransparency = 1
NameHub.TextXAlignment = Enum.TextXAlignment.Left
NameHub.Parent = Background
NameHub_GradientRot.Name = "NameHub_GradientRot"
NameHub_GradientRot.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 41, 255)), ColorSequenceKeypoint.new(0.146805, Color3.fromRGB(235.484, 236.763, 255)), ColorSequenceKeypoint.new(0.376511, Color3.fromRGB(38.3929, 52.5812, 255)), ColorSequenceKeypoint.new(0.734024, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.849741, Color3.fromRGB(220.591, 222.845, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) }
NameHub_GradientRot.Parent = NameHub
Function.BorderSizePixel = 0
Function.TextYAlignment = Enum.TextYAlignment.Top
Function.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Function.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Function.TextSize = 20
Function.Position = UDim2.new(0.0228571, 0, 0.533333, 0)
Function.Size = UDim2.new(0, 295, 0, 50)
Function.Name = "Function"
Function.TextColor3 = Color3.fromRGB(255, 255, 255)
Function.BorderColor3 = Color3.fromRGB(0, 0, 0)
Function.Text = "Function :"
Function.BackgroundTransparency = 1
Function.TextXAlignment = Enum.TextXAlignment.Left
Function.Parent = Background
Function_UIGra.Name = "Function_UIGra"
Function_UIGra.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 41, 255)), ColorSequenceKeypoint.new(0.146805, Color3.fromRGB(235.484, 236.763, 255)), ColorSequenceKeypoint.new(0.376511, Color3.fromRGB(38.3929, 52.5812, 255)), ColorSequenceKeypoint.new(0.734024, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.849741, Color3.fromRGB(220.591, 222.845, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) }
	Function_UIGra.Parent = Function
	FunctionTextSet = FileGuiCore.RobloxGui1.Background.Function
end

Lib:CGui()
spawn(function()
while wait(0.2) do
	AxcAttackFunction()
end
end)
function GetWeapon(bh)
    s = ""
    for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    return s
end

function EquipTool(ToolSe)
    if gggggg then
        return
    end
    if AxcWeapon == "" or AxcWeapon == nil then
        AxcWeapon = "Melee"
    end
    ToolSe = GetWeapon(AxcWeapon)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        NoClip = false
    end
end
function UnEquipTool(Toolse)
	if AxcWeapon == "" or AxcWeapon == nil then
        AxcWeapon = "Melee"
    end
	ToolSe = GetWeapon(AxcWeapon)
	local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
game:GetService("ReplicatedStorage"):WaitForChild("RigControllerEvent"):FireServer("unequipWeapon",bi)
end

spawn(function()
	while wait() do
	  if  Type == 1 then
		Farm = CFrame.new(0, 15, 15)
	  elseif  Type == 2 then
		Farm = CFrame.new(0, 100, 100)
	  end
	end
	end)
	
	
	Nonez = true
	spawn(function()
		while wait(7) do
			Type = 1
			wait(5)
			Type = 2
		end
	end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AxcScript.AutoFarmPlayer then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.AxcScript.AutoFarmPlayer then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                wait(.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
                        repeat wait()
                            AutoHaki()
                            EquipTool()
                            Tweento(v.HumanoidRootPart.CFrame * Farm)								
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until _G.AxcScript.AutoFarmPlayer == false or v.Humanoid.Health <= 0 or Levels > 150
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end
    end
end)

local Levels = game:GetService("Players").LocalPlayer.Data.Level.Value
task.spawn(function()
	while task.wait() do
		pcall(function()
				CheckQuest()
				if _G.AxcScript.AutoFarm and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				end
				if _G.AxcScript.AutoFarm and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					if Levels > 50 then
						_G.AxcScript.AutoFarmPlayer = true
						LevelFarm = false
						end
                    TweentoIsland(MonPos)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
				elseif LevelFarm and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					CheckQuest()
					if game.Workspace.Enemies:FindFirstChild(Mon) then
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Name == Mon and v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
								v.HumanoidRootPart.CanCollide = false
								v.Head.CanCollide = false
								AutoHaki()
								repeat task.wait()
									EquipTool()
									TweentoIsland(v.HumanoidRootPart.CFrame * Farm)
									BringMob(Mon,MonPos)
								until v.Humanoid.Health <= 0 or not v.Parent or not _G.AxcScript.AutoFarm or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
							end
						end
					else
						TweentoIsland(MonPos)
						UnEquipTool()
					end
					end
		end)
	end	
end)

while wait() do
	if _G.AxcScript.AutoFarm == true or LevelFarm == true then
		FunctionTextSet.Text = "Function : Auto Farm Level"
	elseif _G.AxcScript.AutoFarmPlayer == true then
		FunctionTextSet.Text = "Function : Auto Farm Player Hunter"
	else
		FunctionTextSet.Text = "Function : None"
	end
	end
