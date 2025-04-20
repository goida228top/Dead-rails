return function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")

    function collectBonds()
        local bondFolder = workspace:FindFirstChild("Bonds") or workspace:FindFirstChild("Облигации")
        if not bondFolder then return end

        for _, bond in ipairs(bondFolder:GetDescendants()) do
            if bond:IsA("ClickDetector") then
                -- Телепорт к облигации
                LocalPlayer.Character.HumanoidRootPart.CFrame = bond.Parent.CFrame + Vector3.new(0, 3, 0)
                wait(0.5)
                
                -- Авто-клик
                fireclickdetector(bond)
                wait(1)
            end
        end
    end

    -- Авто-ферма (с защитой от ошибок)
    while true do
        pcall(collectBonds)
        wait(5)
    end
end
