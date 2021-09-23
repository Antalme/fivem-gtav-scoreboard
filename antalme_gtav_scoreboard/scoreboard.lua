-- Simple table to declare players.
local players = {
	[1] = {
		id 		= 1,
		name 		= "Antalme",
		vehicle 	= "Nero Custom",
		totalTime 	= 182930,
		bestLap 	= 109293,
		rp 		= 16000,
		cash 		= 37000
	},
	[2] = {
		id 		= 2,
		name 		= "TEST",
		vehicle 	= "Nero",
		totalTime 	= 193958,
		bestLap 	= 106892,
		rp 		= 10000,
		cash 		= 25000
	},
	[3] = {
		id 		= 3,
		name 		= "TEST2",
		vehicle 	= "T20",
		totalTime 	= 218782,
		bestLap 	= 108297,
		rp		= 8000,
		cash 		= 1200
	},
	[4] = {
		id 		= 4,
		name 		= "TEST3",
		vehicle 	= "Zentorno",
		totalTime 	= 252583,
		bestLap 	= 102733,
		rp 		= 4500,
		cash 		= 5000
	}
}

-- Function to create Text's easily.
function CreateText_Scoreboard(text, x, y, h, w, r, g, b, a, align, font, minX, maxX, shadow)
	SetTextFont(font)
	SetTextColour(r, g, b, a)
	SetTextScale(h, w)
	SetTextJustification(align)
	SetTextWrap(minX, maxX)
	SetTextDropshadow(shadow, 0, 0, 0, 255)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

