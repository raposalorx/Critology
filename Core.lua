Critology = LibStub("AceAddon-3.0"):NewAddon("Critology", "AceConsole-3.0", "AceEvent-3.0")

local options = 
{
    name = "Critology",
    handler = Critology,
    type = 'group',
    args = 
	{
		recording =
		{
			type = 'group',
			name = 'recording',
			args = 
			{
	    		recordhit = 
				{
	        		type = "toggle",
	        		name = "Hits",
	        		desc = "Toggle the recording of max damage/heals",
	        		get = "GetRecordHit",
	        		set = "SetRecordHit",
				},
				recordcrit = 
				{
		        	type = "toggle",
		        	name = "Crits",
		        	desc = "Toggle the recording of max critical damage/heals",
		        	get = "GetRecordCrit",
		        	set = "SetRecordCrit",
				},
				recordtime = 
				{
		        	type = "toggle",
		        	name = "Time",
		        	desc = "Toggle the recording of time when you break a record",
		        	get = "GetRecordTime",
		        	set = "SetRecordTime",
				},
				recordname = 
				{
		        	type = "toggle",
		        	name = "Name",
		        	desc = "Toggle the recording of the name of the mob/player you break a record from",
		        	get = "GetRecordName",
		        	set = "SetRecordName",
				},
				recordavcrit = 
				{
		        	type = "toggle",
		        	name = "Average Crits",
		        	desc = "Toggle the recording of your average critical damgae/heals",
		        	get = "GetAvCrit",
		        	set = "SetAvCrit",
				},
				recordavhit = 
				{
		        	type = "toggle",
		        	name = "Average Hits",
		        	desc = "Toggle the recording of your average damage/heals",
		        	get = "GetAvHit",
		        	set = "SetAvHit",
				},
				critchance = 
				{
		        	type = "toggle",
		        	name = "Crit Chance",
		        	desc = "Toggle the calculation of a spells crit chance",
		        	get = "GetRCC",
		        	set = "SetRCC",
				},
			},
		},
		tooltip =
		{
			type = 'group',
			name = 'tooltip',
			args =
			{
				toolhit = 
				{
		        	type = "toggle",
		        	name = "Hits",
		        	desc = "Toggle the showing of max damage/heals in tooltips",
		        	get = "GetToolHit",
		        	set = "SetToolHit",
				},
				toolcrit = 
				{
		        	type = "toggle",
		        	name = "Crits",
		        	desc = "Toggle the showing of max critical damage/heals in tooltips",
		        	get = "GetToolCrit",
		        	set = "SetToolCrit",
				},
				tooltime = 
				{
		        	type = "toggle",
		        	name = "Time",
		        	desc = "Toggle the showing of a records time in tooltips",
		        	get = "GetToolTime",
		        	set = "SetToolTime",
				},
				toolname = 
				{
		        	type = "toggle",
		        	name = "Name",
		        	desc = "Toggle the showing of names in tooltips",
		        	get = "GetToolName",
		        	set = "SetToolName",
				},
				toolavcrit = 
				{
		        	type = "toggle",
		        	name = "Average Crits",
		        	desc = "Toggle the showing of average critical damage/heals in tooltips",
		        	get = "GetToolAvCrit",
		        	set = "SetToolAvCrit",
				},
				toolavhit = 
				{
		        	type = "toggle",
		        	name = "Average Hits",
		        	desc = "Toggle the showing of average damage/heals in tooltips",
		        	get = "GetToolAvHit",
		        	set = "SetToolAvHit",
				},
				toolchance = 
				{
		        	type = "toggle",
		        	name = "Crit Chance",
		        	desc = "Toggle the showing of a spells crit chance",
		        	get = "GetTCC",
		        	set = "SetTCC",
				},
			},
		},
		notification =
		{
			type = 'group',
			name = 'notification',
			args =
			{
				notifyhit = 
				{
		        	type = "toggle",
		        	name = "Hits",
		        	desc = "Toggle the Notification of damage/heal record breaks",
		        	get = "GetNotifyHit",
		        	set = "SetNotifyHit",
				},
				notifycrit = 
				{
		        	type = "toggle",
		        	name = "Crits",
		        	desc = "Toggle the Notification of critical damage/heal record breaks",
		        	get = "GetNotifyCrit",
		        	set = "SetNotifyCrit",
				},
				guinotifycrit = 
				{
		        	type = "toggle",
		        	name = "Graphical",
		        	desc = "Toggle the Notification of critical damage/heal record breaks graphically",
		        	get = "GetGUINotifyCrit",
		        	set = "SetGUINotifyCrit",
				},
			},
		},
		sharerecords =
		{
			type = 'group',
			name = 'share',
			args =
			{
				highparty = 
				{
		        	type = "toggle",
		        	name = "Party",
		        	desc = "Tell your party when you break a critical damage/heal record",
		        	get = "GetHighParty",
		        	set = "SetHighParty",
				},
				highguild = 
				{
		        	type = "toggle",
		        	name = "Guild",
		        	desc = "Tell your guild when you break a critical damage/heal record",
		        	get = "GetHighGuild",
		        	set = "SetHighGuild",
				},
			},
		},
		keepsake =
		{
			type = 'group',
			name = 'keepsakes',
			args =
			{
				critscreen = 
				{
		        	type = "toggle",
		        	name = "Screenshot on record crit",
		        	desc = "Toggle the taking of a screenshot when you break a crit record",
		        	get = "GetCritScreen",
		        	set = "SetCritScreen",
				},
			},
		},
    },
}

