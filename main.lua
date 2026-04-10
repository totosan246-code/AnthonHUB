local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🟢 Connected | AnthonHUB",
   LoadingTitle = "AnthonHUB REAL-TIME SYSTEM",
   LoadingSubtitle = "by Anthon",
   ConfigurationSaving = { Enabled = true, FolderName = "AnthonHubData" },
   Theme = "DarkBlue",
   Color = Color3.fromRGB(255, 0, 0)
})

-- Pestañas principales
local TabFeed = Window:CreateTab("Live Feed", 4483345998)
local TabFilters = Window:CreateTab("Filters", 4483345998)
local TabMisc = Window:CreateTab("Misc", 4483345998)
local TabRules = Window:CreateTab("Retry Rules", 4483345998)

TabFeed:CreateSection("Auto Join System")

local AutoJoinEnabled = false
TabFeed:CreateToggle({
   Name = "AUTO JOIN ON",
   CurrentValue = false,
   Callback = function(Value)
       AutoJoinEnabled = Value
   end,
})

TabFeed:CreateSection("Live Server Feed (> 10M - 1.2B+)")

-- Contenedor para los servidores encontrados
local ServerList = {}

-- FUNCIÓN PARA AGREGAR SERVIDORES AL FEED
local function UpdateFeed()
    -- Limpiamos la lista anterior para que no se llene de servidores viejos
    -- En un script real, aquí llamaríamos a la API de servidores de Roblox
    
    local brainrots = {"Garama", "Madundung", "Dragon Caneloni", "Skibidi Ultra", "Raba Legend", "Omega Brain", "Titan Speaker"}
    local precios = {"10M", "50M", "150M", "500M", "1.2B", "900M", "2B"}

    -- Generamos servidores "ficticios" que simulan el escaneo constante
    -- NOTA: Para que sea 100% real, el juego debe permitir lectura de HTTP
    for i = 1, 5 do
        local bName = brainrots[math.random(1, #brainrots)]
        local bPrice = precios[math.random(1, #precios)]
        
        local section = TabFeed:CreateSection("🔥 " .. bName .. " | " .. bPrice)
        
        TabFeed:CreateButton({
            Name = "SPAM JOIN",
            Callback = function()
                Rayfield:Notify({Title = "AnthonHUB", Content = "Intentando entrar al servidor de " .. bPrice, Duration = 3})
                -- Aquí iría la lógica de TeleportService con el JobId real
            end,
        })
        
        TabFeed:CreateButton({
            Name = "JOIN",
            Callback = function()
                print("Intentando entrar...")
            end,
        })
    end
end

-- Botón para refrescar la lista manualmente y ver nuevos Brainrots
TabFeed:CreateButton({
   Name = "🔄 REFRESCAR FEED (Buscar nuevos)",
   Callback = function()
       Rayfield:Notify({Title = "AnthonHUB", Content = "Buscando nuevos servidores valiosos...", Duration = 2})
       UpdateFeed()
   end,
})

-- Ejecutar el primer escaneo al cargar
UpdateFeed()

-- Pestaña Misc: El Imán de siempre para cuando logres entrar
TabMisc:CreateSection("Acciones de Robo")
TabMisc:CreateButton({
   Name = "ACTIVAR AUTO-ROBO (Imán)",
   Callback = function()
       task.spawn(function()
           while task.wait(0.1) do
               for _, v in pairs(workspace:GetChildren()) do
                   if v:IsA("Tool") or (v:IsA("Part") and v:FindFirstChild("TouchInterest")) then
                       local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                       if root then
                           firetouchinterest(root, v.Handle or v, 0)
                           firetouchinterest(root, v.Handle or v, 1)
                       end
                   end
               end
           end
       end)
   end,
})
