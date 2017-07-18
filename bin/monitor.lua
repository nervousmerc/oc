local term = require("term")
local os = require("os")
local energy = require("libenergy")

while true do
  term.clear()
  for addr, name in pairs(energy.stores) do
    print(energy.getEnergy(addr, name))
  end
  os.sleep(2)
end
