local skynet = require "skynet"
local cluster = require "skynet.cluster"

local nodename = skynet.getenv("nodename")

skynet.start(function()
	local gate = skynet.newservice("gated")
	skynet.call(gate, "lua", "open" , {
		address = skynet.getenv "address",
		port = tonumber(skynet.getenv "port"),
		maxclient = tonumber(skynet.getenv "max_client"),
		nodelay = true,
		servername = "gated",
	})
	cluster.register("gated", gate)
	cluster.open(nodename)

	skynet.newservice("debug_console", 9301)
	skynet.newservice("console")
	skynet.exit()
end)
