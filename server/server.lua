RegisterCommand(Config.Command, function(source, args, rawCommand)
    local src = source
    for _,v in pairs(Config.Jobs) do
        v.count = 0
        if Config.Framework == 'vorp' then
            for _, playerId in pairs(GetPlayers()) do
                TriggerEvent("vorp:getCharacter",playerId,function(user)
                    if user.job == v.job then v.count = v.count + 1 end
                end)
            end
            TriggerClientEvent('chat:addMessage', src, {
                color = {255, 0, 0},
                multiline = true,
                args = {Config.Locales.info, Config.Locales.currently..' '..v.count..' '..v.label..' '..Config.Locales.online}
            })
        elseif Config.Framework == 'redemrp' then
            for _, playerId in pairs(GetPlayers()) do
                TriggerEvent("redemrp:getPlayerFromId", playerId, function(user)
                    local job = user.getJob()
                    if job == v.job then v.count = v.count + 1 end
                end)
                TriggerClientEvent('chat:addMessage', src, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {Config.Locales.info, Config.Locales.currently..' '..v.count..' '..v.label..' '..Config.Locales.online}
                })
            end
        else
            print('Unknown framework selected in config!')
        end
    end
end, false)