local skynet = require "skynet"
local cluster = require "skynet.cluster"

local nodename = skynet.getenv("nodename")

skynet.start(function()
	-- load_servermap()
	-- load_game_map()

	local gamed = skynet.uniqueservice("gamed")
	cluster.register("game", gamed)
	cluster.open(nodename)

	local idx = nodename:match("%a*(%d*)")
	local dbgc_port = 9200 + checkint(idx)
	skynet.newservice("debug_console", dbgc_port)
	skynet.newservice("console")
	skynet.exit()
end)

