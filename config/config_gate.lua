skynetroot = "skynet/"
thread = 4
logger = "log"
logservice = "snlua"
logpath = "."
harbor = 0
start = "main"
bootstrap = "snlua bootstrap"	-- The service for bootstrap
luaservice = skynetroot .. "service/?.lua;" ..
			"./luaservice/?.lua;"..
			"./server/gate/?.lua"

cluster = "./config/clustername.lua"
nodename = "$NODE_NAME"

lualoader = skynetroot .. "lualib/loader.lua"
preload = "./lualib/preload.lua"

cpath = skynetroot .. "cservice/?.so"

lua_path = skynetroot .. "lualib/?.lua;" ..
			"./server/gate/?.lua;" ..
			"./lualib/?.lua;" ..
			"./protocol/?.lua;"..
			"./config/?.lua;"

lua_cpath = skynetroot .. "luaclib/?.so;" .. 
			"./luaclib/?.so"

address = "0.0.0.0"
port = 7001

max_client = 1024