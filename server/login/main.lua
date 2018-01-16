local skynet = require "skynet"
local cluster = require "skynet.cluster"

local nodename = skynet.getenv("nodename")

skynet.start(function()
	local login = skynet.newservice("logind")
	cluster.register("logind", login)
	cluster.open(nodename)
end)
