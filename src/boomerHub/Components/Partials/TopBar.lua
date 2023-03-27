-- Services
local UserInputService = game:GetService("UserInputService")

local Packages = script.Parent.Parent.Parent.Packages;

--// Fusion
local Fusion = require(Packages.fusion);
local New = Fusion.New;
local Children = Fusion.Children;
local OnEvent = Fusion.OnEvent;

local function TopBar(props)
    local Title: string = props.Title
    local dragging = false
    local dragStart = nil
    local startPos = nil

    local function endDrag(input)
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end

    local function startDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = props.WindowRef:get().Position
            input.Changed:Connect(endDrag)
        end
    end


    local function updateDrag(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            props.WindowRef:get().Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    return New "Frame" {
        Size = UDim2.fromScale(1, 0.08),
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),

        [Children] = {
            New "UIPadding" {
                PaddingBottom = UDim.new(0, 0.03),
                PaddingLeft = UDim.new(0, 0.1),
                PaddingTop = UDim.new(0, 0.03),
                PaddingRight = UDim.new(0, 0.1)
            },

            New "TextLabel" {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                Text = Title
            }
        },

        [OnEvent "InputBegan"] = startDrag,
        [OnEvent "InputChanged"] = updateDrag,
        [OnEvent "InputEnded"] = endDrag
    }
end

return TopBar;
