local startupCode = [[
term.clear()
term.setCursorPos(1, 1)
print("InfectedOS 1.9")
print("lmao u ran a virus that only changes this")
print("it's not really a virus but yeah")
]]

-- Edit startup.lua
local file = fs.open("startup", "w")
file.write(startupCode)
file.close()

sleep(2)
os.reboot()