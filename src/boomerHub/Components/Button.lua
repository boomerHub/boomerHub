-- Fusion
local Fusion = require(script.Parent.Parent.Utils.Fusion);
local New = Fusion.New

local function Button(props)
    return New "TextButton" {
        BackgroundColor3 = props.BackgroundColor,
        AutoButtonColor = true,
        Text = props.Text
    }
end

return Button;