function Critology:GetRecordCrit(info)
    return self.db.profile.recordcrit
end
function Critology:SetRecordCrit(info, newValue)
    self.db.profile.recordcrit = newValue
	if(self.db.profile.recordcrit) then
		self:Print("Started recording max critical damage/heals")
	else
		self:Print("Stopped recording max critical damage/heals")
	end
end
function Critology:GetRecordHit(info)
    return self.db.profile.recordhit
end
function Critology:SetRecordHit(info, newValue)
    self.db.profile.recordhit = newValue
	if(self.db.profile.recordhit) then
		self:Print("Started recording max damage/heals")
	else
		self:Print("Stopped recording max damage/heals")
	end
end
function Critology:GetToolHit(info)
    return self.db.profile.toolhit
end
function Critology:SetToolHit(info, newValue)
    self.db.profile.toolhit = newValue
	if(self.db.profile.toolhit) then
		self:Print("Started displaying tooltips for damage/heal records")
	else
		self:Print("Stopped displaying tooltips for damage/heal records")
	end
end
function Critology:GetToolCrit(info)
    return self.db.profile.toolcrit
end
function Critology:SetToolCrit(info, newValue)
    self.db.profile.toolcrit = newValue
	if(self.db.profile.toolcrit) then
		self:Print("Started displaying tooltips for critical damage/heal records")
	else
		self:Print("Stopped displaying tooltips for critical damage/heal records")
	end
end
function Critology:GetNotifyHit(info)
    return self.db.profile.notifyhit
end
function Critology:SetNotifyHit(info, newValue)
    self.db.profile.notifyhit = newValue
	if(self.db.profile.notifyhit) then
		self:Print("Started telling you when you break a damage/heal record")
	else
		self:Print("Stopped telling you when you break a damage/heal record")
	end
end
function Critology:GetNotifyCrit(info)
    return self.db.profile.notifycrit
end
function Critology:SetNotifyCrit(info, newValue)
    self.db.profile.notifycrit = newValue
	if(self.db.profile.notifycrit) then
		self:Print("Started telling you when you break a crititical damage/heal record")
	else
		self:Print("Stopped telling you when you break a crititical damage/heal record")
	end
end
function Critology:GetGUINotifyCrit(info)
    return self.db.profile.guinotifycrit
end
function Critology:SetGUINotifyCrit(info, newValue)
    self.db.profile.guinotifycrit = newValue
	if(self.db.profile.guinotifycrit) then
		self:Print("Started telling you when you break a crit record graphically")
	else
		self:Print("Stopped telling you when you break a crit record graphically")
	end
end
function Critology:GetRecordTime(info)
    return self.db.profile.recordtime
end
function Critology:SetRecordTime(info, newValue)
    self.db.profile.recordtime = newValue
	if(self.db.profile.recordtime) then
		self:Print("Started recording the time when you break a record")
	else
		self:Print("Stopped recording the time when you break a record")
	end
end
function Critology:GetRecordName(info)
    return self.db.profile.recordname
end
function Critology:SetRecordName(info, newValue)
    self.db.profile.recordname = newValue
	if(self.db.profile.recordname) then
		self:Print("Started recording the name of the mob/player when you break a record")
	else
		self:Print("Stopped recording the name of the mob/player when you break a record")
	end
end
function Critology:GetToolTime(info)
    return self.db.profile.tooltime
end
function Critology:SetToolTime(info, newValue)
    self.db.profile.tooltime = newValue
	if(self.db.profile.tooltime) then
		self:Print("Started displaying the time of record breaks in tooltips")
	else
		self:Print("Stopped displaying the time of record breaks in tooltips")
	end
end
function Critology:GetToolName(info)
    return self.db.profile.toolname
end
function Critology:SetToolName(info, newValue)
    self.db.profile.toolname = newValue
	if(self.db.profile.toolname) then
		self:Print("Started displaying names in tooltips")
	else
		self:Print("Stopped displaying names in tooltips")
	end
end
function Critology:GetCritScreen(info)
    return self.db.profile.critscreen
