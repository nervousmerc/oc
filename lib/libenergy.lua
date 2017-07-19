local component = require("component")

local energy = {}

energy.stores = component.list("ic2_te")

energy.conf = {
  ic2_te_batbox = "BatBox",
  ic2_te_cesu = "CESU",
  ic2_te_mfe = "MFE",
  ic2_te_mfsu = "MFSU",
  [1] = 32,
  [2] = 128,
  [3] = 512,
  [4] = 2048,
  [5] = 8192
}

function energy.getEnergy(addr, name)
  local store = component.proxy(addr)
  return energy.conf[name], store.getEnergy()
end

function energy.getEnergyPercentage(addr, name)
  local store = component.proxy(addr)
  local percent = (store.getEnergy()/store.getCapacity()) * 100
  return energy.conf[name], percent
end

function energy.printInfo(addr, name)
  local store = component.proxy(addr)
  print("------------")
  print("Address: ", addr)
  print("Type: ", energy.conf[name])
  print("Energy stored: ", store.getEnergy())
  print("\tMax input: ", energy.conf[store.getSourceTier()])
  print("\tMax output: ", energy.conf[store.getSinkTier()])
  print("\tCapacity: ", store.getCapacity())
end

for addr, name in pairs(energy.stores) do
  energy.printInfo(addr, name)
end

return energy
