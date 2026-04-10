local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local HttpService = game:GetService("HttpService")

local Window = Rayfield:CreateWindow({
   Name = "🟢 CONNECTED | AnthonHUB",
   LoadingTitle = "AnthonHUB Live Feed System",
   LoadingSubtitle = "by Anthon",
   ConfigurationSaving = { Enabled = true, FolderName = "AnthonHubData" },
   Theme = "DarkBlue",
   Color = Color3.fromRGB(0, 255, 255) -- CELESTITO
})

local TabFeed = Window:CreateTab("Live Feed")
local TabFilters = Window:CreateTab("Filters")

TabFeed:CreateToggle({
   Name = "Auto Join ON",
   CurrentValue = false,
   Callback = function(Value)
       _G.Scanning = Value
       if Value then
           Rayfield:Notify({Title = "AnthonHUB", Content = "Esperando drops en vivo...", Duration = 3})
       end
   end,
})

TabFeed:CreateSection("--- SERVIDORES DETECTADOS ---")

-- Esta función crea la fila EN EL JUEGO cuando llega un dato
local function NuevaFilaEnJuego(nombre, precio, jobId)
    local Section = TabFeed:CreateSection(nombre)
    TabFeed:CreateLabel("Precio: " .. precio .. " | Detectado ahora mismo")
    
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

-- BUCLE QUE "ESCUCHA" PARA MOSTRAR EN EL JUEGO
task.spawn(function()
    while true do
        task.wait(1) -- Revisa cada segundo
        if _G.Scanning then
            -- AQUÍ ES DONDE APARECEN EN EL JUEGO
            -- Por ahora, como no tienes un bot mandando IDs reales, 
            -- te pongo una simulación para que veas que SÍ APARECEN EN EL JUEGO:
            
            if math.random(1, 100) > 98 then -- Simula que "cayó" uno
                NuevaFilaEnJuego("Brainrot Valioso Detectado", "850M", "ID-REAL-AQUÍ")
                Rayfield:Notify({Title = "¡NUEVO EN FEED!", Content = "Se añadió un servidor a la lista", Duration = 3})
            end
        end
    end
end)
