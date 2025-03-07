-- // Initialising the UI
local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/NecroxisTeam/Files/refs/heads/main/Roblox-UiLibrary-Modifed/Venyx-Modifed/Source.lua"))()
local UI = Venyx.new({
    title = "Venyx"
})

-- // Themes
local Themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}

-- // Test Page
local Test = UI:addPage({
    title = "Test",
    icon = 5012544693
})

-- // Sections for Test Page
local SectionA = Test:addSection({
    title = "Section A"
})
local SectionB = Test:addSection({
    title = "Section B"
})

-- // Section A UI Elements
SectionA:addToggle({
    title = "Toggle",
    callback = function(value)
        print("Toggled", value)
    end
})

SectionA:addButton({
    title = "Button",
    callback = function()
        print("Clicked")
    end
})

SectionA:addTextbox({
    title = "Notification",
    default = "Default",
    callback = function(value, focusLost)
        print("Input", value)

        if (focusLost) then
            UI:Notify({
                title = "Title",
                text = value
            })
        end
    end
})

-- // Section B UI Elements
SectionB:addKeybind({
    title = "Toggle Keybind",
    key = Enum.KeyCode.One,
    callback = function()
        print("Activated Keybind")
        UI:toggle()
    end,
    changedCallback = function(key)
        print("Changed Keybind", key)
    end
})

SectionB:addColorPicker({
    title = "ColorPicker",
    default = Color3.fromRGB(50, 50, 50)
})

SectionB:addColorPicker({
    title = "ColorPicker2"
})

SectionB:addSlider({
    title = "Slider",
    default = 0,
    min = -100,
    max = 100,
    callback = function(value)
        print("Dragged", value)
    end
})

local dropdownContent = {"Hello", "World", "Hello World", "Word", 1, 2, 3} -- // To save me from keep on doing this
SectionB:addDropdown({
    title = "Dropdown",
    list = dropdownContent
})

SectionB:addDropdown({
    title = "Dropdown",
    list = dropdownContent,
    callback = function(text)
        print("Selected", text)
    end
})

SectionB:addButton({
    title = "Button"
})

-- // Color Theme Customisation Page
local Theme = UI:addPage({
    title = "Theme",
    icon = 5012544693
})

-- // Section for the Color Theme Customisation Page
local Colors = Theme:addSection({
    title = "Colors"
})

-- // Adding a color picker for each type of theme customisable
for theme, color in pairs(Themes) do
    Colors:addColorPicker({
        title = theme,
        default = color,
        callback = function(color3)
            UI:setTheme({
                theme = theme, 
                color3 = color3
            })
        end
    })
end

-- // Load
UI:SelectPage({
    page = UI.pages[1], 
    toggle = true
})
