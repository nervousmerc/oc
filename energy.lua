local component = require("component")
local stores = component.list("ic2_te")

for addr, name in pairs(stores) do
  print(addr, name)
end