end
function Critology:SetCritScreen(info, newValue)
    self.db.profile.critscreen = newValue
	if(self.db.profile.critscreen) then
		self:Print("Started taking screenshots when you break a crit record")
	else
		self:Print("Stopped taking screenshots when you break a crit record")
	end
end
function Critology:GetHighParty(info)
    return self.db.profile.highparty
end
function Critology:SetHighParty(info, newValue)
    self.db.profile.highparty = newValue
	if(self.db.profile.highparty) then
		self:Print("Started telling your party when you break a crit record")
	else
		self:Print("Stopped telling your party when you break a crit record")
	end
end
function Critology:GetHighGuild(info)
    return self.db.profile.highguild
end
function Critology:SetHighGuild(info, newValue)
    self.db.profile.highguild = newValue
	if(self.db.profile.highguild) then
		self:Print("Started telling your guild when you break a crit record")
	else
		self:Print("Stopped telling your guild when you break a crit record")
	end
end
function Critology:GetAvCrit(info)
    return self.db.profile.recordavcrit
end
function Critology:SetAvCrit(info, newValue)
    self.db.profile.recordavcrit = newValue
	if(self.db.profile.recordavcrit) then
		self:Print("Started recording average critical damage/heal values")
	else
		self:Print("Stopped recording average critical damage/heal values")
	end
end
function Critology:GetAvHit(info)
    return self.db.profile.recordavhit
end
function Critology:SetAvHit(info, newValue)
    self.db.profile.recordavhit = newValue
	if(self.db.profile.recordavhit) then
		self:Print("Started recording average damage/heal values")
	else
		self:Print("Stopped recording average damage/heal values")
	end
end
function Critology:GetToolAvCrit(info)
    return self.db.profile.toolavcrit
end
function Critology:SetToolAvCrit(info, newValue)
    self.db.profile.toolavcrit = newValue
	if(self.db.profile.toolavcrit) then
		self:Print("Started showing average critical damage/heal values")
	else
		self:Print("Stopped showing average critical damage/heal values")
	end
end
function Critology:GetToolAvHit(info)
    return self.db.profile.toolavhit
end
function Critology:SetToolAvHit(info, newValue)
    self.db.profile.toolavhit = newValue
	if(self.db.profile.toolavhit) then
		self:Print("Started showing average damage/heal values")
	else
		self:Print("Stopped showing average damage/heal values")
	end
end
function Critology:GetRCC(info)
    return self.db.profile.calccritchance
end
function Critology:SetRCC(info, newValue)
    self.db.profile.calccritchance = newValue
	if(self.db.profile.calccritchance) then
		self:Print("Started calculating historical crit chances")
	else
		self:Print("Stopped calculating historical crit chances")
	end
end
function Critology:GetTCC(info)
    return self.db.profile.toolcritchance
end
function Critology:SetTCC(info, newValue)
    self.db.profile.toolcritchance = newValue
	if(self.db.profile.toolcritchance) then
		self:Print("Started showing historical crit chances")
	else
		self:Print("Stopped showing historical crit chances")
	end
end

local defaults = 
{
    profile = 
	{
        recordcrit = true,
		recordhit = true,
		recordtime = true,
		recordname = true,
		toolcrit = true,
		toolhit = true,
		tooltime = true,
		toolname = true,
		notifycrit = true,
		notifyhit = false,
		guinotifycrit = true,
		critscreen = false,
		highparty = false,
		highguild = false,
		recordavcrit = true,
		recordavhit = true,
		toolavcrit = true,
		toolavhit = true,
		calccritchance = true,
		toolcritchance = true,
		hit = {},
		crit = {},
		whohit = {},
		whocrit = {},
		hittime = {},
		crittime = {},
		avcrit = {},
		numcrit = {},
		avhit = {},
		numhit = {},
    },
}

local optionsFrame

function Critology:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToFrame("Critology")
    else
        LibStub("AceConfigCmd-3.0").HandleCommand(Critology, "Critology", input)
    end
end

function Critology:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("CritologyDB", defaults)
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Critology", options)
	optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Critology", "Critology")
	self:RegisterChatCommand("critology", "ChatCommand")
end

