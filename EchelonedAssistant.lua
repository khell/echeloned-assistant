EchelonedAssistant = LibStub("AceAddon-3.0"):NewAddon("EchelonedAssistant", "AceConsole-3.0", "AceEvent-3.0")
TicketChannel = "gm_sync_channel";

--handling of the slash commands--
local options = { 
    name = "EchelonedAssistant",
    handler = EchelonedAssistant,
    type = "group",
    args = {
        show = {
            type = "execute",
            func = "OpenMain",
            name = "Main Window of EchelonedAssistant"
        },
        obj = {
                type = "execute",
                func = "Objectshow",
                name = "Object form"
            },
    },
}

function EchelonedAssistant:OnInitialize()
    print("EchelonedAssistant loaded type /ewa to show options.")
    LibStub("AceConfig-3.0"):RegisterOptionsTable("EchelonedAssistant", options, {"ewa", "ech", "ea"})
end



-- Binding Variables
BINDING_HEADER_EchelonedAssistant = "Echeloned Assistant";
BINDING_NAME_ToggleAddon = "Toggles Echeloned Assistant";
BINDING_HEADER_Chatbox = "Chatbox";
BINDING_NAME_ToggleChatbox = "toggle Chatbox";
BINDING_HEADER_MYHEADER = "EchelonedAssistant: Mover";
BINDING_NAME_BIND1 = "Left";
BINDING_NAME_BIND2 = "Right";
BINDING_NAME_BIND3 = "Front"
BINDING_NAME_BIND4 = "Back"
BINDING_NAME_BIND5 = "Up"
BINDING_NAME_BIND6 = "Down"
BINDING_NAME_BIND7 = "Spawn Toggle"
BINDING_NAME_BIND8 = "Get Object ID"
BINDING_NAME_BIND9 = "Single Spawn"
BINDING_NAME_BIND10 = "Single Spawn W/O Port"
BINDING_NAME_BIND11 = "Custom Move"



function EchelonedAssistant:OnEnable()
    self:RegisterEvent("CHAT_MSG_SYSTEM") 
    self:RegisterEvent("PLAYER_DEAD")
    ObjectMTxt:Insert("180035")
    ObjectWTxt:Insert("0.5")
    ObjectHTxt:Insert("0.5")
    ObjectLTxt:Insert("12")
    SaveSpawn:SetChecked(true)
    XDirTxt:Insert("0")
    YDirTxt:Insert("0")
    ZDirTxt:Insert("0")
end

function EchelonedAssistant:OnDisable()
    -- Called when the addon is disabled
end


function EchelonedAssistant:ToggleAddon()
	if addonopen then
		FullForm:Hide();
		MinipForm:Hide();
		MiniForm:Hide();
		PhaseForm:Hide();
		ItemForm:Hide();
		RoleplayForm:Hide();
		ObjectForm:Hide();
		TitleForm:Hide();
		TicketTracker:Hide();
		TicketView:Hide();
		TeleForm:Hide();
		ProfessionsForm:Hide();
		SkillForm:Hide();
		SpellForm:Hide();
		BanForm:Hide();
		IPBanForm:Hide();
		NPCForm:Hide();
		PhaseForm:Hide();
		PlayerForm:Hide();
		WepskForm:Hide();
		OverridesForm:Hide();
		ModifyForm:Hide();
		QuickItemForm:Hide();
		QuickItemForm2:Hide();
		QuestForm:Hide();
		QuickPortalForm:Hide();
		PSound("INTERFACESOUND_CHARWINDOWCLOSE");
		addonopen = false;
	else
		EchelonedAssistant:OpenMain();
		PSound("INTERFACESOUND_CHARWINDOWOPEN");
		addonopen = true;
	end
end


--Handles the main window open
function EchelonedAssistant:OpenMain()
	if(gmhview == 2) then
		MinipForm:Show();
	elseif(gmhview == 3) then
		MiniForm:Show();
	else
		FullForm:Show();
	end
end

--Duplicated for library use
function OpenMain()
	if(gmhview == 2) then
		MinipForm:Show();
	elseif(gmhview == 3) then
		MiniForm:Show();
	else
		FullForm:Show();
	end
end

--Used for the slash command
function EchelonedAssistant:Objectshow()
    ObjectForm:Show()
end

function BanFormToggle()
    if banshow then
        BanForm:Hide();
        banshow = false    
    else
        BanForm:Show();
        banshow = true
    end
end

function TeleFormToggle()
    if teleshow then
        TeleForm:Hide();
        teleshow = false
    else
        TeleForm:Show();
        teleshow = true
    end
end

function TitleFormToggle()
    if titleshow then
        TitleForm:Hide();
        titleshow = false
    else
        TitleForm:Show();
        titleshow = true
    end
end

function ObjectFormToggle()
    if objectshow then
        ObjectForm:Hide();
        objectshow = false
    else
        ObjectForm:Show();
        objectshow = true
    end
end

function PhaseFormToggle()
    if phaseshow then
        PhaseForm:Hide();
        phaseshow = false
    else
        PhaseForm:Show();
        phaseshow = true
    end
end

function ItemFormToggle()
    if itemshow then
        ItemForm:Hide();
        itemshow = false
    else
        ItemForm:Show();
        itemshow = true
    end
end

function ModifyFormToggle()
    if modshow then
        ModifyForm:Hide();
        modshow = false
    else
        ModifyForm:Show();
        modshow = true
    end
end

function OverridesFormToggle()
    if cheatshow then
        OverridesForm:Hide()
        cheatshow = false
    else 
        OverridesForm:Show()
        cheatshow = true
    end
