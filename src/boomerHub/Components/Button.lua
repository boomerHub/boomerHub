-- Fusion
local Packages = script.Parent.Parent.Packages;
local Fusion = require(Packages.fusion);
local New = Fusion.New;

local function Button(props)
    return New "TextButton" {
        BackgroundColor3 = props.BackgroundColor,
        AutoButtonColor = true,
        Text = props.Text
    }
end

return Button;