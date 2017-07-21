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

-- return list of energy stores' objects
local function enumerateStores()
  local stores = component.list("ic2_te")
  local storesList
  local i = 1
  for addr, name in pairs(stores) do
    storesList[i] = component.proxy(addr)
    i = i + 1
  end
  return storesList
end

-- return an iterator over list of energy stores
function energy.stores()
  local storesList = enumerateStores()
  local i = 1
  return function
      return storesList[i]
  end
  i = i + 1
end

-- get a current energy level of the given store in percent
function energy.getEnergyPercentage(store)
  return  (store.getEnergy()/store.getCapacity()) * 100
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

-- for addr, name in pairs(energy.stores) do
--   energy.printInfo(addr, name)
-- end

return energy