end

function RoleplayFormToggle()
    if roshow then
        RoleplayForm:Hide();
        roshow = false
    else
        RoleplayForm:Show();
        roshow = true
    end
end

function PlayerFormToggle()
    if pshow then
        PlayerForm:Hide();
        pshow = false
    else
        PlayerForm:Show();
        pshow = true
    end
end

function SpellFormToggle()
    if spellshow then
        SpellForm:Hide();
        spellshow = false
    else
        SpellForm:Show();
        spellshow = true
    end
end

function SkillFormToggle()
    if skillshow then
        SkillForm:Hide();
        skillshow = false
    else
        SkillForm:Show();
        skillshow = true
    end
end

function NPCFormToggle()
    if npcshow then
        NPCForm:Hide();
        npcshow = false
    else 
        NPCForm:Show();
        npcshow = true
    end
end

function QuestFormToggle()
    if qshow then
        QuestForm:Hide();
        qshow = false
    else
        QuestForm:Show();
        qshow = true
    end
end
    
function outSAY(text, BoolChat)
local sendto = "GUILD";
	if BoolChat then
		SendChatMessage(text, sendto);
	else
		SendChatMessage("."..text, sendto);
	end
end

function PSound(sound)
	PlaySound(sound);
end

function GMH_EmptyField()
	print("Please complete the required fields!");
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ban Script
function BanAccount()
	outSAY("account ban "..CharName:GetText().." "..BanReason:GetText().." "..BanLength:GetText());
end

function BanMute()
	outSAY("account mute "..CharName:GetText().." "..BanReason:GetText().." "..BanLength:GetText());
end

function Kick()
	outSAY("kick "..CharName:GetText().." "..BanReason:GetText().." "..BanLength:GetText());
end

function UnBanAccount()
	outSAY("account unban "..CharName:GetText());
end

function UnMuteAccount()
	outSAY("account unmute "..CharName:GetText());
end

function AddIPBan()
	outSAY("ban ip "..IPAddress1:GetText().." "..Duration1:GetText());
end

function DelIPBan()
	outSAY("unban ip "..IPAddress1:GetText());
end

function DiscPlayer()
	outSAY("killbyplayer "..CharName:GetText().." "..BanReason:GetText());
end

function PInfo()
	outSAY("playerinfo "..CharName:GetText());
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BattlegroundScript

function BGLeave()
	outSAY("t");
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RoleplayScript

function RoleplayAdd()
    outSAY("roleplay addselftolist "..RoleplayType:GetText());
end

function RoleplayRemove()
    outSAY("roleplay remove");
end

function RoleplayListPlayer()
    outSAY("roleplay networked");
end

function RoleplayListRo()
    outSAY("roleplay current");
end

function CreateRoleplay()
    outSAY("roleplay createroleplay "..RoleplayCreatebox:GetText());
end

function RoleplayDelete()
    outSAY("roleplay delete");
end

function RoleplayGo()
    outSAY("roleplay go "..RoleplayIDbox:GetText());
end

function RoAnn()
    outSAY("roleplay ann "..RoleplayAnnChat:GetText());
end

function RoleplayMute()
    outSAY("roleplay mute "..RoleplayMutebox:GetText());
end

function RoleplayUnmute()
    outSAY("roleplay unmute "..RoleplayMutebox:GetText());
end
    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CommScript

function WhisperOn()
	outSAY("gm allowwhispers "..PlayerName2:GetText());
end

function WhisperOff()
	outSAY("gm blockwhispers "..PlayerName2:GetText());
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- AnnounceScript

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ItemScript
function RemoveItem()
	outSAY("removeitem "..ItemNumber:GetText());
end

function AddItem()
	outSAY("additem "..ItemNumber:GetText().." "..ItemQuantity1:GetText());
end

function AddItemSet()
	outSAY("additemset "..ItemSetNumber:GetText());
end

function SearchItem()
	outSAY("lookup item "..ItemNumber:GetText());
end

function AddMoney()
	IntGold = Gold:GetNumber() * 10000;
	IntSilver = Silver:GetNumber() * 100;
	IntCopper = Copper:GetNumber();
	outSAY("modify gold " ..(IntGold + IntSilver + IntCopper));
end

local playerName = UnitName("player");
function RenameChar()
    outSAY("renamechar "..playerName.."  "..PlayerFormBox:GetText());
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MiscScript
function SInfo()
	outSAY("info");
end

function Invis()
	outSAY("invisible");
end

function Invince()
	outSAY("invincible");
end

function PlayAll()
	outSAY("playall "..AdminEditBox:GetText());
end

function CastAll()
	outSAY("castall "..AdminEditBox:GetText());
end

function Whisper()
    outSAY('whisper "'..WhisperNameBox:GetText()..'" '..WhisperBox:GetText());

end
    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ModifyScript

function Modify()
local selection = UIDropDownMenu_GetText(ModifyComboBox)
	if selection == "Armor" then
		modify = "armor";
	elseif selection == "HP" then
		modify = "hp";
	elseif selection == "Runic" then
		modify = "runic";
	elseif selection == "Rage" then
		modify = "rage";
	elseif selection == "Mana" then
		modify = "mana";
	elseif selection == "Energy" then
		modify = "energy";
	elseif selection == "Damage" then
		modify = "damage";
	elseif selection == "Spirit" then
		modify = "spirit";
	elseif selection == "Speed" then
		modify = "speed";
	elseif selection == "Scale" then
		modify = "scale";
	elseif selection == "Faction" then
		modify = "faction";
	elseif selection == "Display" then
		modify = "displayid";
	elseif selection =="Displayid2" then
		modify = "displayid2";
	elseif selection == "Talents" then
		modify = "talentpoints";
	elseif selection == "Holy Resist" then
		modify = "holy";
	elseif selection == "Fire Resist" then
		modify = "fire";
	elseif selection == "Nature Resist" then
		modify = "nature";
	elseif selection == "Frost Resist" then
		modify = "frost";
	elseif selection == "Shadow Resist" then
		modify = "shadow";
	elseif selection == "Arcane Resist" then
		modify = "arcane";
	elseif selection == "Emote State" then
		modify = "emotestate";
	elseif selection == "Honor" then	
		modify = "honor"
	end	
	outSAY("modify "..modify.." "..ModifyEditBox:GetText());
