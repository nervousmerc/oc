local component = require("component")
local term = require("term")
local os = require("os")
local energy = require("libenergy")
local gpu = component.gpu

gpu.setResolution(30, 10)

while true do
  term.clear()
  for addr, name in pairs(energy.stores) do
    print(string.format("%s %.0f", energy.getEnergy(addr, name)))
  end
  os.sleep(2)
end
