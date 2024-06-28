-- Function to create GUI elements
local function createGameJoinerGUI()
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "GameJoinerGUI"
    gui.Parent = player.PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
    mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = gui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 20
    titleLabel.Text = "Game joiner - Join games in games!"
    titleLabel.Parent = mainFrame

    local gameIdTextBox = Instance.new("TextBox")
    gameIdTextBox.Size = UDim2.new(0.8, 0, 0.1, 0)
    gameIdTextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    gameIdTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    gameIdTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    gameIdTextBox.PlaceholderText = "Enter Game ID"
    gameIdTextBox.Font = Enum.Font.SourceSans
    gameIdTextBox.TextSize = 18
    gameIdTextBox.Parent = mainFrame

    local joinButton = Instance.new("TextButton")
    joinButton.Size = UDim2.new(0.6, 0, 0.1, 0)
    joinButton.Position = UDim2.new(0.2, 0, 0.45, 0)
    joinButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
    joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    joinButton.Font = Enum.Font.SourceSansBold
    joinButton.TextSize = 16
    joinButton.Text = "Join game!"
    joinButton.Parent = mainFrame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.9, 0, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 18
    closeButton.Text = "X"
    closeButton.Parent = mainFrame

    local confirmationFrame = Instance.new("Frame")
    confirmationFrame.Size = UDim2.new(0.3, 0, 0.3, 0)
    confirmationFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
    confirmationFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    confirmationFrame.BorderSizePixel = 0
    confirmationFrame.Visible = false
    confirmationFrame.Parent = gui

    local confirmLabel = Instance.new("TextLabel")
    confirmLabel.Size = UDim2.new(1, 0, 0.3, 0)
    confirmLabel.Position = UDim2.new(0, 0, 0, 0)
    confirmLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    confirmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmLabel.Font = Enum.Font.SourceSansBold
    confirmLabel.TextSize = 16
    confirmLabel.TextWrapped = true
    confirmLabel.Text = "Are you sure you want to join this game?"
    confirmLabel.Parent = confirmationFrame

    local yesButton = Instance.new("TextButton")
    yesButton.Size = UDim2.new(0.4, 0, 0.2, 0)
    yesButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    yesButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
    yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    yesButton.Font = Enum.Font.SourceSansBold
    yesButton.TextSize = 14
    yesButton.Text = "Yes"
    yesButton.Parent = confirmationFrame

    local noButton = Instance.new("TextButton")
    noButton.Size = UDim2.new(0.4, 0, 0.2, 0)
    noButton.Position = UDim2.new(0.5, 0, 0.7, 0)
    noButton.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    noButton.Font = Enum.Font.SourceSansBold
    noButton.TextSize = 14
    noButton.Text = "No"
    noButton.Parent = confirmationFrame

    -- Function to handle join button click
    local function onJoinButtonClicked()
        local gameId = tonumber(gameIdTextBox.Text)
        if gameId then
            -- Show confirmation dialog
            confirmationFrame.Visible = true
            -- Replace with actual game name retrieval logic
            local gameName = "Sample Game"  -- Replace with actual game name
            confirmLabel.Text = "Are you sure you want to join '" .. gameName .. "'?"
        else
            -- Handle invalid game ID input
            -- Optional: Provide feedback to the user
        end
    end

    -- Function to handle yes button click (to join game)
    local function onYesButtonClicked()
        local gameId = tonumber(gameIdTextBox.Text)
        if gameId then
            -- Teleport player to the game with gameId
            game:GetService("TeleportService"):Teleport(gameId)
        end
        confirmationFrame.Visible = false
    end

    -- Function to handle no button click (cancel)
    local function onNoButtonClicked()
        confirmationFrame.Visible = false
        -- Optionally clear the Game ID textbox or provide feedback
    end

    -- Function to handle close button click
    local function onCloseButtonClicked()
        gui:Destroy()
    end

    -- Connect button click events
    joinButton.MouseButton1Click:Connect(onJoinButtonClicked)
    yesButton.MouseButton1Click:Connect(onYesButtonClicked)
    noButton.MouseButton1Click:Connect(onNoButtonClicked)
    closeButton.MouseButton1Click:Connect(onCloseButtonClicked)

    -- Return GUI instance if needed
    return gui
end

-- Create the GUI
createGameJoinerGUI()
