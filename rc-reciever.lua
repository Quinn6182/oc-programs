local m = require("component").modem
local e = require("event")
m.open(12)
while true do
    local _, _, from, port, _, message = e.pull("modem_message")
    local func = load(message)
    if func then func() end
end