function Critology:OnEnable()
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	local myhookspell = function(tooltip)
		local getspell = getglobal("GameTooltipTextLeft1")
		local spellname = getspell:GetText()
		
		--[[if(self.db.profile.hit[spellname]~=nil and self.db.profile.toolhit) then--if there are hit or crit records
			tooltip:AddLine(" ", 1, 1, 1)
			tooltip:AddLine("Critology:", 1, 1, 1)
		elseif(self.db.profile.crit[spellname]~=nil and self.db.profile.toolcrit) then--if if they want tooltips
			tooltip:AddLine(" ", 1, 1, 1)
			tooltip:AddLine("Critology:", 1, 1, 1)
		end--]]
		
		if(self.db.profile.hit[spellname]~=nil and self.db.profile.toolhit) then--if they want tooltips for hits
	   		tooltip:AddLine("Highest: " .. self.db.profile.hit[spellname], 0.6, 0.6, 0.6)
			if(self.db.profile.toolname) then--if they want the name
				tooltip:AddLine("   On: " .. self.db.profile.whohit[spellname], 0.6, 0.6, 0.6)
			end
			if(self.db.profile.tooltime) then--if they want the time
				tooltip:AddLine("   At: " .. date("%H:%M:%S %a %b %d %Y", self.db.profile.hittime[spellname]), 0.6, 0.6, 0.6)
			end
			if(self.db.profile.toolavhit and self.db.profile.avhit[spellname]~=nil) then--if they want hit average
				tooltip:AddLine("Average: " .. round(self.db.profile.avhit[spellname], 2), 0.6, 0.6, 0.6)
			end
		end
		if(self.db.profile.crit[spellname]~=nil and self.db.profile.toolcrit) then--if they want tooltips for crits
	   		tooltip:AddLine("Highest crit: " .. self.db.profile.crit[spellname], 6, 0, 0)
			if(self.db.profile.toolname) then--if they want the name
				tooltip:AddLine("   On: " .. self.db.profile.whocrit[spellname], 6, 0, 0)
			end
			if(self.db.profile.tooltime) then--if they want the time
				tooltip:AddLine("   At: " .. date("%H:%M:%S %a %b %d %Y", self.db.profile.crittime[spellname]), 6, 0, 0)
			end
			if(self.db.profile.toolavcrit and self.db.profile.avcrit[spellname]~=nil) then--if they want crit average
				tooltip:AddLine("Average: " .. round(self.db.profile.avcrit[spellname], 2), 6, 0, 0)
			end
			if(self.db.profile.toolcritchance and self.db.profile.numhit[spellname]~=nil and self.db.profile.numcrit[spellname]~=nil) then
				if(self.db.profile.numhit[spellname]==nil and self.db.profile.numcrit[spellname]~=nil) then
					tooltip:AddLine("Crit Chance: 100%", 6, 0, 0)
				elseif(self.db.profile.numhit[spellname]~=nil and self.db.profile.numcrit[spellname]==nil) then
					tooltip:AddLine("Crit Chance: 0%", 6, 0, 0)
				else
					tooltip:AddLine("Crit Chance: " .. round(self.db.profile.numcrit[spellname]/(self.db.profile.numhit[spellname]+self.db.profile.numcrit[spellname]), 2) .. "%", 6, 0, 0)
				end
			end
		end
	
	   	tooltip:Show()
	end
	
	--[[local myhookitem = function(tooltip)
		local item = getglobal("GameTooltipTextLeft")
		item = string.gsub(item, "Minor ", "")
		item = string.gsub(item, "Lesser ", "")
		if(self.db.profile.hit[item]~=nil) then
			tooltip:AddLine("Critology", 6, 0, 0)
		end-
		tooltip:AddLine(item, 1, 1, 1)
	   	tooltip:Show()
	end--]]
	
	if GameTooltip:GetScript("OnTooltipSetSpell") then
	   GameTooltip:HookScript("OnTooltipSetSpell", myhookspell)
	else
	   GameTooltip:SetScript("OnTooltipSetSpell", myhookspell)
	end
	--[[if GameTooltip:GetScript("OnTooltipSetItem") then
	   GameTooltip:HookScript("OnTooltipSetItem", myhookitem)
	else
	   GameTooltip:SetScript("OnTooltipSetItem", myhookitem)
	end--]]
	
end

function Critology:OnDisable()
end