end

function Demorph()
	outSAY("demorph");
end	

function Demorph2()
	outSAY("demorph2");	
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NPCScript

function SpawnNPC()
	outSAY("npc spawn "..NPCNumber:GetText().." 1");
end

function LookupNPC()
	outSAY("lookup creature "..NPCNumber:GetText());
end

function DeleteNPC()
	outSAY("npc delete");
end

function NPCCome()
	outSAY("npc come");
end

function NPCInfo()
	outSAY("npc info");
end

function WaypointsAdd()
	outSAY("npc addwaypoint");
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ObjectScript
function TargetObject()
	outSAY("go select");
end

function LookupObject()
	outSAY("lookup gobject "..ObjectNumber:GetText());
end

function ObjectScale()
	outSAY("go scale "..ObjectNumber:GetText());
end

function ObjectInfo()
	outSAY("go info");
end

function DeleteObject()
	outSAY("go delete");
end

function PlaceObject()
	PlaceObjectTrue();
end

function PlaceObjectTrue()
	if SaveSpawn:GetChecked() then a = "1" else a = "" end
	outSAY("go spawn "..ObjectNumber:GetText().." "..a);
end

function ObjectInfo()
	outSAY("go info");
end

function PortStart()
    outSAY("start");
end

function ActivateObject()
	outSAY("go activate");
end

function EnableObject()
	outSAY("go enable");
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OverridesScript
function CheatStatus()
	outSAY("cheat status");
end

function CheatUpdate()
	if(FlyCheck:GetChecked()) then --fly
	outSAY("cheat fly"); else end
	if(GodCheck:GetChecked()) then--god
	outSAY("cheat god"); else end
	if(NCDCheck:GetChecked()) then--cooldown
	outSAY("cheat cooldown"); else end
	if(NCTCheck:GetChecked()) then--casttime
	outSAY("cheat casttime"); else end
	if(PowCheck:GetChecked()) then--power
	outSAY("cheat power"); else end
	if(AuraCheck:GetChecked()) then--stack
	outSAY("cheat stack"); else end
	if(TrigCheck:GetChecked()) then--triggers
	outSAY("cheat triggerpass"); else end
end 

function FlySpeed()
if FlyEntry:GetText() == "" then
Fly_Speed = 1;
elseif(FlyEntry:GetNumber() < 2) then
Fly_Speed = FlyEntry:GetNumber();
else
Fly_Speed = FlyEntry:GetNumber() / 2; --Divide it before it's sent to get the actual desired speed. .mod speed doubles your input for flying.
end
outSAY("mod speed "..Fly_Speed);
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PlayerScript

function LevelPlayer()
	outSAY("mod level "..PlayerFormBox:GetText());
end

function RevivePlayer2()
	outSAY("reviveplr "..PlayerFormBox:GetText());
end

function LookupFaction()
	outSAY("lookup faction "..PlayerFormBox:GetText());
end

function SetStanding()
    outSAY("setstanding "..PlayerFormBox:GetText());
end

function PhaseCreate()
    outSAY("phase create "..PhaseCreateChatbox:GetText());
end

function PhaseDelete()
    outSAY("phase delete");
end

function PhaseEnter()
    outSAY("phase enter "..PhaseEnterChatbox:GetText());
end

function PhaseExit()
    outSAY("phase exit");
end

function PhaseKick()
    outSAY("phase kick "..PhaseOwnerChatbox:GetText());
end

function PhaseListChar()
    outSAY("phase listcharacter "..PhaseOwnerChatbox:GetText());
end

function PhaseListAcc()
    outSAY("phase listaccount "..PhaseOwnerChatbox:GetText());
end

function PhaseUnlistChar()
    outSAY("phase unlistchar "..PhaseOwnerChatbox:GetText());
end

function PhaseUnlistAcc()
    outSAY("phase unlistaccount "..PhaseOwnerChatbox:GetText());
end

function PhaseAddMem()
    outSAY("phase addmem "..PhaseOwnerChatbox:GetText());
end

function PhaseRemoveMem()
    outSAY("phase removemem "..PhaseOwnerChatbox:GetText());
end

function PhaseChangeList()
    outSAY("phase changelisttype");
end

function PhasePromote()
    outSAY("phase promotemem "..PhaseOwnerChatbox:GetText());
end

function PhaseDemote()
    outSAY("phase demotemem "..PhaseOwnerChatbox:GetText());
end

function PhaseInfo()
    outSAY("phase info");
end

function PhaseShowMem()
    outSAY("phase showmem");
end

function PhaseShowOff()
    outSAY("phase showofficers");
end

function PhaseShowAcc()
    outSAY("phase showacc");
end

function PhaseMyID()
    outSAY("phase getmyphaseid");
end

function PhaseWeather()
    outSAY("phase setweather "..PhaseOwnerChatbox:GetText());
end

