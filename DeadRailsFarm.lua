return function()
    -- Проверка загрузки
    print("Версия скрипта: 1.0") 
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Успех!",
        Text = "Скрипт загружен",
        Duration = 3
    })
    
    -- Остальной код скрипта...
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    -- и т.д.
end
