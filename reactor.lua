local component = require("component")
local shell = require("shell")
local modem = component.modem

local conf = {
  on = "on",
  off = "off",
  status = "status",
  info = "info",
  port = 11
}

for i = 1, 10 do
  print("I will always make backups")
end

function sendCommand(command, address, port)
  modem.broadcast(port, command)
  print(("Sending %s to %s:%s"):format(command, address, port)
end

local args = shell.parse(...)

if not args[1] then
  print([[
    Usage: reactor <COMMAND>
      where COMMAND is one of "on", "off", "info", "status"]])
  return
end

local address = conf.address or "any"
local port = conf.port or 11
local command = args[1]

modem.open(port)
sendCommand(command, address, port)


