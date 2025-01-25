--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Oyuncu ve GUI ayarlarÄ±
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "CustomGUI"

-- Ana Ã§erÃ§eve
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.4, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- BaÅlÄ±k
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
titleLabel.Text = "XXXOMER12345678 MenÃ¼"
titleLabel.TextScaled = true
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Parent = mainFrame

-- Buton oluÅturma fonksiyonu
local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0.1, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Text = name
    button.TextScaled = true
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Parent = mainFrame
    button.MouseButton1Click:Connect(callback)
end

-- 1. KJ ANÄ°MASYON
createButton("KJ ANÄ°MASYON", UDim2.new(0.05, 0, 0.15, 0), function()
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    local goal = {Position = UDim2.new(0.3, 0, 0.3, 0), BackgroundColor3 = Color3.fromRGB(0, 255, 255)}
    local tween = tweenService:Create(mainFrame, tweenInfo, goal)
    tween:Play()
end)

-- 2. GECE GÃNDÃZ LOOP
createButton("GECE GÃNDÃZ LOOP", UDim2.new(0.05, 0, 0.3, 0), function()
    local lighting = game:GetService("Lighting")
    while true do
        for i = 0, 24, 1 do
            lighting.ClockTime = i
            task.wait(0.1)
        end
    end
end)

-- 3. BOYUN BOZMA
createButton("BOYUN BOZMA", UDim2.new(0.05, 0, 0.45, 0), function()
    local lighting = game:GetService("Lighting")
    lighting.Brightness = 2
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Color = Color3.new(math.random(), math.random(), math.random())
        end
    end
end)

-- 4. SKYBOX
createButton("SKYBOX", UDim2.new(0.05, 0, 0.6, 0), function()
    local lighting = game:GetService("Lighting")
    local sky = Instance.new("Sky", lighting)
    sky.SkyboxBk = "rbxassetid://88903356810194"
    sky.SkyboxDn = "rbxassetid://88903356810194"
    sky.SkyboxFt = "rbxassetid://88903356810194"
    sky.SkyboxLf = "rbxassetid://88903356810194"
    sky.SkyboxRt = "rbxassetid://88903356810194"
    sky.SkyboxUp = "rbxassetid://88903356810194"
end)

-- 5. OYUNCU GLÄ°CH
createButton("OYUNCU GLÄ°CH", UDim2.new(0.05, 0, 0.75, 0), function()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local character = otherPlayer.Character
            if character then
                local weld = Instance.new("WeldConstraint")
                weld.Part0 = character:FindFirstChild("HumanoidRootPart")
                weld.Part1 = player.Character:FindFirstChild("HumanoidRootPart")
                weld.Parent = character
            end
        end
    end
end)

-- 6. OYUNCU GETÄ°R
createButton("OYUNCU GETÄ°R", UDim2.new(0.55, 0, 0.15, 0), function()
    local otherPlayers = game.Players:GetPlayers()
    local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
    if randomPlayer and randomPlayer.Character then
        local humanoidRoot = randomPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myHumanoidRoot = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRoot and myHumanoidRoot then
            humanoidRoot.CFrame = myHumanoidRoot.CFrame * CFrame.new(5, 0, 0)
        end
    end
end)-- 7. CEHENNEM V2
createButton("CEHENNEM V2", UDim2.new(0.55, 0, 0.3, 0), function()
    -- TÃ¼m modelleri sil
    for _, obj in pairs(workspace:GetChildren()) do
        if not obj:IsA("Terrain") and not obj:IsA("Player") then
            obj:Destroy()
        end
    end

    -- Yer tabakasÄ± oluÅtur
    local base = Instance.new("Part")
    base.Size = Vector3.new(500, 1, 500)
    base.Position = Vector3.new(0, 0, 0)
    base.Anchored = true
    base.Color = Color3.fromRGB(255, 0, 0)
    base.Parent = workspace

    -- SpawnPoint ayarla
    local spawnPoint = Instance.new("SpawnLocation")
    spawnPoint.Size = Vector3.new(10, 1, 10)
    spawnPoint.Position = Vector3.new(0, 1, 0)
    spawnPoint.Anchored = true
    spawnPoint.Parent = workspace

    -- OyuncularÄ± TP et
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            otherPlayer.Character.HumanoidRootPart.CFrame = spawnPoint.CFrame + Vector3.new(0, 5, 0)
        end
    end

    -- Hint mesajlarÄ±
    local hint = Instance.new("Hint")
    hint.Text = "XXXOMER12345678: CEHENNEME HOÅ GELDÄ°NÄ°Z MUAHAHAHAH"
    hint.Parent = workspace
    task.wait(8)
    hint.Text = "XXXOMER12345678: BURADAN ÃIKIÅ YOK! SADECE OYUNDAN ÃIKIÅ!"
    task.wait(1)
    hint.Text = "VOID IS KING AND XXXOMER12345678 IS KING"
    task.wait(2)
    hint:Destroy()
end)

