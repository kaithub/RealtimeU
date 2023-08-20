_G.Setup = loadstring(game:HttpGet("https://raw.githubusercontent.com/kaithub/RealtimeU/main/CS.lua")):CreateSetup("https://example.firebasedatabase.app")
local wrapper = loadstring(game:HttpGet("https://raw.githubusercontent.com/kaithub/RealtimeU/main/yo.lua"))
local change = {
  users = {
    alovelace = {
      name = "Ada Lovelace",
      contacts = {ghopper = true}
    },
    ghopper = {
      name = "George Hopper",
      contacts = {alovelace = true, eclarke = true}
    },
    eclarke = {
      name = "Eric Clarke",
      contacts = {ghopper = true}
    }
  }
}
local name = wrapper:SaveFromTable(change, "test", true).name
print(wrapper:GetFromPath("test/"..name.."/users/alovelace/name", true))