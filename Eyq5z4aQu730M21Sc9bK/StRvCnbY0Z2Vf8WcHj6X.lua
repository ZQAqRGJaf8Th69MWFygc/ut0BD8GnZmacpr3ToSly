local Players = game:GetService('Players')
local MyPlayer = Players.LocalPlayer
local oldNameCall
oldNameCall = hookmetamethod(game, '__namecall', function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if self == MyPlayer and method:lower() == 'kick' and not checkcaller() then
        return
    elseif self.Name == 'Emotecs' and method == 'FireServer' and not checkcaller() then
        return
    elseif self.Name == 'shoot' and method == 'FireServer' and not checkcaller() then
        if IsRiptideCurve and args[21] then
            args[21] = args[21] * CurveMulti
        end
    return oldNameCall(self, unpack(args))
end)
getgenv().HMMLoaded = true
