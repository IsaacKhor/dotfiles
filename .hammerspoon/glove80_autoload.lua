---
--- Autoload glove80 firmware
---

local function doubleQuote(str)
	return "\"" .. str .. "\""
end

local function getLatestGlove80Firmware()
	local latestFirmware = nil
	local latestCreationTime = 0

	for file in hs.fs.dir("~/Downloads") do
		if file:match("^.*uf2$") then
			-- print("Found firmware file: " .. file)
			local path = "~/Downloads/" .. file
			local attr = hs.fs.attributes(path)

			if attr.creation > latestCreationTime then
				latestCreationTime = attr.creation
				latestFirmware = file
			end
		end
	end

	return "~/Downloads/", latestFirmware
end

local function onUsbEvent(ev)
	if not (ev.vendorName == "MoErgo" and ev.eventType == "added" and ev.productID == 41) then
		return
	end

	print("Found Glove80 in bootloader mode")

	--- Get latest firmware file in ~/Downloads
	local prefix, latestFirmware = getLatestGlove80Firmware()
	if latestFirmware == nil then
		print("No firmware file found")
		return
	end

	print("Found latest firmware: " .. latestFirmware)

	-- volume not mounted yet, wait for a few seconds
	os.execute("sleep 5")

	-- Find which halve is connected
	local glove80path = nil
	if hs.fs.displayName("/Volumes/GLV80LHBOOT") ~= nil then
		glove80path = "/Volumes/GLV80LHBOOT/"
	elseif hs.fs.displayName("/Volumes/GLV80RHBOOT") ~= nil then
		glove80path = "/Volumes/GLV80RHBOOT/"
	else
		print("No Glove80 found")
		return
	end

	print("Found Glove80 at " .. glove80path)
	local command = "cp -X " .. prefix .. doubleQuote(latestFirmware) .. " " .. doubleQuote(glove80path)
	print("Running command: " .. command)

	os.execute(command)
end

-- hs.usb.watcher.new(onUsbEvent):start()