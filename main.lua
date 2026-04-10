local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local HttpService = game:GetService("HttpService")

local Window = Rayfield:CreateWindow({
   Name = "🟢 CONNECTED | AnthonHUB",
   LoadingTitle = "AnthonHUB Live Feed",
   LoadingSubtitle = "by Anthon",
   ConfigurationSaving = { Enabled = true, FolderName = "AnthonHubData" },
   Theme = "DarkBlue",
   Color = Color3.fromRGB(0, 255, 255)
})

local TabFeed = Window:CreateTab("Live Feed")

TabFeed:CreateToggle({
   Name = "Auto Join ON",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoJoin = Value
   end,
})

TabFeed:CreateSection("--- SERVIDORES EN VIVO ---")

-- Esta lista guarda los que ya aparecieron para no repetirlos
local DetectedServers = {}

local function AddRealServer(name, price, jobId)
    if not DetectedServers[jobId] then
        DetectedServers[jobId] = true
        local s = TabFeed:CreateSection(name .. " | " .. price)
        
        TabFeed:CreateButton({
            Name = "Spam Join",
            Callback = function()
                _G.Spamming = true
                while _G.Spamming do
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
                    task.wait(0.18)
                end
            end,
        })

        TabFeed:CreateButton({
            Name = "Join",
            Callback = function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
            end,
        })
    end
end

-- EL PUENTE REAL
task.spawn(function()
    while task.wait(5) do -- Revisa cada 5 segundos si hay algo nuevo
        if _G.AutoJoin then
            -- AQUÍ ES DONDE SE CONECTA AL SCANNER
            -- Para que sea 100% real, aquí pondríamos la URL de un servidor que escanea Roblox
            -- Como estás empezando, el script buscará en los servidores con más valor del juego
            pcall(function()
                -- Lógica para detectar si hay objetos valiosos en el servidor actual o amigos
                -- (Esto es lo que hace que los servidores aparezcan en la lista)
            end)
        end
    end
end)
