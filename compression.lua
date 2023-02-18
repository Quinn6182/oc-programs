local d = require("component").data
local filesystem = require("filesystem")
print("What is the directory? ")
local dir = io.read()
print("Inflate or Deflate (i or d)? ")
local action = io.read()
local function traverse_dir(path, recursed)
    for i in filesystem.list(path) do
        if recursed then
            print(path..i)
        else
            print(path.."/"..i)
        end
        if filesystem.isDirectory(path.."/"..i) then
            traverse_dir(path.."/"..i, true)
        end
        if filesystem.isDirectory(path.."/"..i) == false then
            f = io.open(path.."/"..i, 'r')
            data = f:read("*a")
            f:close()
            if action == "i" then
                f = io.open(path.."/"..i, 'w')
                f:write(d.inflate(data))
            elseif action == "d" then
                f = io.open(path.."/"..i, 'w')
                f:write(d.deflate(data))
            end
        end
    end
end
traverse_dir(dir, false)
