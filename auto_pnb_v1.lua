ids = 4584
hit = 3

-- do not touch
pos = {}
ex = math.floor(GetLocal().pos.x / 32)
ey = math.floor(GetLocal().pos.y / 32)
startb = false
posc = 0

function logs(text)
	SendVariantList({[0] = 'OnTextOverlay',[1] = text})
end


function inv(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then return item.amount end
    end
    return 0
end

function breakb(x, y)
	pkt = {}
	pkt.type = 3
	pkt.value = 18
	pkt.px = x
	pkt.py = y
	pkt.x = GetLocal().pos.x
	pkt.y = GetLocal().pos.y
	SendPacketRaw(false,pkt)
	Sleep(180)
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

AddHook("onsendpacket", "sp", function(tipe, roki)
    if roki:find("/setup") then 
        SendVariantList({[0] = "OnDialogRequest", [1] = [[
set_default_color|`w
add_label_with_icon|small|`cPNB V1 GAUT|left|1438|
add_label_with_icon|small|`9Script by RockyBandel|left|2480|
add_spacer|small|
add_label_with_icon|small|`c1./pos `0- `5Set position (can more than 1)|left|340|
add_label_with_icon|small|`c2./start `0- `5Start script|left|428|
add_label_with_icon|small|`c2./stop `0- `5Stop script|left|430|
add_quick_exit|]]})
        return true
end
	
	if roki:find("/pos") then 
        table.insert(pos, {x = math.floor(GetLocal().pos.x / 32), y = math.floor(GetLocal().pos.y / 32)})
		logs("`9Set pos `cX`0:`5"..math.floor(GetLocal().pos.x / 32).." `cY`0:`5"..math.floor(GetLocal().pos.y / 32))
        return true
	end

	if roki:find("/start") then 
        startb = true
		logs("`2Start PNB")
        return true
	end

	if roki:find("/stop") then 
        startb = false
		logs("`4Stop PNB")
        return true
	end

return false
end)


logs("`9/setup `0- `2to setup")
while true do
    if startb and #pos > 0 then
        for i = 1, #pos do
            local p = pos[i]
            if inv(ids) > 0 then
                placeb(p.x, p.y)
				for i = 1,hit do
                	breakb(p.x, p.y)
					Sleep(50)
				end
            else
                logs("`4Habis ")
                startb = false
                break
            end
        end
    end
    Sleep(100)
end
