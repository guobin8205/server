local login = require "snax.loginserver"
local crypt = require "skynet.crypt"
local skynet = require "skynet"
local cluster = require "skynet.cluster"

local server = {
	host = "127.0.0.1",
	port = 8001,
	multilogin = false,	-- disallow multilogin
	name = "login_master",
}

local server_list = {}
local user_online = {}
local user_login = {}

function server.auth_handler(token)
	LOG_DEBUG("auth_handler token=%s", token)
	-- the token is base64(user)@base64(server):base64(password)
	local user, server, password = token:match("([^@]+)@([^:]+):(.+)")
	user = crypt.base64decode(user)
	server = crypt.base64decode(server)
	password = crypt.base64decode(password)
	assert(password == "password", "Invalid password")
	return server, user
end

function server.login_handler(server, uid, secret)
	LOG_DEBUG(string.format("%s@%s is login, secret is %s", server, uid, crypt.hexencode(secret)))
	local gameserver = assert(server_list[server], "Unknown server")
	-- only one can login, because disallow multilogin
	local last = user_online[uid]
	if last then
		skynet.call(last.address, "lua", "kick", uid, last.subid)
	end
	if user_online[uid] then
		error(string.format("user %s is already online", uid))
	end

	local gate = cluster.query(server, "gated")
	local gateserver = cluster.proxy(server, gate)

	local subid = tostring(skynet.call(gateserver, "lua", "login", uid, secret))
	user_online[uid] = { address = gateserver, subid = subid , server = server}
	return subid
end

local CMD = {}

function CMD.register_gate(server, address)
	LOG_DEBUG("register_gate server=%s,address=%s", server, address)
	server_list[server] = address
end

function CMD.logout(uid, subid)
	local u = user_online[uid]
	if u then
		print(string.format("%s@%s is logout", uid, u.server))
		user_online[uid] = nil
	end
end

function server.command_handler(command, ...)
	LOG_DEBUG("server.command_handler command=%s", command)
	local f = assert(CMD[command])
	return f(...)
end

login(server)