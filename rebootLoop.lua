local rebootLoop = [[
term.setCursorPos(1, 1)
sleep(1)
os.reboot()
]]

-- Edit startup.lua
local file = fs.open("startup", "w")
file.write(rebootLoop)
file.close()
term.clear()
print("you've been infected reboot loop, your pc is gonna restart in 3 seconds and its going to be in reboot loop. craft a new pc")
sleep(3)
os.reboot()
