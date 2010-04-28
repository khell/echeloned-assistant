--**********************************************************************
--**********************************************************************
-- SavedVariables
TicketChannel = "gm_sync_channel";

function OpenMain()
	if(gmhview == 2) then
		MinipForm:Show();
	elseif(gmhview == 3) then
		MiniForm:Show();
	else
		FullForm:Show();
	end
end

function ToggleChatbox()
    if (ChatForm == hidden) then 
        ChatForm:Show();
    elseif (ChatForm == shown) then
        ChatForm:Hide();
    end
end
    

function ToggleAddon()
	if addonopen then
		FullForm:Hide();
		MinipForm:Hide();
		MiniForm:Hide();
        PhaseForm:Hide();
        ChatForm:Hide();
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
		OpenMain();
		PSound("INTERFACESOUND_CHARWINDOWOPEN");
		addonopen = true;
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

function GMHelperOnLoad(self)
	self:RegisterForDrag("RightButton");
end

function PSound(sound)
	PlaySound(sound);
end

function GMH_EmptyField()
	ShowMessage("Please complete the required fields!");
end

-- Binding Variables
BINDING_HEADER_GMHelper = "Echeloned Assistant";
BINDING_NAME_ToggleAddon = "Toggles Echeloned Assistant";
BINDING_HEADER_Chatbox = "Chatbox";
BINDING_NAME_ToggleChatbox = "toggle Chatbox";
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

function ParPlayer()
	outSAY("paralyze "..CharName:GetText());
end

function UnParPlayer()
	outSAY("unparalyze "..CharName:GetText());
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
    outSAY("roleplay listplayers");
end

function RoleplayListRo()
    outSAY("roleplay listro");
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
function Announce()
    outSAY("announce "..AnnounceChatbox:GetText());
 end
 
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
    outSAY("whisper "..WhisperNameBox:GetText().." "..WhisperBox:GetText());
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
	if NoSaveCheck:GetChecked() then a = "" else a = "1" end
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

function PhaseToggleFlight()
    outSAY("phase toggleflight");
end

function PhaseToggleCheats()
    outSAY("phase togglecheats");
end

function PhasePlaySound()
    outSAY("phase playsound "..PhaseOwnerChatbox:GetText());
end

function PhaseAnn()
    outSAY("phase announce "..PhaseOwnerChatbox:GetText());
end

function PhaseToggleCustom()
    outSAY("phase togglecustom");
end

function PhaseSetStarting()
    outSAY("phase setstarting");
end

function PhaseToggleSanc()
    outSAY("phase togglesanc");
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
-- QuickPortalScript
function QPStormwind()
	outSAY("go spawn 176296 1");
end

function QPIronforge()
	outSAY("go spawn 176497 1");
end

function QPDarnassus()
	outSAY("go spawn 176498 1");
end

function QPExodar()
	outSAY("go spawn 182351 1");
end

function QPOrgrimmar()
	outSAY("go spawn 176499 1");
end

function QPUndercity()
	outSAY("go spawn 176501 1");
end

function QPThunderbluff()
	outSAY("go spawn 176500 1");
end

function QPSilvermoon()
	outSAY("go spawn 182352 1");
end

function QPShattrath()
	outSAY("go spawn 183384 1");
end

function QPDalaran()
	outSAY("go spawn 191164 1");
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
    outSAY("gps "..XCord2:GetText().." "..YCord2:GetText().." "..ZCord2:GetText().." "..OrientationBox2:GetText());
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
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GMH_Main(msg)
msg = string.lower(msg)
if msg == "show" or msg == "hide" then
	ToggleAddon()
else
	GMH_MainMsg("/gmh - displays this menu");
	GMH_MainMsg("/gmh (show or hide) - Shows or Hides GMH");
	GMH_MainMsg("/gm (on or off) - Toggles GM");
	GMH_MainMsg("/revive - revives yourself");
	GMH_MainMsg("/recallport or /recall or /port - Ports yourself to location");
	GMH_MainMsg("/npcspawn - spawns NPC - e.g. /npcspawn 1");
	GMH_MainMsg("/npcdelete - deleted targeted NPC");
	GMH_MainMsg("/additem - adds item to you or target - e.g. /additem 1");
	GMH_MainMsg("/announce or /an - broadcasts message to server in chatbox");
	GMH_MainMsg("/wannounce or /wan - broadcasts message to server on the screen");
	GMH_MainMsg("/gmannounce or /gman - broadcasts message to other GMs in chatbox");
	GMH_MainMsg("/savedannounce or /sa - broadcasts saved message");
	GMH_MainMsg("/showsavedannounce, /showsaved, or /ssa - Shows you Saved Announcement");
	GMH_MainMsg("/advanceall or /advanceallskills - Advances all of your or your target's skills by X.");
	GMH_MainMsg("/revive - revives yourself");
	GMH_MainMsg("/reviveplr - revives plr x");
	GMH_MainMsg("/learn - learns spells to you or targeted player - e.g. /learn all - Learns all spells for your class");
	GMH_MainMsg("/unlearn - unlearns spell id on you or targeted player - e.g. /unlearn 1");
	GMH_MainMsg("/achievecomplete - Completes achievement on targeted player - e.g. /achievecomplete 1");
	GMH_MainMsg("/lookup - Looks up term under specified subject - e.g. /lookup item Gamemaster");
	GMH_MainMsg("/kickplayer - Kicks specified player with or without reason. - e.g. /kickplayer Name Reason");
end
end

function GMH_MainMsg(msg)
	ShowMessage(msg, "00FF00");
end

