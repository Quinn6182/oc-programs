local data = require("component").data
local filesystem = require("filesystem")
print("What is the directory? ")
local dir = io.read()
print("Inflate or Deflate (i or d)? ")
local action = io.read()
local function list_dir(path, recursed)
    for i in filesystem.list(path) do
        if recursed then
            print(path..i)
        else
            print(path.."/"..i)
        end
        if filesystem.isDirectory(path.."/"..i) then
            list_dir(path.."/"..i, true)
        end
    end
end
list_dir(dir, false)