-- 8. MEEPCÄ°TY BY MODS OMER
createButton("MEEPCÄ°TY BY MODS OMER", UDim2.new(0.55, 0, 0.45, 0), function()
    -- Ãstte yer tabakasÄ± oluÅtur
    local base = Instance.new("Part")
    base.Size = Vector3.new(500, 1, 500)
    base.Position = Vector3.new(0, 500, 0)
    base.Anchored = true
    base.Color = Color3.fromRGB(255, 0, 0)
    base.Parent = workspace

    -- SpawnPoint ayarla
    local spawnPoint = Instance.new("SpawnLocation")
    spawnPoint.Size = Vector3.new(10, 1, 10)
    spawnPoint.Position = Vector3.new(0, 501, 0)
    spawnPoint.Anchored = true
    spawnPoint.Parent = workspace

    -- OyuncularÄ± TP et
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            otherPlayer.Character.HumanoidRootPart.CFrame = spawnPoint.CFrame + Vector3.new(0, 5, 0)
        end
    end

    -- JumpScare ekle
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://7817341182"
    sound.Volume = 383883
    sound.PlaybackSpeed = 0.5
    sound.Looped = false
    sound.Parent = workspace
    sound:Play()

    local image = Instance.new("ImageLabel")
    image.Size = UDim2.new(1, 0, 1, 0)
    image.Image = "rbxassetid://111067913933127"
    image.BackgroundTransparency = 1
    image.Parent = screenGui
    task.wait(6)
    sound:Stop()
    image:Destroy()
end)

-- 9. OYUNCU KONTROL
createButton("OYUNCU KONTROL", UDim2.new(0.55, 0, 0.6, 0), function()
    local controlFrame = Instance.new("Frame")
    controlFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
    controlFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
    controlFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    controlFrame.Parent = screenGui

    -- Oyuncu adÄ± yazma alanÄ±
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.9, 0, 0.1, 0)
    textBox.Position = UDim2.new(0.05, 0, 0.1, 0)
    textBox.PlaceholderText = "Oyuncu AdÄ±nÄ± Yaz"
    textBox.Text = ""
    textBox.TextScaled = true
    textBox.Parent = controlFrame

    -- Alt iÅlevler iÃ§in butonlar
    local function createSubButton(name, position, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.9, 0, 0.1, 0)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.Text = name
        button.TextScaled = true
        button.Parent = controlFrame
        button.MouseButton1Click:Connect(callback)
    end

    createSubButton("ZÄ±pla Oyuncu", UDim2.new(0.05, 0, 0.25, 0), function()
        local playerName = textBox.Text
        local targetPlayer = game.Players:FindFirstChild(playerName)
        if targetPlayer and targetPlayer.Character then
            local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)

    createSubButton("Mesaj Yaz", UDim2.new(0.05, 0, 0.4, 0), function()
        local playerName = textBox.Text
        local targetPlayer = game.Players:FindFirstChild(playerName)
        if targetPlayer then
            targetPlayer:Kick("Merhaba! MesajÄ±nÄ±zÄ± yazabilirsiniz.")
        end
    end)

    createSubButton("YÃ¼rÃ¼me", UDim2.new(0.05, 0, 0.55, 0), function()
        local playerName = textBox.Text
        local targetPlayer = game.Players:FindFirstChild(playerName)
        if targetPlayer and targetPlayer.Character then
            local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 20
            end
        end
    end)

    createSubButton("Serbest BÄ±rak", UDim2.new(0.05, 0, 0.7, 0), function()
        local playerName = textBox.Text
        local targetPlayer = game.Players:FindFirstChild(playerName)
        if targetPlayer and targetPlayer.Character then
            local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16 -- VarsayÄ±lan hÄ±z
            end
        end
    end)
end)

-- 10. HÄ°NT
createButton("HÄ°NT", UDim2.new(0.55, 0, 0.75, 0), function()
    local hint = Instance.new("Hint")
    hint.Text = "XXXOMER12345678XXXOMER12345678XXXOMER12345678"
    hint.Parent = workspace
    task.wait(5)
    hint:Destroy()
end)-- 11. Buton: BOM BOM
local bomButton = createButton("BOM BOM", UDim2.new(0, 100, 0, 100), function()
    -- YukarÄ±dan blok dÃ¼ÅÃ¼rme
    local block = Instance.new("Part")
    block.Size = Vector3.new(4, 4, 4)
    block.Position = Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
    block.Anchored = true
    block.Parent = workspace
    game:GetService("TweenService"):Create(block, TweenInfo.new(2), {Position = Vector3.new(block.Position.X, 0, block.Position.Z)}):Play()

    -- Hint mesajÄ±
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("BOM BOM BOM GAMEEEEEE LOLLLLLLLLLL ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯", Enum.ChatColor.Blue)
end)