function PhasePlaySound()
    outSAY("phase playsound "..PhaseOwnerChatbox:GetText());
end

function PhaseAnn()
    outSAY("phase announce "..PhaseOwnerChatbox:GetText());
end

function PhaseSetStarting()
    outSAY("phase setstarting");
end


function PhaseToggles()
local selection = UIDropDownMenu_GetText(PhaseTogglebox)
    if selection == "Sanctuary" then
        toggle = "sanc"
    elseif selection == "Custom Items" then
        toggle = "custom"
    elseif selection == "Kill Command" then
        toggle = "murder"
    elseif selection == "Cheats" then
        toggle = "cheat"
    elseif selection == "Flight" then
        toggle = "flight"
    end
    outSAY("phase toggle "..toggle);
end
    

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QuestScript

function LookupQuest()
	outSAY("lookup quest "..QuestFormBox:GetText());
end

function QuestComplete()
	outSAY("quest complete "..QuestFormBox:GetText());
end

function QuestStart()
	outSAY("quest start "..QuestFormBox:GetText());
end

function QuestRemove()
	outSAY("quest remove "..QuestFormBox:GetText());
end

function QuestAdd()
if StartCheckButton:GetChecked() and FinishCheckButton:GetChecked() then
	outSAY("quest start "..QuestFormBox:GetText());
elseif FinishCheckButton:GetChecked() then
	outSAY("quest finish "..QuestFormBox:GetText());
elseif StartCheckButton:GetChecked() then
	outSAY("quest start "..QuestFormBox:GetText());
else
	ShowMessage("Please select Start, Finish, or Both!", "FF0000", 1);
end
end

function QuestDel()
if StartCheckButton:GetChecked() and FinishCheckButton:GetChecked() then
	outSAY("quest remove "..QuestFormBox:GetText());
elseif FinishCheckButton:GetChecked() then
	outSAY("quest remove "..QuestFormBox:GetText());
elseif StartCheckButton:GetChecked() then
	outSAY("quest remove "..QuestFormBox:GetText());
else
	ShowMessage("Please select Start, Finish, or Both!", "FF0000", 1);
end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--QuickItemScript
function GmOutfit()
	outSAY("additem 2586");--Gamemaster's Robe
	outSAY("additem 11508");--Gamemaster's Slippers
	outSAY("additem 12064");--Gamemaster's Hood
	outSAY("additem 12947 2");--Alex's Ring of Audacity X2
	outSAY("additem 192");--Martin Thunder
	outSAY("additem 19879");--Alex's Test Beatdown Staff
	outSAY("additem 19160");--Contest Winner's Tabbard
	outSAY("additem 23162 4");--Foror's Crate of Endless Resist Gear Storage X4
end
--Gamemaster's Robe, Gamemaster's Slippers, Gamemaster's Hood, Alex's Ring of Audacity X2, Martin Thunder, Alex's Test Beatdown Staff, Contest Winner's Tabbard, Foror's Crate of Endless Resist Gear Storage X4

function PriestT8()
	outSAY("add 132040");
	outSAY("add 132041");
    outSAY("add 132042");
    outSAY("add 132043");
    outSAY("add 132044");
    outSAY("add 132045");
end

function MasterEng()
    outSAY("add 192130");
    outSAY("add 192131");
    outSAY("add 192132");
    outSAY("add 192133");
    outSAY("add 192134");
    outSAY("add 192135");
    outSAY("add 192136");
    outSAY("add 192137");
end

function SilverCovenant()
    outSAY("add 200180");
    outSAY("add 200181");
    outSAY("add 200182");
    outSAY("add 200183");
    outSAY("add 200184");
    outSAY("add 200185");
    outSAY("add 200186");
    outSAY("add 200187");
end

function DarkMage()
    outSAY("add 200190");
    outSAY("add 200191");
    outSAY("add 200192");
    outSAY("add 200193");
    outSAY("add 200194");
end

function DefenderLight()
    outSAY("add 508140");
    outSAY("add 508141");
    outSAY("add 508142");
    outSAY("add 508143");
    outSAY("add 508144");
    outSAY("add 508145");
    outSAY("add 508146");
    outSAY("add 508147");
end

function Brann()
    outSAY("add 827030");
    outSAY("add 827031");
    outSAY("add 827032");
    outSAY("add 827033");
    outSAY("add 827034");
    outSAY("add 827035");
    outSAY("add 827036");
    outSAY("add 827037");
end

function Defender()
    outSAY("add 827010");
    outSAY("add 827011");
    outSAY("add 827012");
    outSAY("add 827013");
    outSAY("add 827014");
    outSAY("add 827015");
    outSAY("add 827016");
    outSAY("add 827017");
    outSAY("add 827018");
    outSAY("add 827019");
    outSAY("add 827020");
end

function DemonHunter2()
    outSAY("add 827000");
    outSAY("add 827001");
    outSAY("add 827002");
    outSAY("add 827003");
    outSAY("add 827004");
    outSAY("add 827005");
    outSAY("add 827006");
end

function EbonWatcher()
    outSAY("add 814730");
    outSAY("add 814731");
    outSAY("add 814732");
    outSAY("add 814733");
    outSAY("add 814734");
    outSAY("add 814735");
    outSAY("add 814736");
end

function HarbingerArgomen()
    outSAY("add 814720");
    outSAY("add 814721");
    outSAY("add 814722");
    outSAY("add 814723");
    outSAY("add 814724");
    outSAY("add 814725");
    outSAY("add 814726");
end
    
function TrollStalker()
    outSAY("add 814710");
    outSAY("add 814711");
    outSAY("add 814712");
    outSAY("add 814713");
    outSAY("add 814714");
    outSAY("add 814715");
    outSAY("add 814716");
