local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🟢 CONNECTED | AnthonHUB",
   LoadingTitle = "AnthonHUB Premium",
   LoadingSubtitle = "by Anthon",
   ConfigurationSaving = { Enabled = true, FolderName = "AnthonHubData" },
   Theme = "Light", -- Usaremos una base clara para personalizar el celeste
   Color = Color3.fromRGB(0, 255, 255) -- Color CELESTITO
})

-- PESTAÑAS (IGUAL A LA FOTO)
local TabFeed = Window:CreateTab("Live Feed")
local TabFilters = Window:CreateTab("Filters")
local TabMisc = Window:CreateTab("Misc")
local TabRules = Window:CreateTab("Retry Rules")

-- BOTÓN AUTO JOIN ON (COMO EN LA FOTO)
local AutoJoinEnabled = false
TabFeed:CreateToggle({
   Name = "Auto Join ON",
   CurrentValue = false,
   Callback = function(Value)
       AutoJoinEnabled = Value
       if Value then
           Rayfield:Notify({Title = "AnthonHUB", Content = "Escaneando servidores en vivo...", Duration = 3})
       end
   end,
})

TabFeed:CreateSection(" ") -- Espacio debajo del botón

-- FUNCIÓN PARA GENERAR UNA FILA CUANDO "CAE" UN BRAINROT
-- Esto es lo que aparecerá cuando el script detecte a alguien confundido
local function NewLiveDrop(brainrotName, price, jobId)
    local DropSection = TabFeed:CreateSection(brainrotName)
    
    TabFeed:CreateLabel("Precio: " .. price .. " | 1m ago")
    
    TabFeed:CreateButton({
        Name = "Spam Join",
        Callback = function()
            local ts = game:GetService("TeleportService")
            _G.Spamming = true
            while _G.Spamming do
                ts:TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
                task.wait(0.18) -- Delay igual al de la foto
            end
        end,
    })

    TabFeed:CreateButton({
        Name = "Join",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
        end,
    })
    
    TabFeed:CreateSection("-------------------------")
end

-- LÓGICA DE ESCANEO "EN VIVO"
-- Esto hace que el Feed esté vacío al inicio y solo aparezca algo cuando "cae"
task.spawn(function()
    while true do
        task.wait(math.random(10, 30)) -- Simula el tiempo en que alguien "se confunde"
        if AutoJoinEnabled then
            -- Aquí el script detectaría el error de otro jugador
            -- Por ahora te pongo este ejemplo que aparecerá solo si el Auto Join está ON
            NewLiveDrop("Garama and Madundung", "450M", "0000-1111-2222")
            Rayfield:Notify({Title = "¡ALERTA!", Content = "Nuevo Brainrot detectado en Live Feed", Duration = 5})
        end
    end
end)

-- PESTAÑA MISC PARA EL ROBO
TabMisc:CreateButton({
   Name = "Activar Imán (Para robar al entrar)",
   Callback = function()
       -- (Tu código de imán aquí)
   end,
})
