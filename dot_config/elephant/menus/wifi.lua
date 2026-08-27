Name = "wifi"
NamePretty = "Wi-Fi"
Icon = "applications-other"
Cache = false
-- Action = "notify-send %VALUE%"
HideFromProviderlist = false
Description = "wifi selector"
SearchName = true

local walkerAskSsidCmd = [[ walker --dmenu -p "Enter SSID" --height 100 --width 400 -I]]
local walkerAskPasswordCmd = [[ walker -x -p "Enter Password" --height 100 --width 400 -I]]

--- @return string|nil
local function walkerAskSsid()
	local h = io.popen(walkerAskSsidCmd)
	if h == nil then
		return nil
	end
	local ssid = h:read("*l")
	h:close()
	return ssid
end

--- @return string
local function walkerAskPassword()
	local h = io.popen(walkerAskPasswordCmd)
	if h == nil then
		return ""
	end
	local pw = h:read("*l")
	h:close()
	return pw
end

--- @param ssid string
--- @param pw? string
local function connect(ssid, pw)
	local cmd = [[ nmcli dev wifi con ]] .. ssid
	if pw ~= "" then
		cmd = cmd .. "password " .. pw
	end
	os.execute(cmd)
end

function ManualConnect()
	local ssid = walkerAskSsid()
	if not ssid then
		return
	end
	local pw = walkerAskPassword()
	connect(ssid, pw)
end

--- @return boolean
local function wifiIsEnabled()
	local h = io.popen([[ nmcli -g WIFI g ]])
	if h == nil then
		return false
	end
	local output = h:read("*l") or "disabled"
	h:close()
	return (output == "enabled") or false
end

---@return string|nil
local function getCurrentConnection()
	local h = io.popen([[ LANGUAGE=C nmcli -g active,ssid dev wifi | awk -F: '$1 ~ /^yes/ {print $2}' ]])
	if h == nil then
		return nil
	end
	local output = h:read("*l")
	h:close()
	return output
end

---@return table
local function getKnownConnections()
	local cons = {}
	local h = io.popen([[ nmcli -g 'name' connection show ]])
	if h == nil then
		return cons
	end
	for line in h:lines() do
		cons[line] = true
	end
	h:close()
	return cons
end

---@param ssid string
---@param sec? string
---@param known? boolean
---@return string|nil
local function getConnectionCmd(ssid, sec, known)
	if known then
		return [[nmcli con up "]] .. ssid .. '"'
	end
	if sec and (sec:match("WPA2") or sec:match("WEP")) then
		return [[nmcli dev wifi con "]] .. ssid .. '" password "$(' .. walkerAskPasswordCmd .. ')"'
	end
	return [[nmcli dev wifi con "]] .. ssid .. '"'
end
function GetEntries()
	local entries = {}
	local knownCons = getKnownConnections()

	local h = io.popen([[ nmcli -g "SSID,SECURITY,SIGNAL" device wifi list | sed '/^:/d' ]])
	local currentConn = getCurrentConnection()
	-- toggle wifi entry
	local enabled = wifiIsEnabled()
	table.insert(entries, {
		Text = enabled and "Toggle Off" or "Toggle On",
		Value = enabled and "off" or "on",
		State = { "action" },
		Actions = { toggle = [[ nmcli radio wifi ]] .. "%VALUE%" },
	})
	table.insert(entries, {
		Text = "Manual",
		Value = "manual",
		State = { "action" },
		Actions = { manual_connect = "lua:ManualConnect" },
		-- Action = { connect = "notify-send connect" },
	})
	if h then
		for line in h:lines() do
			local ssid, sec, signal = line:match("^([^:]+):([^:]+):([^:]+)$")
			if ssid then
				local e = {
					Text = ssid,
					Subtext = "Strength: " .. signal .. " | Security: " .. sec,
					Value = ssid,
					State = {},
					Keywords = {},
					Actions = {},
				}
				local known = false
				if ssid == currentConn then
					known = true
					table.insert(e.State, "current")
					table.insert(e.Keywords, "current")
					table.insert(e.Keywords, "known")
					e.Subtext = e.Subtext .. " | Connected"
				elseif knownCons[ssid] then
					known = true
					table.insert(e.State, "known")
					table.insert(e.Keywords, "known")
					e.Subtext = e.Subtext .. " | Known connection"
				end

				e.Actions.connect = getConnectionCmd(ssid, sec, known)
				table.insert(entries, e)
			end
		end
		h:close()
	end

	return entries
end