end

function ConquestHold()
    outSAY("add 814700");
    outSAY("add 814701");
    outSAY("add 814702");
    outSAY("add 814703");
    outSAY("add 814704");
    outSAY("add 814705");
    outSAY("add 814706");
    outSAY("add 814707");
end

function HighAbbot()
    outSAY("add 710060");
    outSAY("add 710061");
    outSAY("add 710062");
    outSAY("add 710063");
    outSAY("add 710064");
    outSAY("add 710065");
    outSAY("add 710066");
    outSAY("add 710067");
end

function WarchiefB()
    outSAY("add 710040");
    outSAY("add 710041");
    outSAY("add 710042");
    outSAY("add 710043");
    outSAY("add 710044");
    outSAY("add 710045");
end
    
function Guldan()
    outSAY("add 710030");
    outSAY("add 710031");
    outSAY("add 710032");
    outSAY("add 710033");
    outSAY("add 710034");
    outSAY("add 710035");
    outSAY("add 710036");
end

function StromTroll()
    outSAY("add 710010");
    outSAY("add 710011");
    outSAY("add 710012");
    outSAY("add 710013");
    outSAY("add 710014");
    outSAY("add 710015");
end

function StromDef()
    outSAY("add 710000");
    outSAY("add 710001");
    outSAY("add 710002");
    outSAY("add 710003");
    outSAY("add 710004");
    outSAY("add 710005");
    outSAY("add 710006");
    outSAY("add 710007");
    outSAY("add 710008");
end

function Blademaster()
    outSAY("add 508120");
    outSAY("add 508121");
    outSAY("add 508122");
end

function Grunt()
    outSAY("add 508130");
    outSAY("add 508131");
    outSAY("add 508132");
    outSAY("add 508133");
    outSAY("add 508134");
    outSAY("add 508135");
    outSAY("add 508136");
end
    
function ArgentCr()
    outSAY("add 321500");
    outSAY("add 321501");
    outSAY("add 321502");
    outSAY("add 321503");
    outSAY("add 321504");
    outSAY("add 321505");
    outSAY("add 321506");
    outSAY("add 321507");
end

function DemonHunter1()
    outSAY("add 508110");
    outSAY("add 508111");
    outSAY("add 508112");
    outSAY("add 508113");
end

function IronforgeLord()
    outSAY("add 508150");
    outSAY("add 508151");
    outSAY("add 508152");
    outSAY("add 508153");
    outSAY("add 508154");
    outSAY("add 508155");
    outSAY("add 508156");
    outSAY("add 508157");
end

function Outrunner()
    outSAY("add 200160");
    outSAY("add 200161");
    outSAY("add 200162");
    outSAY("add 200163");
    outSAY("add 200164");
    outSAY("add 200165");
    outSAY("add 200166");
end

function Bloodwarder()
    outSAY("add 200120");
    outSAY("add 200121");
    outSAY("add 200122");
    outSAY("add 200123");
    outSAY("add 200124");
    outSAY("add 200125");
    outSAY("add 200126");
    outSAY("add 200127");
end

function Darkener()
    outSAY("add 192110");
    outSAY("add 192111");
    outSAY("add 192112");
    outSAY("add 192113");
    outSAY("add 192114");
    outSAY("add 192115");
    outSAY("add 192116");
    outSAY("add 192117");
end    

function Astro()
    outSAY("add 127100");
    outSAY("add 127101");
    outSAY("add 127102");
    outSAY("add 127103");
    outSAY("add 127104");
    outSAY("add 127105");
end   

function ScarletKnight()
    outSAY("add 134410");
    outSAY("add 134411");
    outSAY("add 134412");
    outSAY("add 134413");
    outSAY("add 134414");
    outSAY("add 134415");
    outSAY("add 134416");
    outSAY("add 134417");
    outSAY("add 134418");
end

function ScarletPriest()
    outSAY("add 134420");
    outSAY("add 134421");
    outSAY("add 134422");
    outSAY("add 134423");
    outSAY("add 134424");
    outSAY("add 134425");
    outSAY("add 134426");
    outSAY("add 134427");
    outSAY("add 134428");
end

function GrandAstro()
    outSAY("add 192120");
    outSAY("add 192121");
    outSAY("add 192122");
    outSAY("add 192123");
    outSAY("add 192124");
    outSAY("add 192125");
end

function BloodHammer()
    outSAY("add 192100");
    outSAY("add 192101");
    outSAY("add 192102");
    outSAY("add 192103");
    outSAY("add 192104");
    outSAY("add 192105");
    outSAY("add 192106");
    outSAY("add 192107");
end

function Silverhand()
    outSAY("add 192230");
    outSAY("add 192231");
    outSAY("add 192232");
    outSAY("add 192233");
    outSAY("add 192234");
    outSAY("add 192235");
    outSAY("add 192236");
    outSAY("add 192237");
end

function MountainKing()
    outSAY("add 192220");
    outSAY("add 192221");
    outSAY("add 192222");
    outSAY("add 192223");
    outSAY("add 192224");
    outSAY("add 192225");
    outSAY("add 192226");
    outSAY("add 192227");
    outSAY("add 192228");
    outSAY("add 192229");
end    

function SWGuard()
    outSAY("add 192200");
    outSAY("add 192201");
    outSAY("add 192202");
    outSAY("add 192203");
    outSAY("add 192204");
    outSAY("add 192205");
    outSAY("add 192206");
    outSAY("add 192207");
end