-- In order to see the results, this function must be called every frame.
-- Several variables doesn't need to be called each frame and can be located outside this function, but you could then be confused about what/when they are used for.
function ShowScoreboard()
	-- Big crosshair to help with the construction of the scoreboard
	--DrawRect(0.5, 0.5, 1.0, 0.01, 255, 255, 255, 255)
	--DrawRect(0.5, 0.5, 0.005, 1.0, 255, 255, 255, 255)

	local row_heigh 		= 0.03 -- Size of each row
	local row_margin		= 0.002 -- Margin between each row
	local rowVerticalSpace		= row_heigh + row_margin -- Final heigh space of each row, including the margin and the heigh of the row.
	local y_start_offset		= -0.1 -- Y offset of the entire scoreboard
	local y_start 			= 0.5 - rowVerticalSpace / 2 * (#players + 1) + y_start_offset -- Calculates where the scoreboard should start, because it depends on the number of players.
	local x_min			= 0.15 -- Margin left
	local x_max			= 0.85 -- Margin right
	local row_width			= x_max - x_min -- Final row width between left and right margins.

	-- Creates top-left race name and top-right finish position texts.
	local extraMarginBottom 	= 0.04 -- Extra margin like the real scoreboard
	local title_x			= x_min
	local title_y			= y_start + rowVerticalSpace * 1 - extraMarginBottom
	local position_x		= x_max
	local position_y		= y_start + rowVerticalSpace * 1 - extraMarginBottom
	local textSize			= 0.7
	CreateText_Scoreboard("Race name", title_x, title_y, textSize, textSize, 255, 255, 255, 255, 1, 4, 0.0, 1.0, 1)
	CreateText_Scoreboard("Final position", position_x, position_y, textSize, textSize, 255, 255, 255, 255, 2, 4, 0.0, x_max, 1)

	-- Creates header POSITION title rect.
	local headerPos_w		= row_width * 0.38 -- % of the total row size.
	local headerPos_x		= x_min + headerPos_w / 2
	local headerPos_y		= y_start + rowVerticalSpace * 2
	local headerPos_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerPos_x, headerPos_y, headerPos_w, row_heigh, headerPos_color.r, headerPos_color.g, headerPos_color.b, headerPos_color.a)
	CreateText_Scoreboard("POSITION", headerPos_x, headerPos_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates header VEHICLE title rect.
	local headerVeh_w		= row_width * 0.12 -- % of the total row size.
	local headerVeh_x		= x_min + headerPos_w + headerVeh_w / 2
	local headerVeh_y		= y_start + rowVerticalSpace * 2
	local headerVeh_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerVeh_x, headerVeh_y, headerPos_w, row_heigh, headerVeh_color.r, headerVeh_color.g, headerVeh_color.b, headerVeh_color.a)
	CreateText_Scoreboard("VEHICLE", headerVeh_x, headerVeh_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates header TOTAL TIME title rect.
	local headerTime_w		= row_width * 0.1 -- % of the total row size
	local headerTime_x		= x_min + headerPos_w + headerVeh_w + headerTime_w / 2
	local headerTime_y		= y_start + rowVerticalSpace * 2
	local headerTime_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerTime_x, headerTime_y, headerTime_w, row_heigh, headerTime_color.r, headerTime_color.g, headerTime_color.b, headerTime_color.a)
	CreateText_Scoreboard("TOTAL TIME", headerTime_x, headerTime_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates header BEST LAP title rect.
	local headerBest_w		= row_width * 0.1 -- % of the total row size
	local headerBest_x		= x_min + headerPos_w + headerVeh_w + headerTime_w + headerBest_w / 2
	local headerBest_y		= y_start + rowVerticalSpace * 2
	local headerBest_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerBest_x, headerBest_y, headerTime_w, row_heigh, headerBest_color.r, headerBest_color.g, headerBest_color.b, headerBest_color.a)
	CreateText_Scoreboard("BEST LAP", headerBest_x, headerBest_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates header RP title rect.
	local headerRp_w		= row_width * 0.1 -- % of the total row size
	local headerRp_x		= x_min + headerPos_w + headerVeh_w + headerTime_w + headerBest_w + headerRp_w / 2
	local headerRp_y		= y_start + rowVerticalSpace * 2
	local headerRp_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerRp_x, headerRp_y, headerTime_w, row_heigh, headerRp_color.r, headerRp_color.g, headerRp_color.b, headerRp_color.a)
	CreateText_Scoreboard("RP", headerRp_x, headerRp_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates header CASH title rect.
	local headerCash_w		= row_width * 0.1 -- % of the total row size
	local headerCash_x		= x_min + headerPos_w + headerVeh_w + headerTime_w + headerBest_w + headerRp_w + headerCash_w / 2
	local headerCash_y		= y_start + rowVerticalSpace * 2
	local headerCash_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerCash_x, headerCash_y, headerTime_w, row_heigh, headerCash_color.r, headerCash_color.g, headerCash_color.b, headerCash_color.a)
	CreateText_Scoreboard("CASH", headerCash_x, headerCash_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates header BETTING title rect.
	local headerBet_w		= row_width * 0.1 -- % of the total row size
	local headerBet_x		= x_min + headerPos_w + headerVeh_w + headerTime_w + headerBest_w + headerRp_w + headerCash_w + headerBet_w / 2
	local headerBet_y		= y_start + rowVerticalSpace * 2
	local headerBet_color		= {r = 250, g = 110, b = 200, a = 255}
	DrawRect(headerBet_x, headerBet_y, headerTime_w, row_heigh, headerBet_color.r, headerBet_color.g, headerBet_color.b, headerBet_color.a)
	CreateText_Scoreboard("BETTING", headerBet_x, headerBet_y - row_margin - 0.01, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

	-- Creates one row for each player.
	for i,player in ipairs(players) do
		local extraMarginTop = 0.01 -- Extra space between the header row and the players, like the real scoreboard.

		-- Creates player avatar background column (not the actual selfie image).
		local pAvatar_w		= row_width * 0.025 -- % of the total row size. This should be a fixed number calculated out of the row heigh.
		local pAvatar_x 	= x_min + pAvatar_w / 2
		local pAvatar_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local pAvatar_bg	= {r = 0, g = 0, b = 0, a = 255}
		local pAvatarText_y	= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(pAvatar_x, pAvatar_y, pAvatar_w, row_heigh, pAvatar_bg.r, pAvatar_bg.g, pAvatar_bg.b, pAvatar_bg.a)
		CreateText_Scoreboard(tostring(i), pAvatar_x, pAvatarText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

		-- Creates player left stripe rect column
		local pStripe_w		= row_width * 0.005 -- % of the total row size. This should be a fixed number calculated out of the row heigh too.
		local pStripe_x 	= x_min + pAvatar_w + pStripe_w / 2
		local pStripe_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local pStripe_bg	= {r = 255, g = 255, b = 255, a = 255}
		if GetPlayerServerId(PlayerId(-1)) == player.id then pStripe_bg = {r = 93, g = 182, b = 230, a = 255} else pStripe_bg = {r = 200, g = 100, b = 100, a = 200} end
		DrawRect(pStripe_x, pStripe_y, pStripe_w, row_heigh, pStripe_bg.r, pStripe_bg.g, pStripe_bg.b, pStripe_bg.a)

		-- Creates player name text and rect column
		local pNameRect_w	= row_width * 0.35 -- % of the total row size
		local pNameRect_x 	= x_min + pAvatar_w + pStripe_w + pNameRect_w / 2
		local pNameRect_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local pNameRect_bg	= {r = 255, g = 255, b = 255, a = 255}
		if GetPlayerServerId(PlayerId(-1)) == player.id then pNameRect_bg = {r = 93, g = 182, b = 230, a = 255} else pNameRect_bg = {r = 150, g = 50, b = 50, a = 150} end
		local pNameText_off = 0.002
		local pNameText_x	= x_min + pAvatar_w + pStripe_w + pNameText_off
		local pNameText_y	= y_start + rowVerticalSpace * (i+2) - (row_margin * 2)
		DrawRect(pNameRect_x, pNameRect_y, pNameRect_w, row_heigh, pNameRect_bg.r, pNameRect_bg.g, pNameRect_bg.b, pNameRect_bg.a)
		CreateText_Scoreboard(player.name, pNameText_x, pNameText_y, 0.4, 0.4, 255, 255, 255, 255, 1, 4, 0.0, 1.0, 0)

		-- Creates player vehicle text and rect column
		local carRect_w		= row_width * 0.12 -- % of the total row size
		local carRect_x 	= x_min + pAvatar_w + pStripe_w + pNameRect_w + carRect_w / 2
		local carRect_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local carRect_bg	= {r = 0, g = 0, b = 0, a = 150}
		local carText_y		= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(carRect_x, carRect_y, carRect_w, row_heigh, carRect_bg.r, carRect_bg.g, carRect_bg.b, carRect_bg.a)
		CreateText_Scoreboard(player.vehicle, carRect_x, carText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

		-- Creates total player time text and rect column
		local timeRect_w	= row_width * 0.1 -- % of the total row size
		local timeRect_x 	= x_min + pAvatar_w + pStripe_w + pNameRect_w + carRect_w + timeRect_w / 2
		local timeRect_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local timeRect_bg	= {r = 0, g = 0, b = 0, a = 150}
		local timeText_y	= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(timeRect_x, timeRect_y, timeRect_w, row_heigh, timeRect_bg.r, timeRect_bg.g, timeRect_bg.b, timeRect_bg.a)
		CreateText_Scoreboard(GetTimeAsString(player.totalTime), timeRect_x, timeText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

		-- Creates best player lap text and rect column
		local bestRect_w	= row_width * 0.1 -- % of the total row size
		local bestRect_x 	= x_min + pAvatar_w + pStripe_w + pNameRect_w + carRect_w + timeRect_w + bestRect_w / 2
		local bestRect_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local bestRect_bg	= {r = 0, g = 0, b = 0, a = 150}
		local bestText_y	= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(bestRect_x, bestRect_y, bestRect_w, row_heigh, bestRect_bg.r, bestRect_bg.g, bestRect_bg.b, bestRect_bg.a)
		CreateText_Scoreboard(GetTimeAsString(player.bestLap), bestRect_x, bestText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

		-- Creates player rp text and rect column
		local rpRect_w		= row_width * 0.1 -- % of the total row size
		local rpRect_x 		= x_min + pAvatar_w + pStripe_w + pNameRect_w + carRect_w + timeRect_w + bestRect_w + rpRect_w / 2
		local rpRect_y 		= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local rpRect_bg		= {r = 0, g = 0, b = 0, a = 150}
		local rpText_y		= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(rpRect_x, rpRect_y, rpRect_w, row_heigh, rpRect_bg.r, rpRect_bg.g, rpRect_bg.b, rpRect_bg.a)
		CreateText_Scoreboard(player.rp, rpRect_x, rpText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

		-- Creates player cash text and rect column
		local cashRect_w	= row_width * 0.1 -- % of the total row size
		local cashRect_x 	= x_min + pAvatar_w + pStripe_w + pNameRect_w + carRect_w + timeRect_w + bestRect_w + rpRect_w + cashRect_w / 2
		local cashRect_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local cashRect_bg	= {r = 0, g = 0, b = 0, a = 150}
		local cashText_y	= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(cashRect_x, cashRect_y, cashRect_w, row_heigh, cashRect_bg.r, cashRect_bg.g, cashRect_bg.b, cashRect_bg.a)
		CreateText_Scoreboard("$"..player.cash, cashRect_x, cashText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)

		-- Creates player betting text and rect column
		local betRect_w		= row_width * 0.1 -- % of the total row size
		local betRect_x 	= x_min + pAvatar_w + pStripe_w + pNameRect_w + carRect_w + timeRect_w + bestRect_w + rpRect_w + cashRect_w + betRect_w / 2
		local betRect_y 	= y_start + rowVerticalSpace * (i+2) + extraMarginTop
		local betRect_bg	= {r = 0, g = 0, b = 0, a = 150}
		local betText_y		= y_start + rowVerticalSpace * (i+2) - row_margin
		DrawRect(betRect_x, betRect_y, betRect_w, row_heigh, betRect_bg.r, betRect_bg.g, betRect_bg.b, betRect_bg.a)
		CreateText_Scoreboard("$0", betRect_x, betText_y, 0.3, 0.3, 255, 255, 255, 255, 0, 0, 0.0, 1.0, 0)
	end
end

Citizen.CreateThread(function()
	while true do -- Main loop
		Citizen.Wait(0)
		ShowScoreboard() -- Creates and draw the scoreboard.

		if IsControlJustReleased(0, 172) then -- Press "Up Arrow" key in your keyboar to insert a new player row filled with random values.
			table.insert(players, {
				name 		= "TestPlayer_" .. tostring(math.random(0, 1000000000)),
				vehicle 	= "Vehicle_" .. tostring(math.random(0, 1000000)),
				totalTime 	= math.random(25000, 50000),
				bestLap 	= math.random(10000, 25000),
				rp 		= math.random(0, 16000),
				cash 		= math.random(0, 100000)
			})
		end

		if IsControlJustReleased(0, 173) then -- Press "Down Arrow" key in your keyboard to remove the last row.
			table.remove(players, #players)
		end
	end
end)

