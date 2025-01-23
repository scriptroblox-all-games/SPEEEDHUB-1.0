local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1")

local Window = Library.CreateLib("SPEEEDHUB 1.0", "RJTheme3")

local Tab = Window:NewTab("Speed")

Section:NewSlider("Speed humanoid", "Speed", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump humanoid", "Speed", 500, 0, function(f) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = f
end)