function ScarletFleet()
    outSAY("add 134430");  
    outSAY("add 134431");
    outSAY("add 134432");
    outSAY("add 134433");
    outSAY("add 134434");
    outSAY("add 134435");
    outSAY("add 134436");
    outSAY("add 134437");
end

function ScarletBishop()
    outSAY("add 134400");
    outSAY("add 134401");
    outSAY("add 134402");
    outSAY("add 134403");
    outSAY("add 134404");
    outSAY("add 134405");
    outSAY("add 134406");
    outSAY("add 134407");
    outSAY("add 134408");
end    

function BrownDK()
    outSAY("add 125700");
    outSAY("add 125701");
    outSAY("add 125702");
    outSAY("add 125703");
    outSAY("add 125704");
    outSAY("add 125705");
    outSAY("add 125706");
end    

function AlliRifle()
    outSAY("add 192210");
    outSAY("add 192211");
    outSAY("add 192212");
    outSAY("add 192213");
    outSAY("add 192214");
    outSAY("add 192215");
    outSAY("add 192216");
end    

function ArcherusNec()
    outSAY("add 132000");
    outSAY("add 132001");
    outSAY("add 132002");
    outSAY("add 132003");
    outSAY("add 132004");
    outSAY("add 132005");
end    

function DeathKnightT8()
	outSAY("add 192240");
	outSAY("add 192241");
    outSAY("add 192242");
    outSAY("add 192243");
    outSAY("add 192244");
    outSAY("add 192245");
    outSAY("add 192246");
    outSAY("add 192247");
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SkillScript
function LookupSkill()
	outSAY("lookup skill "..SkillNumber:GetText());
end

function LearnSkill()
	outSAY("advancesk "..SkillNumber:GetText().." "..SkillLvl:GetText().." "..SkillMax:GetText());
end

function UnLearnSkill()
	outSAY("removesk "..SkillNumber:GetText());
end

function AdvanceAll()
	outSAY("advanceallskills "..SkillsBy:GetText());
end

function LearnRiding()
	outSAY("learn 33388");--Apprentice Riding
	outSAY("learn 33391");--Journeyman Riding
	outSAY("learn 34090");--Expert Riding
	outSAY("learn 34091");--Artisan Riding
	outSAY("learn 54197");--Cold Weather Flying
end

function TitleAdd()
	outSAY("title add "..TitleNumber:GetText());
end

function TitleKnown()
    outSAY("title known");
end

function LearnAllTitles()
    i=1
    repeat
        outSAY("title add "..i);
        i=i+1
        until i==178
end	
	
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SpellScript
function LearnSpell()
	outSAY("learn "..SpellNumber:GetText());
end

function UnlearnSpell()
	outSAY("unlearn "..SpellNumber:GetText());
end

function LearnAll()
	outSAY("learn all");
end

function SpellCastID()
    outSAY("cast "..SpellNumber:GetText());
end

function LookupSpell()
	outSAY("lookup spell "..SpellNumber:GetText());
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TeleScript
function GoName()
	outSAY("appear "..ToPlayerName:GetText());
end

function NameGo()
	outSAY("summon "..ToPlayerName:GetText());
end

function SearchTele()
	outSAY("recall list "..ZoneName:GetText());
end

function Tele()
	outSAY("recall port "..ZoneName:GetText());
end

function AddPort()
	outSAY("recall add "..ZoneName:GetText());
end

function DelPort()
	outSAY("recall del "..ZoneName:GetText());
end

function GPSBuild()
    outSAY("gps "..X:GetText().." "..YCord2:GetText().." "..ZCord2:GetText().." "..OrientationBox2:GetText());
end

function Deletego()
    outSAY("go sel");
    outSAY("go del");
end

function PortPlayer()
	outSAY("recall portplayer "..ToPlayerName:GetText().." "..ZoneName:GetText());
end

function WorldPort()
	outSAY("worldport "..MapID:GetText().." "..XCord:GetText().." "..YCord:GetText().." "..ZCord:GetText().." "..OrientationBox:GetText());
end

function GPS()
	outSAY("gps");
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- WepskScript

function LearnWepsk()
local selection = UIDropDownMenu_GetText(WepskComboBox)
	if selection == "Swords" then
		wepsk = 43;
	elseif selection == "Unarmed" then
		wepsk = 136;
	elseif selection == "Thrown" then
		wepsk = 176;
	elseif selection == "Daggers" then
		wepsk = 173;
	elseif selection == "Maces" then
		wepsk = 54;
	elseif selection == "Dual Wield" then
		wepsk = 118;
	elseif selection == "Crossbow" then
		wepsk = 226;
	elseif selection == "Staves" then
		wepsk = 136;
	elseif selection == "Axes" then
		wepsk = 44;
	elseif selection == "Wand" then
		wepsk = 228;
	elseif selection == "Guns" then
		wepsk = 46;
	elseif selection == "Bows" then
		wepsk = 45;
	elseif selection == "Fist" then
		wepsk = 473;
	elseif selection == "Polearm" then
		wepsk = 229;
	elseif selection == "2H Axe" then
		wepsk = 172;
	elseif selection == "2H Mace" then
		wepsk = 160;
	elseif selection == "2H Swords" then
		wepsk = 55;
	end
	outSAY("learnsk "..wepsk.." "..WeaponSkillLvl:GetText());
end
-------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------
-- ItemSearchScript
----------The following code is under development. Please disregard.
-- Below vars are used throughout the item search
--item_search_results = {}
--itemName = {}
--itemSearched = false

--i = 1;

