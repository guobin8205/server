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
			"./server/login/?.lua"

cluster = "./config/clustername.lua"
nodename = "$NODE_NAME"

lualoader = skynetroot .. "lualib/loader.lua"
preload = "./lualib/preload.lua"

cpath = skynetroot .. "cservice/?.so"

lua_path = skynetroot .. "lualib/?.lua;" ..
			"./server/login/?.lua;" ..
			"./lualib/?.lua;" ..
			"./protocol/?.lua;"..
			"./config/?.lua;"

lua_cpath = skynetroot .. "luaclib/?.so;" .. 
			"./luaclib/?.so"