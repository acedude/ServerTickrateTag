Script.Load("lua/Server.lua")

function UpdateTickrateTag()
    local Tags = {}

    Server.GetTags(Tags)

    for i = 1, #Tags do
        local Tag = Tags[i]
        local Match = Tag:match("tickrate_(%d+)")

        if Tag and Match then
            Server.RemoveTag(Tag)
        end
    end

    Server.AddTag("tickrate_" .. ToString(math.floor(Server.GetFrameRate())))
end

Event.Hook("UpdateServer", UpdateTickrateTag)