-- Fired when a server message is sent to the client
--function Chat_OnEvent(event, text)
	--if string.find(text, "Item") and ItemFormSearch:IsShown() and not itemSearched then
	--if (i < 26) then
		-- If the detected string is an item result
		--idlength, _, _, _ = string.find(text, ":");
		--item_search_results[i] = string.sub(text, 6, idlength-1);
		--itemName[i] = text;
		--ProcessItemSearch(item_search_results[i]);
		--i = i + 1;
	--end	
	--elseif string.find(text, "Search completed in ") then
	--itemSearched = true
	--elseif string.find(text, "Starting search of item ") then -- Reset if its a new search
		--for i=1, 25 do
			--getglobal("ItemFormSearchTexture"..i):Hide();
			--getglobal("ItemFormSearchLabelItemID"..i):Hide();
			--getglobal("ItemFormSearchButton"..i):Hide();
			--itemSearched = false
		--end
		--i = 1;
	--end
--end
--------
---function GetItemInfoTexture(name)
--_, _, _, _, _, _, _, _, _, texture = GetItemInfo(name);
--return texture
--end

-- Function to update each button when a result is recieved by the client
--function ProcessItemSearch(itemid)
	--getglobal("ItemFormSearchTexture"..i):Show();
	--getglobal("ItemFormSearchLabelItemID"..i):Show();
	--getglobal("ItemFormSearchButton"..i):Show();
	-- Update "number of results" text
	--text = "Results Found: "..i;
	--ItemFormSearchLabel2Label:SetText(text);
	--getglobal("ItemFormSearchLabelItemID"..i.."Label"):SetText(itemName[i]);
	--if(GetItemInfoTexture("item:"..itemid)) then
	--getglobal("ItemFormSearchTexture"..i.."Texture"):SetTexture(GetItemInfoTexture("item:"..itemid));
	--elseif(GetItemIcon("item:"..itemid)) then
	--getglobal("ItemFormSearchTexture"..i.."Texture"):SetTexture(GetItemIcon("item:"..itemid));
	--else
	--getglobal("ItemFormSearchTexture"..i.."Texture"):SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
	--end
--end

-- When a button is rolled over, show tooltip and update vars based on user cache
--function ResultButton_OnEnter(button_number, self)
	--GameTooltip:ClearLines();
	--GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -(self:GetWidth() / 2), 24)
	--GameTooltip:SetHyperlink("item:"..item_search_results[button_number]..":0:0:0:0:0:0:0");
	--GameTooltip:AddLine("Click to add to inventory");
	--GameTooltip:Show();
--end

--function ResultButton_OnClick(button_number)
    --outSAY("additem "..item_search_results[button_number]);
--end
---------------------------------------------
--			End of Item search		   --
---------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GMH Interface Options

function GMH_CancelOrLoad()
	GMHGUIFrame_ShowOnLoad:SetChecked(GMH_ShowOnLoad);
end

function GMH_Close()
	GMH_ShowOnLoad = GMHGUIFrame_ShowOnLoad:GetChecked();
end

function GMH_Defaults()
	GMHGUIFrame_ShowOnLoad:SetChecked(false); GMH_ShowOnLoad = false;
end

function GMHGUI_OnLoad(panel)
	GMHGUIFrame_ShowOnLoadText:SetText("Show on Load");
	panel.okay = function (self) GMH_Close(); end;
	panel.cancel = function (self)  GMH_CancelOrLoad(); end;
	panel.default = function (self) GMH_Defaults(); end;
	InterfaceOptions_AddCategory(panel);
end

function VIEWGUI_OnLoad(panel)
	VIEWGUIFrame_viewfullText:SetText("Full");
	VIEWGUIFrame_viewminipText:SetText("Mini P");
	VIEWGUIFrame_viewminilText:SetText("Mini L");
	panel.name = "Views"
	panel.okay = function (self) VIEW_Close(); end;
	panel.cancel = function (self)  VIEW_CancelOrLoad(); end;
	panel.default = function (self) VIEW_Defaults(); end;
	InterfaceOptions_AddCategory(panel);
end

function VIEW_CancelOrLoad()
VIEWGUIFrame_viewfull:SetChecked(false);
VIEWGUIFrame_viewminip:SetChecked(false);
VIEWGUIFrame_viewminil:SetChecked(false);
	if(gmhview == 2) then
		VIEWGUIFrame_viewminip:SetChecked(true);
	elseif(gmhview == 3) then
		VIEWGUIFrame_viewminil:SetChecked(true);
	else
		VIEWGUIFrame_viewfull:SetChecked(true);
	end
end

function VIEW_Close()
if VIEWGUIFrame_viewfull:GetChecked() then gmhview=1
elseif VIEWGUIFrame_viewminip:GetChecked() then gmhview=2
elseif VIEWGUIFrame_viewminil:GetChecked() then gmhview=3 end
end

function VIEW_Defaults()
VIEWGUIFrame_viewfull:SetChecked(true);
VIEWGUIFrame_viewminip:SetChecked(false);
VIEWGUIFrame_viewminil:SetChecked(false);
end


--the objectplay addition--


-- Start of code for Object Mover

local GPS = '.gps'
local cWorking = 0
local cMap = 0
local cX = 0
local cY = 0
local cZ = 0
local incX = 0
local incY = 0
local incZ = 0
local fID = 0

function EchelonedAssistant:PLAYER_DEAD()
    --SendChatMessage(".revive", "CHANNEL", nil, 1);
end