-- 12. Buton: REALM
local realmButton = createButton("REALM", UDim2.new(0, 100, 0, 200), function()
    -- Yere tabaka ekler
    local groundLayer = Instance.new("Part")
    groundLayer.Size = Vector3.new(200, 1, 200)
    groundLayer.Position = Vector3.new(0, -10, 0)
    groundLayer.Anchored = true
    groundLayer.Parent = workspace

    -- Kuru kafa ekler
    local skull = Instance.new("Model")
    local skullPart = Instance.new("Part")
    skullPart.Size = Vector3.new(4, 4, 4)
    skullPart.Shape = Enum.PartType.Ball
    skullPart.Position = Vector3.new(0, 10, 0)
    skullPart.Anchored = true
    skullPart.Parent = skull
    skull.Parent = workspace

    -- Spawnpoint oluÅturma
    local spawnPoint = Instance.new("SpawnLocation")
    spawnPoint.Position = Vector3.new(0, 5, 0)
    spawnPoint.Parent = workspace

    -- Hint mesajÄ±
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("XXXOMER12345678: MUAHHAHAHAHAHHAA", Enum.ChatColor.Blue)
    
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("BOM BOM BOM GAMEEEEEE LOLLLLLLLLLL ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯ð¤¯", Enum.ChatColor.Blue)

    -- YavaÅÃ§a blok ekle
    local block = Instance.new("Part")
    block.Size = Vector3.new(4, 4, 4)
    block.Position = Vector3.new(0, 50, 0)
    block.Anchored = true
    block.Parent = workspace
end)

-- 13. Buton: NUKE
local nukeButton = createButton("NUKE", UDim2.new(0, 100, 0, 300), function()
    -- Su sesi Ã§alar
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://15689453529"
    sound.Volume = 38383883838383
    sound.Parent = workspace
    sound:Play()

    -- Hint mesajÄ±
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("XXXOMER12345678 NUKE", Enum.ChatColor.Blue)

    -- DiÄer Hint mesajlarÄ±
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("XXXOMER12345678XXXOMER12345678XXXOMER12345678XXXOMER12345678XXXOMER12345678", Enum.ChatColor.Red)

    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("XXXOMER12345678 IS THE BEST I BEAT YOU ALL", Enum.ChatColor.Green)

    -- Oyunu karartma ve ateÅ efektleri
    wait(6)
    game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)  -- KaranlÄ±k yapar
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("XXXOMER12345678: 666", Enum.ChatColor.Red)

    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("MUAHHAHAHAHAHAHAHAHAH", Enum.ChatColor.Red)

    -- Glitch ve bozulma
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("GLÄ°CH EXE OLSUN", Enum.ChatColor.Blue)
    
    -- Karakter dÃ¶nÃ¼ÅÃ¼mÃ¼ ve su efekti
    local character = game.Players.LocalPlayer.Character
    local head = character:FindFirstChild("Head")
    if head then
        local waterImage = Instance.new("Decal")
        waterImage.Texture = "rbxassetid://133923025127249"
        waterImage.Parent = head
    end

    -- Blok yaÄmuru
    for i = 1, 10 do
        local rainBlock = Instance.new("Part")
        rainBlock.Size = Vector3.new(2, 2, 2)
        rainBlock.Position = Vector3.new(math.random(-50, 50), 50 + i * 5, math.random(-50, 50))
        rainBlock.Anchored = true
        rainBlock.Parent = workspace
    end
end)

-- 14. Buton: SUKUNA
local sukunaButton = createButton("SUKUNA", UDim2.new(0, 100, 0, 400), function()
    -- Su sesi Ã§alar
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://7817341182"
    sound.Volume = 3883833
    sound.Parent = workspace
    sound:Play()

    -- Hint mesajÄ±
    wait(2)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("XXXOMER12345678: :)", Enum.ChatColor.Green)

    -- Blok Ã§Ä±karma
    local block = Instance.new("Part")
    block.Size = Vector3.new(4, 4, 4)
    block.Position = Vector3.new(0, 50, 0)
    block.Anchored = true
    block.Parent = workspace

    -- Ä°Ã§indeki oyuncularÄ± Ã¶ldÃ¼rme
    wait(6)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            humanoid.Health = 0  -- Oyuncuyu Ã¶ldÃ¼rÃ¼r
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("AAAA", Enum.ChatColor.Red)
        end
    end

    -- DiÄer mesaj
    wait(6)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(",ð¯ð¯ð¯ð¯ð¯ð¯ð¯ð¯ð¯", Enum.ChatColor.Green)
end)

-- 15. Buton: DANS
local danceButton = createButton("DANS", UDim2.new(0, 100, 0, 500), function()
    -- TÃ¼m oyuncularÄ± yakÄ±na Ã§ekip dans ettirme
    local character = game.Players.LocalPlayer.Character
    local position = character.HumanoidRootPart.Position

    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(math.random(-5, 5), 0, math.random(-5, 5)))
            -- Dans animasyonu baÅlatmak iÃ§in doÄru animasyonu oynatmak gerekir
            -- Ãrnek: player.Character:WaitForChild("Humanoid"):LoadAnimation(danceAnim):Play()
        end
    end
end) 
