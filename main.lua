local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AnthonHUB | Roba un Brainrot",
   LoadingTitle = "Iniciando Sistema...",
   LoadingSubtitle = "by Anthon",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AnthonHubData"
   }
})

local Tab = Window:CreateTab("Servidores", 4483345998) -- Icono de servidor

local targetServer = ""

Tab:CreateInput({
   Name = "ID del Servidor (JobId)",
   PlaceholderText = "Pega el JobId aquí...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       targetServer = Text
   end,
})

Tab:CreateButton({
   Name = "SPAM JOIN",
   Callback = function()
       local ts = game:GetService("TeleportService")
       local p = game.Players.LocalPlayer
       
       Rayfield:Notify({
          Title = "AnthonHUB",
          Content = "Intentando entrar al servidor...",
          Duration = 5
       })

       _G.Spamming = true
       while _G.Spamming do
           if targetServer ~= "" then
               ts:TeleportToPlaceInstance(game.PlaceId, targetServer, p)
           end
           task.wait(2.5) -- Tiempo de espera para no dar error
       end
   end,
})

local Tab2 = Window:CreateTab("Funciones Robo", 4483345998)

Tab2:CreateButton({
   Name = "AUTO-ROBAR (Imán)",
   Callback = function()
       Rayfield:Notify({
          Title = "AnthonHUB",
          Content = "Imán activado. Buscando Brainrots...",
          Duration = 5
       })
       
       task.spawn(function()
           while task.wait(0.1) do
               for _, v in pairs(workspace:GetChildren()) do
                   -- Busca herramientas o partes con interés de toque
                   if v:IsA("Tool") or (v:IsA("Part") and v:FindFirstChild("TouchInterest")) then
                       local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                       if root then
                           -- Simula que tocas el objeto para robarlo
                           firetouchinterest(root, v.Handle or v, 0)
                           firetouchinterest(root, v.Handle or v, 1)
                       end
                   end
               end
           end
       end)
   end,
})

Rayfield:Notify({
   Title = "AnthonHUB Cargado",
   Content = "Listo para entrar y robar.",
   Duration = 5
})
