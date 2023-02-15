local data = require("component").data
local filesystem = require("filesystem")
print("What is the directory? ")
local dir = io.read()
print("Inflate or Deflate (i or d)? ")
local action = io.read()
for i in filesystem.list(dir) do
    print(i)
end