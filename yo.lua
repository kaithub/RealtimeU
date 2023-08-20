_G.Setup = _G.Setup or {}
local RealtimeU = _G.Setup

RealtimeU.request = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request

function RealtimeU:SaveFromJSON(JSONString, path, UID)
    if not _G.Setup == {} then
        local Response = RealtimeU.request({
            Url = _G.Setup["Link"].."/"..path..".json",
            Method = UID and "POST" or "PUT",
            Body = JSONString
        })
        return game:GetService("HttpService"):JSONDecode(Response)
    end
end

function RealtimeU:SaveFromTable(table, path, UID)
    if not _G.Setup == {} then
        local JSON = game:GetService("HttpService"):JSONEncode(table)
        return RealtimeU:SaveFromJSON(JSON, path, UID)
    end
end

function RealtimeU:SaveFromString(string, path, UID)
    if not _G.Setup == {} then
        local Response = RealtimeU.request({
            Url = _G.Setup["Link"].."/"..path..".json",
            Method = UID and "POST" or "PUT",
            Body = string
        })
        return game:GetService("HttpService"):JSONDecode(Response)
    end
end

function RealtimeU:GetFromPath(path, shallow)
    if not _G.Setup == {} then
        local Response = RealtimeU.request({
            Url = shallow and _G.Setup["Link"].."/"..path..".json?shallow=true" or _G.Setup["Link"].."/"..path..".json",
            Method = "GET"
        })
        return game:GetService("HttpService"):JSONDecode(Response)
    end
end

return RealtimeU