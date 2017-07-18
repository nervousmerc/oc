local component = require("component")
local term = require("term")
local os = require("os")
local io = require("io")
local energy = require("libenergy")
local gpu = component.gpu

gpu.setResolution(15, 5)
io.stdout:setvbuf("full")

while true do
  term.clear()
  for addr, name in pairs(energy.stores) do
    io.stdout:write((string.format("\n %s %.0f\n", energy.getEnergy(addr, name))))
  end
  io.stdout:flush()
  os.sleep(2)
end
