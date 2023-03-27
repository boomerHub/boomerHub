-- CONFIGURATIONS
type env_type = 'prod' | 'dev'
local ENVIORNMENT: env_type = 'dev'

-- Services
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;

-- Packages
local Packages = script.Packages;
local Fusion = require(Packages.fusion);

-- Fusion
local Children = Fusion.Children;
local New = Fusion.New;
local Ref = Fusion.Ref;
local Value = Fusion.Value;

-- References
local WindowRef = Value();

-- Components
local TopBar = require(script.Components.Partials.TopBar)

local UI = New "ScreenGui" {
    Name = "boomerHub",
    [Children] = {
        New "Frame" {
            Size = UDim2.fromScale(0.5,0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(12, 12, 12),
            Transparency = 0,
            [Ref] = WindowRef,

            Name = "Window",
            [Children] = {
                TopBar {
                    Title = 'boomerHub',
                    WindowRef = WindowRef
                },
                New "UIAspectRatioConstraint" {
                    AspectRatio = 1.887
                }
            }
        }
    }
}

if (ENVIORNMENT == 'prod') then
    UI.Parent = syn.protect_gui(UI);
elseif (ENVIORNMENT == 'dev') then
    UI.Parent = LocalPlayer.PlayerGui;
end