ids = 4584
delay = 100

-- do not touch
sizex = 100
sizey = 60
LogToConsole("Make by rockybandel")
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

for y = sizey % 1, sizey, 1 do
    for x = 0, sizex do
        local tiles = GetTile(x, y)
        if tiles.fg == 0 then
			FindPath(x, y)
            Sleep(delay)
            placeb(x, y)
            Sleep(delay)
        end
    end
end
LogToConsole("`2Done place 1 world")
