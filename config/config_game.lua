skynetroot = "skynet/"
thread = 4
logger = "log"
logservice = "snlua"
logpath = "."
harbor = 0
start = "main"	-- main script
bootstrap = "snlua bootstrap"	-- The service for bootstrap

cluster = "./config/clustername.lua"
nodename = "$NODE_NAME"

snax = "./server/game/room/?.lua;" ..
		"./server/game/table/?.lua;"..
		"./server/database/?.lua;"

-- LUA服务所在位置
luaservice = skynetroot .. "service/?.lua;" ..
			"./luaservice/?.lua;" ..
			"./server/game/?.lua;" ..
			"./server/game/room/?.lua;" ..
			"./server/game/table/?.lua;"


-- 用于加载LUA服务的LUA代码
lualoader = skynetroot .. "lualib/loader.lua"
preload = "./lualib/preload.lua"

-- C编写的服务模块路径
cpath = skynetroot .. "cservice/?.so"

lua_path = skynetroot .. "lualib/?.lua;" ..
		   "./server/game/?.lua;" ..
		   "./server/game/logic/?.lua;" ..
		   "./server/game/logic-util/?.lua;" ..
		   "./server/game/room/?.lua;" ..
		   "./server/game/table/?.lua;" ..
		   "./lualib/?.lua;" ..
		   "./protocol/?.lua;"..
		   "./config/?.lua;"

lua_cpath = skynetroot .. "luaclib/?.so;" .. "./luaclib/?.so"