local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- 1. Поиск и телепорт к облигациям
function collectBonds()
    local bondsFolder = workspace:FindFirstChild("Bonds") or workspace:FindFirstChild("Облигации")
    if not bondsFolder then return end

    for _, bond in ipairs(bondsFolder:GetDescendants()) do
        if bond:IsA("ClickDetector") then
            -- 2. Телепорт к облигации
            LocalPlayer.Character.HumanoidRootPart.CFrame = bond.Parent.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            
            -- 3. Авто-клик
            fireclickdetector(bond)
            wait(1)
        end
    end
end

-- 4. Бесконечный цикл сбора
while true do
    pcall(collectBonds) -- pcall для защиты от ошибок
    wait(5)
end