function EchelonedAssistant:CHAT_MSG_SYSTEM()
    if string.find(arg1,"Current Position") ~= nil then
        if cWorking == 1 then
            WorkString = string.gsub(arg1, '(|.........)', '') -- This removes any color formating
            cMap = string.gsub(string.match(WorkString,'%s%d*%s')," ","")
            t = {}
            cnt = 1
            for w in string.gmatch(WorkString,'%s.%d*%p%d%d') do
                t[cnt] = string.gsub(w," ","")
                cnt = cnt + 1
            end
            cX = t[1]
            cY = t[2]
            cZ = t[3]
            cO = t[4]
            --Calulate the new x y bassed on incX
            nX = cX + (math.cos(cO) * incX)
            nY = cY + (math.sin(cO) * incX)
            --rotate the O so we can do some math
            tD = math.deg(cO) + 90
            if tD > 360 then tD = tD - 360 end
            nO = math.rad(tD)
            --Calulate the new x y bassed on incX
            nX = nX + (math.cos(nO) * incY)
            nY = nY + (math.sin(nO) * incY)
            --Send the port
            SendChatMessage('.worldport '..cMap..' '..nX..' '..nY..' '..(cZ+incZ)..' '..cO)
            --console reloadui
            incX = 0
            incY = 0
            incZ = 0
            isChecked = CheckSpawn:GetChecked()
            if isChecked == 1 then
                isChecked2 = SaveSpawn:GetChecked()
                ObjectN = ObjectNumber:GetText()
                if isChecked2 == 1 then
                    SendChatMessage('.go spawn '..ObjectN..' 1')
                else
                    SendChatMessage('.go spawn '..ObjectN)
                end
            end
            cWorking = 0
        end
    end
    if string.find(arg1,"selected gameobject") ~= nil then
        if fID == 1 then
            SendChatMessage('.go info')
            fID = 2
        end
    end
    if string.find(arg1,"Entry:") ~= nil then
        if fID == 2 then
            WorkString = string.gsub(arg1, '(|.........)', '')
            WorkString = string.gsub(WorkString, 'Entry:', '')
            ObjectNumber:SetText(WorkString)
            fID = 3
        end        
    end
    if string.find(arg1,"Model:") ~= nil then
        if fID == 3 then
            WorkString = string.gsub(arg1, '(|.........)', '')
            WorkString = string.gsub(WorkString, 'Model:', '')
            ObjectMTxt:SetText(WorkString)
            fID = 0
        end        
    end
    if string.find(arg1,"Model:") ~= nil then
        WorkString = string.gsub(arg1, '(|.........)', '')
        WorkString = string.match(WorkString, '%d*%d')
        --ObjectPlay:LoadModel(WorkString)
    end
    if string.find(arg1,"You are not in range of any selectable objects") ~= nil then
        if fID == 1 then
            fID = 0
        end        
    end
end

function EchelonedAssistant:CheckToggle()
    isChecked = CheckSpawn:GetChecked()
    if isChecked == 1 then
        CheckSpawn:SetChecked(false)
    else
        CheckSpawn:SetChecked(true)
    end
end

function EchelonedAssistant:GetOID()
    if fID == 0 then
        fID = 1
        SendChatMessage('.go select')
    end
end

function EchelonedAssistant:DMUP()
    if cWorking == 0 then
        cWorking = 1
        incZ = ObjectHTxt:GetText()
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:DMDown()
    if cWorking == 0 then
        cWorking = 1
        incZ = 0 - ObjectHTxt:GetText()
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:DMLeft()
    if cWorking == 0 then
        cWorking = 1
        incY = ObjectWTxt:GetText()
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:DMRight()
    if cWorking == 0 then
        cWorking = 1
        incY = 0 - ObjectWTxt:GetText()
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:DMSS()
    if cWorking == 0 then
        cWorking = 1
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:DMSS2()
    isChecked = SaveSpawn:GetChecked()
    ObjectN = ObjectNumber:GetText()
    if isChecked == 1 then
        SendChatMessage('.go spawn '..ObjectN..' 1')
    else
        SendChatMessage('.go spawn '..ObjectN)
    end
end

function EchelonedAssistant:DMFront()
    if cWorking == 0 then
        cWorking = 1
        incX = ObjectLTxt:GetText()
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:DMBack()
    if cWorking == 0 then
        cWorking = 1
        incX = 0 - ObjectLTxt:GetText()
        SendChatMessage(GPS)
    end
end

function EchelonedAssistant:CustomMove()
    if cWorking == 0 then       
        if XDirTxt:GetText() == '-' then
            incX = 0 - ObjectLTxt:GetText()
        elseif  XDirTxt:GetText() == '+' then
            incX = ObjectLTxt:GetText()
        else
            incX = 0
        end
        if YDirTxt:GetText() == '-' then
            incY = 0 - ObjectWTxt:GetText()
        elseif  YDirTxt:GetText() == '+' then
            incY = ObjectWTxt:GetText()
        else
            incY = 0
        end
        if ZDirTxt:GetText() == '-' then
            incZ = 0 - ObjectHTxt:GetText()
        elseif  ZDirTxt:GetText() == '+' then
            incZ = ObjectHTxt:GetText()
        else
            incZ = 0
        end
        cWorking = 1
        SendChatMessage(GPS)
    end
end

-- code for Special items

function EchelonedAssistant:SpellClick()
    tM = ObjectMTxt:GetText();
    if string.len(tM) == 0 then
        print("Please input a Object Model")
    else
        tS = SpellIDTxt:GetText();
        if string.len(tS) == 0 then
            print("Please input a Spell Id")
        else
            tM = string.gsub(tM, '%s', '')
            tS = string.gsub(tS, '%s', '')
            SendChatMessage("#go "..tM.." 1 "..tS)
        end
    end    
end