function Critology:COMBAT_LOG_EVENT_UNFILTERED()
	local crit, damage, spell, name, time
	-- http://www.wowwiki.com/COMBAT_LOG_EVENT_Details
	if(arg5==0x0511) then--A friendly one of my chars who is both owned by a player and controlled as a player
		--[[if(arg2 == "SPELL_DAMAGE" or arg2 == "RANGE_DAMAGE" or arg2 == "SPELL_PERIODIC_DAMAGE") then
			if(arg17~=nil) then--if crit
				if(self.db.profile.recordcrit and arg12~=nil) then--if recordingcrits and there is damage
					if(self.db.profile.crit[arg10]~=nil) then--if there is a record
						if(self.db.profile.crit[arg10]<arg12) then--if this breaks the record
							self.db.profile.crit[arg10] = arg12
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.crittime[arg10] = arg1
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whocrit[arg10] = arg7
							end
							if(self.db.profile.notifycrit) then--if they want to be notified
								self:Print("New record crit damage with " .. arg10 .. " for: " .. arg12)
							end
							if(self.db.profile.guinotifycrit) then--if they want gui notification
								UIErrorsFrame:AddMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, 1.0, 0, 0, 10.0)
							end
							if(self.db.profile.critscreen) then--if they want screenshots
								Screenshot()
							end
							if(self.db.profile.highparty) then--if they want to tell party
								if(GetNumPartyMembers()>0) then--if they are in a party
									SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "PARTY");
								end
							end
							if(self.db.profile.highguild) then--if they want to tell guild
								if(IsInGuild()) then--if they are in a guild
									SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "GUILD");
								end
							end
						end
					else--no record
						self.db.profile.crit[arg10] = arg12
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.crittime[arg10] = arg1
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whocrit[arg10] = arg7
						end
						if(self.db.profile.notifycrit) then--if they want to be notified
							self:Print("New record crit damage with " .. arg10 .. " for: " .. arg12)
						end
						if(self.db.profile.guinotifycrit) then--if they want gui notification
							UIErrorsFrame:AddMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, 1.0, 0, 0, 10.0)
						end
						if(self.db.profile.critscreen) then--if they want screenshots
							Screenshot()
						end
						if(self.db.profile.highparty) then--if they want to tell party
							if(GetNumPartyMembers()>0) then--if they are in a party
								SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "PARTY");
							end
						end
						if(self.db.profile.highguild) then--if they want to tell guild
							if(IsInGuild()) then--if they are in a guild
								SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "GUILD");
							end
						end
					end
				end
				if(self.db.profile.recordavcrit) then--if they want average crit
					if(self.db.profile.numcrit[arg10]==nil)then self.db.profile.numcrit[arg10]=0 end
					if(self.db.profile.avcrit[arg10]==nil)then self.db.profile.avcrit[arg10]=0 end
					self.db.profile.numcrit[arg10] = self.db.profile.numcrit[arg10]+1
					self.db.profile.avcrit[arg10] = ((self.db.profile.avcrit[arg10]*(self.db.profile.numcrit[arg10]-1))+arg12)/self.db.profile.numcrit[arg10]
				end
			else--if not crit
				if(self.db.profile.recordhit and arg12~=nil) then--if recording hits and damage was done
					if(self.db.profile.hit[arg10]~=nil) then--if there is a record
						if(self.db.profile.hit[arg10]<arg12) then--if this breaks the record
							self.db.profile.hit[arg10] = arg12
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.hittime[arg10] = arg1
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whohit[arg10] = arg7
							end
							if(self.db.profile.notifyhit) then--if they want to be notified
								self:Print("New record hit damage with " .. arg10 .. " for: " .. arg12)
							end
						end
					else--no record
						self.db.profile.hit[arg10] = arg12
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.hittime[arg10] = arg1
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whohit[arg10] = arg7
						end
						if(self.db.profile.notifyhit) then--if they want to be notified
							self:Print("New record hit damage with " .. arg10 .. " for: " .. arg12)
						end
					end
				end
				if(self.db.profile.recordavhit) then--if they want average hit
					if(self.db.profile.numhit[arg10]==nil)then self.db.profile.numhit[arg10]=0 end
					if(self.db.profile.avhit[arg10]==nil)then self.db.profile.avhit[arg10]=0 end
					self.db.profile.numhit[arg10] = self.db.profile.numhit[arg10]+1
					self.db.profile.avhit[arg10] = ((self.db.profile.avhit[arg10]*(self.db.profile.numhit[arg10]-1))+arg12)/self.db.profile.numhit[arg10]
				end
			end
		elseif(arg2 == "SWING_DAMAGE") then
			if(arg14~=nil) then--if crit
				if(self.db.profile.recordcrit and arg9~=nil) then--if recordingcrits and there is damage
					if(self.db.profile.crit["Attack"]~=nil) then--if there is a record
						if(self.db.profile.crit["Attack"]<arg9) then--if this breaks the record
							self.db.profile.crit["Attack"] = arg9
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.crittime["Attack"] = arg1
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whocrit["Attack"] = arg7
							end
							if(self.db.profile.notifycrit) then--if they want to be notified
								self:Print("New record crit damage with " .. "Attack" .. " for: " .. arg9)
							end
							if(self.db.profile.guinotifycrit) then--if they want gui notification
								UIErrorsFrame:AddMessage("New record crit damage with " .. "Attack" .. " for: " .. arg9, 1.0, 0, 0, 10.0)
							end
							if(self.db.profile.critscreen) then--if they want screenshots
								Screenshot()
							end
							if(self.db.profile.highparty) then--if they want to tell party
								if(GetNumPartyMembers()>0) then--if they are in a party
									SendChatMessage("New record crit damage with " .. "Attack" .. " for: " .. arg9, "PARTY");
								end
							end
							if(self.db.profile.highguild) then--if they want to tell guild
								if(IsInGuild()) then--if they are in a guild
									SendChatMessage("New record crit damage with " .. "Attack" .. " for: " .. arg9, "GUILD");
								end
							end
						end
					else--no record
						self.db.profile.crit["Attack"] = arg9
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.crittime["Attack"] = arg1
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whocrit["Attack"] = arg7
						end
						if(self.db.profile.notifycrit) then--if they want to be notified
							self:Print("New record crit damage with " .. "Attack" .. " for: " .. arg9)
						end
						if(self.db.profile.guinotifycrit) then--if they want gui notification
							UIErrorsFrame:AddMessage("New record crit damage with " .. "Attack" .. " for: " .. arg9, 1.0, 0, 0, 10.0)
						end
						if(self.db.profile.critscreen) then--if they want screenshots
							Screenshot()
						end
						if(self.db.profile.highparty) then--if they want to tell party
							if(GetNumPartyMembers()>0) then--if they are in a party
								SendChatMessage("New record crit damage with " .. "Attack" .. " for: " .. arg9, "PARTY");
							end
						end
						if(self.db.profile.highguild) then--if they want to tell guild
							if(IsInGuild()) then--if they are in a guild
								SendChatMessage("New record crit damage with " .. "Attack" .. " for: " .. arg9, "GUILD");
							end
						end
					end
				end
				if(self.db.profile.recordavcrit) then--if they want average crit
					if(self.db.profile.numcrit["Attack"]==nil)then self.db.profile.numcrit["Attack"]=0 end
					if(self.db.profile.avcrit["Attack"]==nil)then self.db.profile.avcrit["Attack"]=0 end
					self.db.profile.numcrit["Attack"] = self.db.profile.numcrit["Attack"]+1
					self.db.profile.avcrit["Attack"] = ((self.db.profile.avcrit["Attack"]*(self.db.profile.numcrit["Attack"]-1))+arg9)/self.db.profile.numcrit["Attack"]
				end
			else--if not crit
				if(self.db.profile.recordhit and arg9~=nil) then--if recording hits and damage was done
					if(self.db.profile.hit["Attack"]~=nil) then--if there is a record
						if(self.db.profile.hit["Attack"]<arg9) then--if this breaks the record
							self.db.profile.hit["Attack"] = arg9
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.hittime["Attack"] = arg1
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whohit["Attack"] = arg7
							end
							if(self.db.profile.notifyhit) then--if they want to be notified
								self:Print("New record hit damage with " .. "Attack" .. " for: " .. arg9)
							end
						end
					else--no record
						self.db.profile.hit["Attack"] = arg9
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.hittime["Attack"] = arg1
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whohit["Attack"] = arg7
						end
						if(self.db.profile.notifyhit) then--if they want to be notified
							self:Print("New record hit damage with " .. "Attack" .. " for: " .. arg9)
						end
					end
				end
				if(self.db.profile.recordavhit) then--if they want average hit
					if(self.db.profile.numhit["Attack"]==nil)then self.db.profile.numhit["Attack"]=0 end
					if(self.db.profile.avhit["Attack"]==nil)then self.db.profile.avhit["Attack"]=0 end
					self.db.profile.numhit["Attack"] = self.db.profile.numhit["Attack"]+1
					self.db.profile.avhit["Attack"] = ((self.db.profile.avhit["Attack"]*(self.db.profile.numhit["Attack"]-1))+arg9)/self.db.profile.numhit["Attack"]
				end
			end
		elseif(arg2 == "SPELL_HEAL" or arg2 == "SPELL_PERIODIC_HEAL") then
			if(arg13~=nil) then--if crit
				if(self.db.profile.recordcrit and arg12~=nil) then--if recordingcrits and there is damage
					if(self.db.profile.crit[arg10]~=nil) then--if there is a record
						if(self.db.profile.crit[arg10]<arg12) then--if this breaks the record
							self.db.profile.crit[arg10] = arg12
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.crittime[arg10] = arg1
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whocrit[arg10] = arg7
							end
							if(self.db.profile.notifycrit) then--if they want to be notified
								self:Print("New record crit heal with " .. arg10 .. " for: " .. arg12)
							end
							if(self.db.profile.guinotifycrit) then--if they want gui notification
								UIErrorsFrame:AddMessage("New record crit heal with " .. arg10 .. " for: " .. arg12, 0, 1, 0, 10.0)
							end
							if(self.db.profile.critscreen) then--if they want screenshots
								Screenshot()
							end
							if(self.db.profile.highparty) then--if they want to tell party
								if(GetNumPartyMembers()>0) then--if they are in a party
									SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "PARTY");
								end
							end
							if(self.db.profile.highguild) then--if they want to tell guild
								if(IsInGuild()) then--if they are in a guild
									SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "GUILD");
								end
							end
						end
					else--no record
						self.db.profile.crit[arg10] = arg12
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.crittime[arg10] = arg1
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whocrit[arg10] = arg7
						end
						if(self.db.profile.notifycrit) then--if they want to be notified
							self:Print("New record crit heal with " .. arg10 .. " for: " .. arg12)
						end
						if(self.db.profile.guinotifycrit) then--if they want gui notification
							UIErrorsFrame:AddMessage("New record crit heal with " .. arg10 .. " for: " .. arg12, 0, 1, 0, 10.0)
						end
						if(self.db.profile.critscreen) then--if they want screenshots
							Screenshot()
						end
						if(self.db.profile.highparty) then--if they want to tell party
							if(GetNumPartyMembers()>0) then--if they are in a party
								SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "PARTY");
							end
						end
						if(self.db.profile.highguild) then--if they want to tell guild
							if(IsInGuild()) then--if they are in a guild
								SendChatMessage("New record crit damage with " .. arg10 .. " for: " .. arg12, "GUILD");
							end
						end
					end
				end
				if(self.db.profile.recordavcrit) then--if they want average crit
					if(self.db.profile.numcrit[arg10]==nil)then self.db.profile.numcrit[arg10]=0 end
					if(self.db.profile.avcrit[arg10]==nil)then self.db.profile.avcrit[arg10]=0 end
					self.db.profile.numcrit[arg10] = self.db.profile.numcrit[arg10]+1
					self.db.profile.avcrit[arg10] = ((self.db.profile.avcrit[arg10]*(self.db.profile.numcrit[arg10]-1))+arg12)/self.db.profile.numcrit[arg10]
				end
			else--if not crit
				if(self.db.profile.recordhit and arg12~=nil) then--if recording hits and damage was done
					if(self.db.profile.hit[arg10]~=nil) then--if there is a record
						if(self.db.profile.hit[arg10]<arg12) then--if this breaks the record
							self.db.profile.hit[arg10] = arg12
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.hittime[arg10] = arg1
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whohit[arg10] = arg7
							end
							if(self.db.profile.notifyhit) then--if they want to be notified
								self:Print("New record heal with " .. arg10 .. " for: " .. arg12)
							end
						end
					else--no record
						self.db.profile.hit[arg10] = arg12
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.hittime[arg10] = arg1
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whohit[arg10] = arg7
						end
						if(self.db.profile.notifyhit) then--if they want to be notified
							self:Print("New record heal with " .. arg10 .. " for: " .. arg12)
						end
					end
				end
				if(self.db.profile.recordavhit) then--if they want average hit
					if(self.db.profile.numhit[arg10]==nil)then self.db.profile.numhit[arg10]=0 end
					if(self.db.profile.avhit[arg10]==nil)then self.db.profile.avhit[arg10]=0 end
					self.db.profile.numhit[arg10] = self.db.profile.numhit[arg10]+1
					self.db.profile.avhit[arg10] = ((self.db.profile.avhit[arg10]*(self.db.profile.numhit[arg10]-1))+arg12)/self.db.profile.numhit[arg10]
				end
			end
		end--]]
		if(arg2 == "SPELL_DAMAGE" or arg2 == "RANGE_DAMAGE" or arg2 == "SPELL_PERIODIC_DAMAGE" or arg2 == "SWING_DAMAGE" or arg2 == "SPELL_HEAL" or arg2 == "SPELL_PERIODIC_HEAL") then
			if(arg2 == "SPELL_DAMAGE" or arg2 == "RANGE_DAMAGE" or arg2 == "SPELL_PERIODIC_DAMAGE") then
				crit = arg17
				damage = arg12
				spell = arg10
				name = arg7
				time = arg1
			elseif(arg2 == "SWING_DAMAGE") then
				crit = arg14
				damage = arg9
				spell = "Attack"
				name = arg7
				time = arg1
			elseif(arg2 == "SPELL_HEAL" or arg2 == "SPELL_PERIODIC_HEAL") then
				crit = arg13
				damage = arg12
				spell = arg10
				name = arg7
				time = arg1
			else
				return
			end
			if(crit~=nil) then--if crit
				if(self.db.profile.recordcrit and damage~=nil) then--if recordingcrits and there is damage
					if(self.db.profile.crit[spell]~=nil) then--if there is a record
						if(self.db.profile.crit[spell]<damage) then--if this breaks the record
							self.db.profile.crit[spell] = damage
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.crittime[spell] = time
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whocrit[spell] = name
							end
							if(self.db.profile.notifycrit) then--if they want to be notified
								self:Print("New record crit damage with " .. spell .. " for: " .. damage)
							end
							if(self.db.profile.guinotifycrit) then--if they want gui notification
								UIErrorsFrame:AddMessage("New record crit damage with " .. spell .. " for: " .. damage, 1.0, 0, 0, 10.0)
							end
							if(self.db.profile.critscreen) then--if they want screenshots
								Screenshot()
							end
							if(self.db.profile.highparty) then--if they want to tell party
								if(GetNumPartyMembers()>0) then--if they are in a party
									SendChatMessage("New record crit damage with " .. spell .. " for: " .. damage, "PARTY");
								end
							end
							if(self.db.profile.highguild) then--if they want to tell guild
								if(IsInGuild()) then--if they are in a guild
									SendChatMessage("New record crit damage with " .. spell .. " for: " .. damage, "GUILD");
								end
							end
						end
					else--no record
						self.db.profile.crit[spell] = damage
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.crittime[spell] = time
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whocrit[spell] = name
						end
						if(self.db.profile.notifycrit) then--if they want to be notified
							self:Print("New record crit damage with " .. spell .. " for: " .. damage)
						end
						if(self.db.profile.guinotifycrit) then--if they want gui notification
							UIErrorsFrame:AddMessage("New record crit damage with " .. spell .. " for: " .. damage, 1.0, 0, 0, 10.0)
						end
						if(self.db.profile.critscreen) then--if they want screenshots
							Screenshot()
						end
						if(self.db.profile.highparty) then--if they want to tell party
							if(GetNumPartyMembers()>0) then--if they are in a party
								SendChatMessage("New record crit damage with " .. spell .. " for: " .. damage, "PARTY");
							end
						end
						if(self.db.profile.highguild) then--if they want to tell guild
							if(IsInGuild()) then--if they are in a guild
								SendChatMessage("New record crit damage with " .. spell .. " for: " .. damage, "GUILD");
							end
						end
					end
				end
				if(self.db.profile.recordavcrit) then--if they want average crit
					if(self.db.profile.numcrit[spell]==nil)then self.db.profile.numcrit[spell]=0 end
					if(self.db.profile.avcrit[spell]==nil)then self.db.profile.avcrit[spell]=0 end
					self.db.profile.numcrit[spell] = self.db.profile.numcrit[spell]+1
					self.db.profile.avcrit[spell] = ((self.db.profile.avcrit[spell]*(self.db.profile.numcrit[spell]-1))+damage)/self.db.profile.numcrit[spell]
				end
				if(self.db.profile.calccritchance) then--if they want crit chance
					if(self.db.profile.numhit[spell]==nil)then self.db.profile.numhit[spell]=0 end
					if(self.db.profile.numcrit[spell]==nil)then self.db.profile.numcrit[spell]=0 end
					self.db.profile.numcrit[spell] = self.db.profile.numcrit[spell]+1
				end
			else--if not crit
				if(self.db.profile.recordhit and damage~=nil) then--if recording hits and damage was done
					if(self.db.profile.hit[spell]~=nil) then--if there is a record
						if(self.db.profile.hit[spell]<damage) then--if this breaks the record
							self.db.profile.hit[spell] = damage
							if(self.db.profile.recordtime) then--if recording time
								self.db.profile.hittime[spell] = time
							end
							if(self.db.profile.recordname) then--if recording name
								self.db.profile.whohit[spell] = name
							end
							if(self.db.profile.notifyhit) then--if they want to be notified
								self:Print("New record hit with " .. spell .. " for: " .. damage)
							end
						end
					else--no record
						self.db.profile.hit[spell] = damage
						if(self.db.profile.recordtime) then--if recording time
							self.db.profile.hittime[spell] = time
						end
						if(self.db.profile.recordname) then--if recording name
							self.db.profile.whohit[spell] = name
						end
						if(self.db.profile.notifyhit) then--if they want to be notified
							self:Print("New record hit with " .. spell .. " for: " .. damage)
						end
					end
				end
				if(self.db.profile.recordavhit) then--if they want average hit
					if(self.db.profile.numhit[spell]==nil) then self.db.profile.numhit[spell]=0 end
					if(self.db.profile.avhit[spell]==nil) then self.db.profile.avhit[spell]=0 end
					self.db.profile.numhit[spell] = self.db.profile.numhit[spell]+1
					self.db.profile.avhit[spell] = ((self.db.profile.avhit[spell]*(self.db.profile.numhit[spell]-1))+damage)/self.db.profile.numhit[spell]
				end
				if(self.db.profile.calccritchance) then--if they want crit chance
					if(self.db.profile.numhit[spell]==nil) then self.db.profile.numhit[spell]=0 end
					if(self.db.profile.numcrit[spell]==nil) then self.db.profile.numcrit[spell]=0 end
					self.db.profile.numhit[spell] = self.db.profile.numhit[spell]+1
				end
			end
		end
	end
end

function round(val, decimal)
  if (decimal) then
    return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
  else
    return math.floor(val+0.5)
  end
end