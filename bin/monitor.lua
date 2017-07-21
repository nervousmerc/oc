local component = require("component")
local term = require("term")
local os = require("os")
local energy = require("libenergy")
local gpu = component.gpu

gpu.setResolution(10, 5)
io.stdout:setvbuf("full")

while true do
  term.clear()
  for store in energy.stores() do
    io.stdout:write((string.format("\n %s %.0f%%\n",
                                   store.name,
                                   energy.getEnergyPercentage(store))))
  end
  io.stdout:flush()
  os.sleep(2)
end
