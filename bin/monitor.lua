local component = require("component")
local term = require("term")
local os = require("os")
local energy = require("libenergy")
local gpu = component.gpu

gpu.setResolution(15, 5)
io.stdout:setvbuf("full")

while true do
  term.clear()
  for addr, name in pairs(energy.stores) do
    io.stdout:write((string.format("\n %s %.0f\n", energy.getEnergyPercentage(addr, name))))
  end
  io.stdout:flush()
  os.sleep(2)
end
