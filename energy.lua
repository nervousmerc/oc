local component = require("component")
local stores = component.list("ic2_te")

local conf = {
  ic2_te_batbox = "BatBox",
  ic2_te_cesu = "CESU",
  ic2_te_mfe = "MFE",
  ic2_te_mfsu = "MFSU"

}

function printInfo(addr, name)
  local store = component.proxy(addr)
  print("------------")
  print("Address: ", addr)
  print("Type: ", conf[name])
  print("Energy stored: ", store.getEnergy())
  print("\tMax input : ", conf[store.getSourceTier()])
  print("\tMax output: ", conf[store.getSinkTier()])
  print("\tCapacity: ", store.getCapacity())
end

for addr, name in pairs(stores) do
  printInfo(addr, name)
end
