local m = require('component').modem
m.broadcast(12, "robot = require(\"robot\")")
m.broadcast(12, "computer = require(\"computer\")")
local function send_action(action) 
    m.broadcast(12, action.."()")
    print(action.."()")
end
local moves = {
    ["f"] = function () send_action("robot.forward") end,
    ["b"] = function () send_action("robot.back") end,
    ["l"] = function () send_action("robot.turnLeft") end,
    ["r"] = function () send_action("robot.turnRight") end,
    ["u"] = function () send_action("robot.up") end,
    ["d"] = function () send_action("robot.down") end,
    ["a"] = function () send_action("robot.turnAround") end
}
local function move(path, f)
    for i in string.gmatch(path, ".") do
        local step = i:lower()
        if step == "y" then
            f()
        else
            moves[step]()
        end
    end
end
