SendPacket(2,"action|input\ntext|`2Clear UnderSea Blast SC By `brockybandel")
Sleep(100)
function breakfarm(x, y)
pkt = {}
pkt.type = 3
pkt.value = 18
pkt.px = x
pkt.py = y
pkt.x = GetLocal().pos.x
pkt.y = GetLocal().pos.y
SendPacketRaw(false,pkt)
Sleep(150)
finds()
end


function finds() do
for _, tile in pairs(GetTiles()) do
if(tile.fg == 846) or (tile.fg == 5038) or (tile.fg == 1520) or (tile.fg == 1522) or (tile.fg == 832) or (tile.fg == 1538) or (tile.fg == 8252) or (tile.fg == 1536) or (tile.bg == 850 and tile.fg ~= 8) or (tile.bg == 8254) or (tile.bg == 1530) or (tile.bg == 8256)then
                      FindPath(tile.x, tile.y-2,300)
                      breakfarm(tile.x, tile.y)
                     break
           else
                  end
               end
           end
       end

finds()
