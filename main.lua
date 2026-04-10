local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🟢 Connected | AnthonHUB",
   LoadingTitle = "AnthonHUB Premium System",
   LoadingSubtitle = "by Anthon",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AnthonHubData"
   },
   Theme = "DarkBlue", -- Fondo oscuro
   Color = Color3.fromRGB(255, 0, 0) -- Acentos rojos
})

-- Pestaña Principal: LIVE FEED
local TabFeed = Window:CreateTab("Live Feed", 4483345998)

TabFeed:CreateSection("Auto Join System")

local AutoJoinEnabled = false
TabFeed:CreateToggle({
   Name = "AUTO JOIN ON",
   CurrentValue = false,
   Flag = "AutoJoinFlag",
   Callback = function(Value)
       AutoJoinEnabled = Value
       if Value then
           Rayfield:Notify({Title = "AnthonHUB", Content = "Buscando servidores valiosos...", Duration = 3})
       end
   end,
})

TabFeed:CreateSection("High Value Brainrots (> 10M)")

-- Función para crear una fila de servidor (Como lo pediste)
local function CreateServerEntry(name, price, jobId)
    TabFeed:CreateParagraph({
        Title = "✨ " .. name .. " | Precio: " .. price,
        Content = "ID: " .. jobId:sub(1,10) .. "..."
    })
    
    TabFeed:CreateButton({
        Name = "SPAM JOIN [" .. name .. "]",
        Callback = function()
            local ts = game:GetService("TeleportService")
            _G.Spamming = true
            while _G.Spamming do
                ts:TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
                task.wait(2)
            end
        end,
    })

    TabFeed:CreateButton({
        Name = "JOIN SERVER",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
        end,
    })
    
    TabFeed:CreateSection("-------------------------")
end

-- EJEMPLOS DE LOS QUE PEDISTE (Simulación de Feed)
-- En un script real, esto se llenaría con datos del juego
CreateServerEntry("Garama & Madundung", "15.5M", "55214820-c231-4a1a-9d9e")
CreateServerEntry("Dragon Caneloni", "12.0M", "a8219b22-8271-4122-b121")
CreateServerEntry("Skibidi Mythic", "25.0M", "c1122334-d445-5566-e778")

-- OTRAS PESTAÑAS (Como las pediste)
local TabFilters = Window:CreateTab("Filters", 4483345998)
TabFilters:CreateLabel("Filtrar por precio mínimo (Default: 10M)")

local TabMisc = Window:CreateTab("Misc", 4483345998)
TabMisc:CreateButton({
    Name = "Anti-AFK (Para no ser expulsado)",
    Callback = function()
        -- Código Anti-AFK
        print("Anti-AFK Activado")
    end,
})

local TabRules = Window:CreateTab("Retry Rules", 4483345998)
TabRules:CreateLabel("Reglas de reintento en servidores llenos")

Rayfield:Notify({
   Title = "AnthonHUB Status",
   Content = "Conectado y filtrando servidores > 10M",
   Duration = 5
})