function GMH_GMToggle(msg)
msg = string.lower(msg)
	if msg == "on" or msg == "off" then
		outSAY("gm "..msg);
	else
		ShowMessage("Available options: on or off");
	end
end

function GMH_Revive()
	outSAY("revive");
end

function GMH_NPCSpawn(msg)
	outSAY("npc spawn "..msg);
end

function GMH_NPCDelete()
	outSAY("npc delete");
end

function GMH_AddItem(msg)
	outSAY("additem "..msg);
end

function GMH_Announce(msg)
	outSAY("announce "..msg);
end

function GMH_RecallPort(msg)
	outSAY("recall port "..msg);
end

function GMH_Learn(msg)
	outSAY("learn "..msg);
end

function GMH_UnLearn(msg)
	outSAY("unlearn "..msg);
end

function GMH_Revive(msg)
	outSAY("revive");
end

function GMH_RevivePlr(msg)
	outSAY("reviveplr "..msg);
end

function GMH_AdvanceAllSkills(msg)
	outSAY("advanceallskills "..msg);
end

function GMH_Lookup(msg)
args = {strsplit(" ",msg)};
if args[2] then
outSAY("lookup "..args[1].." "..args[2]);
else
ShowMessage("Please enter a search term.");
end
end

function GMH_Kick(msg)
args = {strsplit(" ",msg)};
if args[2] then a2 = string.sub(msg,string.len(args[1])+2) else a2 = "" end
outSAY("kickplayer "..args[1].." "..a2);
end

--Plays sound files named in the DBC
function GMH_Sounds(msg)
	PSound(msg);
end

function GMH_TableReload(msg)
	outSAY("reload "..msg);
end

function GMH_ShowMessage(msg)
ShowMessage(msg, "FFFFFF")
end

if select(4, GetBuildInfo()) == 30100 then
	SLASH_GMHRELOAD1 = "/reload"
	SlashCmdList["GMHRELOAD"] = 
	function()
		ReloadUI()
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SlashCmdList["GMH"] = GMH_Main;
SLASH_GMH1="/ewa";
SlashCmdList["GMHGMTOGGLE"] = GMH_GMToggle;
SLASH_GMHGMTOGGLE1="/gm";
SlashCmdList["REVIVE"] = GMH_Revive;
SLASH_REVIVE1="/revive";
SlashCmdList["GMHSPAWN"] = GMH_NPCSpawn;
SLASH_GMHSPAWN1="/npcspawn";
SlashCmdList["GMHDELETE"] = GMH_NPCDelete;
SLASH_GMHDELETE1="/npcdelete";
SlashCmdList["GMHADDITEM"] = GMH_AddItem;
SLASH_GMHADDITEM1="/additem";
SlashCmdList["GMHANNOUNCE"] = GMH_Announce;
SLASH_GMHANNOUNCE1="/announce";
SLASH_GMHANNOUNCE2="/an";
SlashCmdList["GMHGMANNOUNCE"] = GMH_GMAnnounce;
SLASH_GMHGMANNOUNCE1="/gmannounce";
SLASH_GMHGMANNOUNCE2="/gman";
SlashCmdList["GMHRECALLPORT"] = GMH_RecallPort;
SLASH_GMHRECALLPORT1="/recallport";
SLASH_GMHRECALLPORT2="/recall";
SLASH_GMHRECALLPORT3="/port";
SlashCmdList["GMHSAVEDANNOUNCE"] = GMH_SavedAnnounce;
SLASH_GMHSAVEDANNOUNCE1="/savedannounce";
SLASH_GMHSAVEDANNOUNCE2="/sa";
SlashCmdList["GMHSHOWSAVEDANNOUNCE"] = GMH_ShowSavedAnn;
SLASH_GMHSHOWSAVEDANNOUNCE1="/showsavedannounce";
SLASH_GMHSHOWSAVEDANNOUNCE2="/showsaved";
SLASH_GMHSHOWSAVEDANNOUNCE3="/ssa";
SlashCmdList["GMHLEARN"] = GMH_Learn;
SLASH_GMHLEARN1="/learn";
SlashCmdList["GMHUNLEARN"] = GMH_UnLearn;
SLASH_GMHUNLEARN1="/unlearn";
SlashCmdList["GMHREVIVE"] = GMH_Revive;
SLASH_GMHREVIVE1="/revive";
SlashCmdList["GMHREVIVEPLR"] = GMH_RevivePlr;
SLASH_GMHREVIVEPLR1="/reviveplr";
SlashCmdList["GMHADVANCEALL"] = GMH_AdvanceAllSkills;
SLASH_GMHADVANCEALL1="/advanceall";
SLASH_GMHADVANCEALL2="/advanceallskills";
SlashCmdList["GMHACHIEVECOMPLETE"] = GMH_AchievementComplete;
SLASH_GMHACHIEVECOMPLETE1="/achievecomplete";
SlashCmdList["GMHLOOKUP"] = GMH_Lookup;
SLASH_GMHLOOKUP1="/lookup";
SlashCmdList["GMHKICK"] = GMH_Kick;
SLASH_GMHKICK1="/kickplayer";
SlashCmdList["GMHSOUND"] = GMH_Sounds;
SLASH_GMHSOUND1="/ps";
SlashCmdList["GMHTR"] = GMH_TableReload;
SLASH_GMHTR1="/tr";
SLASH_GMHTR2="/table";
SlashCmdList["GMHSHOWMESSAGE"] = GMH_ShowMessage;
SLASH_GMHSHOWMESSAGE1="/showmessage";


---------------------------------------------
--		  End of Advance Command		 --
---------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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