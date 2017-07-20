local component = require("component")
local shell = require("shell")
local event = require("event")
local modem = component.modem

local conf = {
  on = "on",
  off = "off",
  status = "status",
  info = "info",
  timeout = 2,
  port = 11
}

for i = 1, 10 do
  print("I will always make backups")
end

function sendCommand(command, address, port)
  modem.broadcast(port, command)
  print(("Sending %s to %s:%s"):format(command, address, port))
end

function receiveResponse()

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

sendCommand(command, address, port)

if command == conf.info or command == conf.status then
  print('Waiting for response...')
  modem.open(port)
  response = table.pack(event.pull("modem_message", conf.timeout))
  print(response[6])
  print("done.")
  modem.close(port)
end

