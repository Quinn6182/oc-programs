local data = require("component").data
local function list_dir()
    for i in filesystem.list("/") do
        print(i)
    end
end