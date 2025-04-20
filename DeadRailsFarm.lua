return function()
    -- Создаем GUI
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Dead Rails Cheat", "Sentinel")

    -- Табы
    local FarmTab = Window:NewTab("Авто-ферма")
    local PlayerTab = Window:NewTab("Игрок")
    local MiscTab = Window:NewTab("Другое")

    -- Секции
    local FarmSection = FarmTab:NewSection("Сбор облигаций")
    local TeleportSection = PlayerTab:NewSection("Телепорт")
    local MiscSection = MiscTab:NewSection("Настройки")

    -- Переменные
    local AutoFarmEnabled = false
    local BondsFolder = workspace:FindFirstChild("Bonds") or workspace:FindFirstChild("Облигации")

    -- Функция сбора
    local function collectBonds()
        if not BondsFolder then return end
        
        for _, bond in ipairs(BondsFolder:GetDescendants()) do
            if bond:IsA("ClickDetector") and AutoFarmEnabled then
                -- Телепорт + клик
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = bond.Parent.CFrame + Vector3.new(0, 3, 0)
                wait(0.3)
                fireclickdetector(bond)
                wait(0.2)
            end
        end
    end

    -- Кнопки GUI
    FarmSection:NewToggle("Авто-ферма", "Собирает облигации", function(state)
        AutoFarmEnabled = state
        while AutoFarmEnabled do
            pcall(collectBonds)
            wait(1)
        end
    end)

    TeleportSection:NewButton("Телепорт к облигациям", "Быстрый сбор", function()
        pcall(collectBonds)
    end)

    MiscSection:NewSlider("Скорость", "Изменяет скорость", 250, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    MiscSection:NewKeybind("Закрыть GUI", "Прячет интерфейс", Enum.KeyCode.RightControl, function()
        Library:ToggleUI()
    end)

    -- Уведомление
    Library:Notify("Скрипт активирован!", 5)
end
