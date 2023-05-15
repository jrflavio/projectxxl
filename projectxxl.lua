local drops = workspace.Drops
local chest = workspace.Chests

local itemsToTP = {"Newspaper", "Eyeball", "Brain", "Silver Heart", "Red Gem", "One Star Dragonball", "Two Star Dragonball", "Three Star Dragonball", "Four Star Dragonball", "Five Star Dragonball", "Six Star Dragonball", "Seven Star Dragonball", "Super Saiyan", "Super Vegeta", "Sonido", "Flashstep", "Kaioken", "One For All: Prime", "Sunshine (Escanor)", "Lightning Dragon Slayer Magic"}

local function teleportToItems()
    local ichildren = drops:GetChildren()
    local validItems = {}
    for i, child in ipairs(ichildren) do
        if table.find(itemsToTP, child.Name) then
            table.insert(validItems, child)
        end
    end

    if #validItems > 0 then
        local randomIndex = math.random(1, #validItems)
        local randomItem = validItems[randomIndex]
        if randomItem.Handle and randomItem.Handle.Position then
            game.Players.LocalPlayer.Character:MoveTo(randomItem.Handle.Position)
        end
    else
        --warn("No valid items found")
    end
end

local function teleportToRandomChest()
    local children = chest:GetChildren()
    local validChests = {}
    for i, child in ipairs(children) do
        if child.Transparency < 1 then
            table.insert(validChests, child)
        end
    end
    if #validChests > 0 then
        local randomIndex = math.random(1, #validChests)
        local randomChest = validChests[randomIndex]
        game.Players.LocalPlayer.Character:MoveTo(randomChest.Position)
    else
        --warn("No valid chests found")
    end
end

while true do
    teleportToItems()
    wait(.25)
    teleportToRandomChest()
end
