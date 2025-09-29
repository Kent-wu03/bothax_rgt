ids = 54
delay = 100

-- do not touch
sizex = 100
sizey = 60

function inv(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then return item.amount end
    end
    return 0
end

function placeb(x,y)
pkt = {}
pkt.type = 3
pkt.value = ids
pkt.px = x
pkt.py = y
pkt.x = GetLocal().pos.x
pkt.y = GetLocal().pos.y
SendPacketRaw(false,pkt)
Sleep(180)
end

for i = 1, 5 do
Sleep(200)
end

Sleep(1000)

for y = 0, sizey do
    for x = 0, sizex do
        local tiles = GetTile(x, y)

        if inv(ids) == 0 then
            local found = false
            for _, obj in pairs(GetObjectList()) do
                if obj.id == ids then
                    local itemx = math.floor(obj.pos.x / 32)
                    local itemy = math.floor(obj.pos.y / 32)
                    LogToConsole("`9Take block at X:`c" .. itemx .. " `9Y:`c" .. itemy)
                    FindPath(itemx, itemy, 500)
                    Sleep(500)
                    found = true
                    break
                end
            end
            if not found then
                LogToConsole("`4No block")
                Sleep(1000)
            end
        end

        if tiles and tiles.fg == 0 and inv(ids) > 0 then
            FindPath(x, y,500)
            Sleep(delay)
            placeb(x, y)
            Sleep(delay)
        end
    end
end
LogToConsole("`2Done place 1 world")
