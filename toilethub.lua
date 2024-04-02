local Window = Fluent:CreateWindow({
    --ai skid thì nhớ đổi tên =)
    --táo hub , aniee hub :>
    Title = "KgaHei Community / ",
    SubTitle = "Test Ver",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.End -- Used when theres no MinimizeKeybind
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main Farm", Icon = "home" }),
    Setting = Window:AddTab({ Title = "Setting Farming", Icon = "settings" }),
    Stats = Window:AddTab({ Title = "Stats", Icon = "plus-circle" }),
    Player = Window:AddTab({ Title = "Player", Icon = "baby" }),
    Teleport = Window:AddTab({ Title = "Travel", Icon = "palmtree" }),
    Fruit = Window:AddTab({ Title = "Devil Fruit", Icon = "cherry" }),
    Raid = Window:AddTab({ Title = "Raid", Icon = "swords" }),
    Race = Window:AddTab({ Title = "Race V4", Icon = "chevrons-right" }),
    Shop = Window:AddTab({ Title = "Buy Items", Icon = "shopping-cart" }),
	Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "list-plus" }),
    Hop = Window:AddTab({ Title = "Hop", Icon = "wifi" }),
}
local Options = Fluent.Options
do