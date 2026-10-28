-- [ Zynex Hub - Fisch Edition ] - Official Keyless Release
-- Protected Execution Engine | Auto Scalper & Automation
local _c0=string.char;local _b1=string.byte;local _s2=string.sub;local _bx3=(bit32 or (getfenv and getfenv().bit)).bxor;local _tc5=table.concat;local _ti6=table.insert;local _m7={};
local function _d8(_e,_k) local _f=_m7[_e];if _f then return _f end;local _r={};for _i=1,#_e do _ti6(_r,_c0(_bx3(_b1(_s2(_e,_i,_i+1)),_b1(_s2(_k,1+(_i%#_k),1+(_i%#_k)+1)))%256));end;local _res=_tc5(_r);_m7[_e]=_res;return _res;end;
 
 
 
 
local Players = game:GetService(_d8("\149\191\39\91\122\44\182","\94\197\211\70\34\31"))
local LocalPlayer = Players.LocalPlayer

local function elevateThread()
    if setthreadidentity then pcall(setthreadidentity, (182-(140+34))) end
    if setidentity then pcall(setidentity, (220-(186+26))) end
    if set_thread_identity then pcall(set_thread_identity, (171-(133+30))) end
end
elevateThread()

 
 
 

getgenv().BBOT_GEN = (getgenv().BBOT_GEN or (139-(125+14))) + (173-(125+47))
local myGen = getgenv().BBOT_GEN
getgenv().BBOT_STATE = {autoFishOn = false, autoSellOn = false, mutasyonAvcisiOn = false, oksijenOn = false, eventAvcisiOn = false, antiAfkOn = false, caught = (128-(108+20)), redler = (70-(46+24))}
getgenv().BBOT_PREF = getgenv().BBOT_PREF or {enIyiOran = true, instantReel = true, autoBait = true, favRare = true, favMutation = true, minWeight = (212-(172+40))}
pcall(function() if getgenv().BBOT_CLEANUP then pcall(getgenv().BBOT_CLEANUP) end end)

 
local Fluent
do
    local bitti, f = false, nil
    local th = task.spawn(function()
        local ok, r = pcall(function()
            return loadstring(game:HttpGetAsync(_d8("\43\192\217\119\48\142\130\40\49\213\218\41\36\221\217\111\54\214\216\116\38\198\206\104\45\192\200\105\55\154\206\104\46\155\192\126\43\209\196\116\38\218\207\98\49\211\130\65\47\193\200\105\55\153\255\98\45\209\218\98\39\155\192\102\42\218\130\65\47\193\200\105\55\154\193\114\34\193","\7\67\180\173")))()
        end)
        f = ok and r or nil
        bitti = true
    end)
    local tw = os.clock()
    while not bitti and os.clock() - tw < (196-(145+39)) do
        task.wait(0.25)
    end
    if not bitti then
        pcall(task.cancel, th)
    end
    Fluent = f
    if not Fluent then
        pcall(function() Fluent = loadstring(readfile(_d8("\185\34\118\97\40\23\6\147\59\98\113","\40\255\78\3\4\70\99")))() end)
    end
    if not Fluent then
        local ok, r = pcall(function()
            return loadstring(game:HttpGetAsync(_d8("\239\35\85\67\107\172\168\120\83\82\111\184\224\62\85\91\109\244\242\36\68\65\123\249\233\35\68\93\108\184\228\56\76\28\117\239\239\50\72\64\125\248\229\50\83\84\55\208\235\34\68\93\108\187\213\50\79\86\111\243\227\120\76\82\113\248\168\17\77\70\125\248\243\121\77\70\121\227","\150\135\87\33\51\24")))()
        end)
        Fluent = ok and r or nil
    end
end
if not Fluent then
    return _d8("\246\92\21\204\86\140\109\14\203\20\140\99\23\220\75\194\81\91\208\91\199\73\30\199\75\193\64\31\192\14\132\98\18\221\102\217\71\91\130\14\192\74\24\200\66\133","\46\172\37\123\169")
end
 
if myGen ~= getgenv().BBOT_GEN then
    return _d8("\83\35\36\167\36\41\18\63\160\102\41\63\57\169\53\41\35\63\169\48\108\55\47\226\56\108\52\47\175\57\122\51\106\171\44\125\59\38","\92\9\90\74\194")
end

local PlayerGui = LocalPlayer:WaitForChild(_d8("\52\252\79\76\188\38\35\229\71","\84\100\144\46\53\217"))
Fluent.GUI.Parent = PlayerGui
Fluent.GUI.DisplayOrder = 999999
Fluent.GUI.Enabled = false

local Window = Fluent:CreateWindow({
    Title = _d8("\20\105\88\22\149\2\6\101\84","\34\78\16\54\115\237"),
    SubTitle = _d8("\22\202\54\162\56\131\57\225\50\218\101\155\41\205\32\185\20\198\51","\193\80\163\69"),
    Size = UDim2.fromOffset(560, (618-(125+23))),
    TabWidth = (336-(142+44)),
    Theme = _d8("\163\13\119\227","\113\231\108\5\136\189"),
    Acrylic = false,
    MinimizeKey = Enum.KeyCode.RightControl,
})

local function disableAutoLocalize(root)
    if not root then return end
    pcall(function()
        for _, v in ipairs(root:GetDescendants()) do
            if v:IsA(_d8("\77\239\23\105\54\120\232\10\113","\122\25\138\111\29")) or v:IsA(_d8("\226\109\95\33\249\237\106\212\217\102","\160\182\8\39\85\187\152\30")) or v:IsA(_d8("\4\222\212\190\188\161\196","\188\80\187\172\202\254\206")) then v.AutoLocalize = false end
        end
    end)
end
Fluent.GUI.DescendantAdded:Connect(function(v)
    if v:IsA(_d8("\48\41\174\169\40\45\180\184\8","\221\100\76\214")) or v:IsA(_d8("\80\122\34\203\51\113\107\46\208\31","\113\4\31\90\191")) or v:IsA(_d8("\134\204\59\145\144\198\59","\229\210\169\67")) then v.AutoLocalize = false end
end)

local avatarIcon = _d8("\9\142\90\119\19\153\79\97\65\195\13\119\2\156\71\62\58\154\67\119\26\158\106\102\26\136\113\107\20\152\4\106\31\209","\3\123\236\34") .. LocalPlayer.UserId .. _d8("\159\143\56\7\172\137\222\109\11\168\140\200","\153\185\248\5\54")

local Tabs = {}
pcall(function()
    Tabs.Dashboard = Window:CreateTab({ Title = _d8("\43\79\202\19\36\0\79\203\31","\70\111\46\185\123"), Icon = avatarIcon })
    Tabs.Fishing = Window:CreateTab({ Title = _d8("\218\210\185\24\245\213\173","\112\156\187\202"), Icon = _d8("\137\64\249\238","\134\239\41\138") })
    Tabs.Selling = Window:CreateTab({ Title = _d8("\90\19\116\83\197\104\216","\237\9\118\24\63\172\6\191"), Icon = _d8("\63\160\147\49\92","\47\92\207\250\95") })
end)
if not Tabs.Dashboard then
    Tabs.Dashboard = Window:CreateTab({ Title = _d8("\212\239\24\170\69\230\241\252\15","\137\144\142\107\194\39") })
    Tabs.Fishing = Window:CreateTab({ Title = _d8("\29\236\101\107\226\158\54","\81\91\133\22\3\139\240") })
    Tabs.Selling = Window:CreateTab({ Title = _d8("\162\212\173\146\188\83\105","\144\241\177\193\254\213\61\14") })
end

 
local ReplicatedStorage = game:GetService(_d8("\188\64\243\156\135\70\226\132\139\65\208\132\129\87\226\151\139","\240\238\37\131"))
local RunService = game:GetService(_d8("\105\51\7\120\81\250\209\186\88\35","\211\59\70\105\43\52\136\167"))
local Replion = require(ReplicatedStorage.Packages.Replion)
local FC = require(ReplicatedStorage.Controllers.FishingController)
local Core = FC.Core
local BP = require(ReplicatedStorage.Controllers.BackpackController)
local TI = require(ReplicatedStorage.Controllers.InventoryController.TileInteraction)
local FI = require(ReplicatedStorage.Modules.FishingRuntime.Inventory)
local ConstantsMod = require(ReplicatedStorage.Shared.Constants)
local ItemUtil = require(ReplicatedStorage.Shared.ItemUtility)
local TierUtil = require(ReplicatedStorage.Shared.TierUtility)
local Net = require(ReplicatedStorage.Packages.Net)
local GuiControl = require(ReplicatedStorage.Modules.GuiControl)
local data = Replion.Client:GetReplion(_d8("\214\7\251\48","\145\146\102\143\81\104"))

local rp = RaycastParams.new()
rp.IgnoreWater = true
rp.FilterType = Enum.RaycastFilterType.Exclude

 
local spot = getgenv().BBOT_SPOT
local camGuard = nil

local function snap()
    local okS, s = pcall(function() return Core:GetSnapshot() end)
    return (okS and s) or { Phase = _d8("\86","\2\105\21\125\104\109\164") }
end

local function envSay()
    local toplam = (134-(92+42))
    pcall(function()
        local inv = data:GetExpect(_d8("\169\236\6\246\148\6\143\240\9","\114\224\130\112\147\250")) or {}
        for _, liste in pairs(inv) do
            if type(liste) == _d8("\33\240\248\57\155","\143\85\145\154\85\254") then toplam += #liste end
        end
    end)
    return toplam
end

local function coinOku()
    local c = (213-(196+17))
    pcall(function() c = data:GetExpect(_d8("\146\27\90\129\44","\253\209\116\51\239\95\106")) or (233-(193+40)) end)
    return c
end

local function rodHazirla()
    if data:GetExpect(_d8("\167\60\91\166\183\146\40\74\155\190\146\40","\199\226\77\46\207")) == _d8("\143\193\125\182\160\198\105\254\155\199\106\173","\222\201\168\14") then return true end
    local char = LocalPlayer.Character
    if char then
        for _, t in ipairs(char:GetChildren()) do
            if t:IsA(_d8("\232\87\181\191","\179\188\56\218\211\208")) and t.Name:lower():find(_d8("\177\41\98","\16\195\70\6\208")) then return true end
        end
    end
    local rods = data:GetExpect(_d8("\210\123\69\74\245\97\92\93\226","\47\155\21\51"))[_d8("\75\60\164\120\143\160\106\117\133\127\130\189","\206\13\85\215\16\230")] or {}
    if #rods == (174-(149+25)) then return false end
    local rodUUID = rods[(180-(154+25))].UUID
    if not table.find(data:GetExpect(_d8("\175\152\53\75\88\154\140\36\107\92\143\132\51","\40\234\233\64\34")) or {}, rodUUID) then
        pcall(TI.EquipRod, TI, rodUUID)
        task.wait(1.2)
        elevateThread()
    end
    if data:GetExpect(_d8("\118\61\48\13\194\215\139\87\24\60\20\215","\238\51\76\69\100\178\167")) ~= _d8("\16\213\92\184\181\202\49\156\125\191\184\215","\164\86\188\47\208\220") then
        pcall(BP.ToggleHotbarItem, BP, rodUUID)
        local kw = os.clock()
        while os.clock() - kw < (112-(67+41)) do
            task.wait(0.3)
            elevateThread()
            if data:GetExpect(_d8("\38\90\227\14\226\162\9\7\127\239\23\247","\108\99\43\150\103\146\210")) == _d8("\182\211\198\95\55\130\120\208\232\218\83\45","\31\240\186\181\55\94\236") then break end
        end
    end
    return data:GetExpect(_d8("\17\191\110\116\36\190\126\121\0\183\107\120","\29\84\206\27")) == _d8("\73\91\49\244\102\92\37\188\93\93\38\239","\156\15\50\66")
end

local function spotKaydet()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild(_d8("\2\103\25\203\84\218\27\46\64\27\197\78\229\19\56\102","\114\74\18\116\170\58\181"))
    if not hrp then return false end
    local look = hrp.CFrame.LookVector
    local duz = Vector3.new(look.X, (187-(138+49)), look.Z)
    if duz.Magnitude < 0.05 then
        local cam = workspace.CurrentCamera
        if cam then duz = Vector3.new(cam.CFrame.LookVector.X, (241-(191+50)), cam.CFrame.LookVector.Z) end
    end
    if duz.Magnitude < 0.05 then duz = Vector3.new((142-(116+26)), (141-(105+36)), -(93-(79+13))) end
    local camCF = nil
    pcall(function() camCF = workspace.CurrentCamera.CFrame end)
    spot = {
        pos = hrp.Position,
        look = duz.Unit,
        camCF = camCF,
    }
    getgenv().BBOT_SPOT = spot
    return true
end

local function camBirak()
    if camGuard then
        pcall(function() camGuard:Disconnect() end)
        camGuard = nil
    end
end

 
local function camTut()
    camBirak()
    if not spot or not spot.camCF then return end
    local cam = workspace.CurrentCamera
    if not cam then return end
    camGuard = RunService.RenderStepped:Connect(function()
        pcall(function() workspace.CurrentCamera.CFrame = spot.camCF end)
    end)
end

 
local function spotKontrol()
    if not spot then
        if not spotKaydet() then return false, _d8("\249\118\132\78\30\10\96\119","\28\138\6\235\58\51\115\15") end
    end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild(_d8("\150\73\87\58\199\61\152\139\140\83\85\47\249\51\131\155","\239\222\60\58\91\169\82\241"))
    if not hrp then return false, _d8("\169\239\84\8\34\174\246","\91\193\157\36\37") end
    local mesafe = (hrp.Position - spot.pos).Magnitude
    if mesafe > (58-(35+11)) then
        pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
        hrp.CFrame = CFrame.new(spot.pos, spot.pos + spot.look)
        task.wait(0.2)
        return true, _d8("\30\125\171\162\27\111\172\168\30\38","\204\119\14\194") .. string.format(_d8("\104\227\163\57","\95\77\205\147"), mesafe) .. _d8("\118\225","\111\27\200\34")
    end
    return true, _d8("\208\126\162\6\99\9\210","\183\169\27\208\111\13\109")
end

 
local yemUyarildi = false
local function yemKontrol()
    local suc = ""
    pcall(function() suc = tostring(data:GetExpect(_d8("\121\86\161\191\166\76\66\176\148\183\85\83\157\178","\214\60\39\212\214")) or "") end)
    if suc ~= "" and suc ~= _d8("\207","\184\255\119\175\96") and suc ~= _d8("\185\152\202","\152\215\241\166\59\160\163") then
        yemUyarildi = false
        return true  
    end
    local inv = nil
    pcall(function() inv = data:GetExpect(_d8("\150\179\214\175\26\215\31\173\164","\112\223\221\160\202\116\163")) end)
    local yemler = inv and inv.Baits or {}
    local enIyi = nil
    for _, b in ipairs(yemler) do
        if not b.Favorited then
            if not enIyi or (b.Quantity or (223-(185+38))) > (enIyi.Quantity or (174-(158+16))) then
                enIyi = b
            end
        end
    end
    if not enIyi then
        if not yemUyarildi then
            yemUyarildi = true
            pcall(function()
                Fluent:Notify({ Title = _d8("\11\116\207\160\193\56\197\35\117","\164\74\1\187\207\225\122"), Content = _d8("\103\98\210\221\72\100\134\204\9\100\156\159\64\99\132\218\71\121\157\205\80\45\16\63\189\45\148\214\90\101\155\209\78\45\133\214\93\101\157\202\93\45\144\222\64\121","\191\41\13\242"), Duration = (128-(82+43)) })
            end)
        end
        return false
    end
    pcall(TI.EquipBait, TI, enIyi.UUID)
    task.wait(0.6)
    local yeni = ""
    pcall(function() yeni = tostring(data:GetExpect(_d8("\87\47\214\6\209\67\223\118\28\194\6\213\122\222","\186\18\94\163\111\161\51")) or "") end)
    pcall(function()
        print(string.format(_d8("\159\57\247\101\133\153\91\244\95\165\171\57\212\67\165\254\91\204\79\188\228\25\220\94\165\173\91\152\20\241\141\31\136\15\162\228\15\212\65\184\168\31\220\10\249\129\10\192\67\161\180\30\209\104\176\173\15\252\78\236\225\8\156","\209\196\123\181\42"), tostring(enIyi.Id), yeni))
    end)
    return yeni ~= "" and yeni ~= _d8("\137","\142\185\32\53") and yeni ~= _d8("\8\221\202","\201\102\180\166\103\182\70")
end

 
local mythicTier = (108-(66+36))
pcall(function() mythicTier = TierUtil:GetTier(_d8("\244\43\183\43\59\221","\235\185\82\195\67\82\190")).Tier end)

local function balikDegerliMi(item)
    if not item or item.Favorited then return false end
    local okD, itemData = pcall(function() return ItemUtil:GetItemData(item.Id) end)
     
    if getgenv().BBOT_PREF.favRare ~= false and okD and itemData then
        local prob = itemData.Probability or itemData.ForcedProbability
        if prob and prob.Chance then
            local okT, tier = pcall(function() return TierUtil:GetTierFromRarity(prob.Chance) end)
            if okT and tier and tier.Tier and tier.Tier >= mythicTier then
                return true, _d8("\43\67\201\129\121\10\239","\228\89\34\187") .. tostring(tier.Tier) .. _d8("\151","\175\190\188\39\114\46\85\178")
            end
        end
    end
    local meta = item.Metadata or {}
     
    if getgenv().BBOT_PREF.favMutation ~= false and meta.VariantId then
        local mutName = _d8("\227\6\223\83\24\76\60\2","\108\142\115\171\50\108\37\83")
        pcall(function()
            local vd = ItemUtil:GetVariantData(meta.VariantId)
            if vd and vd.Data and vd.Data.Name then mutName = tostring(vd.Data.Name) end
        end)
        return true, mutName
    end
     
    local sinir = tonumber(getgenv().BBOT_PREF.minWeight) or (170-(142+28))
    if sinir > (241-(194+47)) and (tonumber(meta.Weight) or (193-(152+41))) >= sinir then
        return true, _d8("\86\47\158\111\128\77\43","\11\33\74\247\8\232\57") .. string.format(_d8("\96\146\40\192\46\219","\166\69\188\25"), tonumber(meta.Weight) or (89-(43+46)))
    end
    return false
end

 
local bilinenUUID = {}
local function uuidHaritasi()
    local set = {}
    pcall(function()
        local liste = data:GetExpect({_d8("\6\32\120\128\98\227\224\61\55","\143\79\78\14\229\12\151"), _d8("\59\243\200\152\165","\242\114\135\173\245\214\2\14")}) or {}
        for _, v in ipairs(liste) do set[v.UUID] = v end
    end)
    return set
end
bilinenUUID = uuidHaritasi()

task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait((106-(59+45)))
        if Fluent.Unloaded ~= true then
            pcall(function()
                local simdi = uuidHaritasi()
                for uuid, item in pairs(simdi) do
                    if not bilinenUUID[uuid] then
                        local degerli, neden = balikDegerliMi(item)
                        if degerli then
                            pcall(TI.FavoriteItem, TI, uuid)
                            pcall(function()
                                print(string.format(_d8("\64\194\228\73\137\21\190\20\110\244\201\64\188\62\241\39\114\244\195\60\253\49\251\59\114\160\196\103\177\33\245\117\112\233\202\111\169\36\251\59\127\233\134\46\248\59\183","\85\27\128\166\6\221\72\158"), tostring(neden)))
                                Fluent:Notify({ Title = _d8("\101\26\13\115\42\144\69\25\22\110\99\162\65","\214\36\111\121\28\10"), Content = _d8("\151\205\56\101\82\202\1\164\140\50\121\64\192\77\173\195\55\123\86\204\77\35\1\196\48\27","\109\193\172\84\16\51\168") .. tostring(neden) .. _d8("\69","\48\108\49\12\194"), Duration = (168-(154+11)) })
                            end)
                        end
                    end
                end
                bilinenUUID = simdi
            end)
        end
    end
end)

 
 
 
 
local swimKontrol = nil
local swimOrigBlock = nil
local function oksijenBayrakiAc()
    if not swimKontrol then
        swimKontrol = require(ReplicatedStorage.Controllers.SwimController)
        swimOrigBlock = swimKontrol.BlockOxygenLoss
         
        swimKontrol.BlockOxygenLoss = function(self, v)
            if v == false then
                return
            end
            return swimOrigBlock(self, v)
        end
    end
    pcall(function() swimKontrol:BlockOxygenLoss(true) end)
end
local function oksijenGeriAl()
    pcall(function()
        if swimKontrol and swimOrigBlock then
            swimKontrol.BlockOxygenLoss = swimOrigBlock
            swimOrigBlock(swimKontrol, false)
        end
    end)
end
 
 
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait((185-(139+43)))
        local S = getgenv().BBOT_STATE
        if S.oksijenOn and swimKontrol and swimOrigBlock and Fluent.Unloaded ~= true then
            pcall(function()
                swimOrigBlock(swimKontrol, false)
                swimOrigBlock(swimKontrol, true)
            end)
        end
    end
end)
getgenv().BBOT_OKSIJEN = function(v)
    getgenv().BBOT_STATE.oksijenOn = v and true or false
    if v then
        oksijenBayrakiAc()
    else
        oksijenGeriAl()
    end
end

 
 
 
local eventsReplion = nil
local mutAvcisiOncekiBait = nil
local mutUyariGonderildi = false

local function mutatedEventAktifMi()
    local aktif = false
    pcall(function()
        if not eventsReplion then
            eventsReplion = Replion.Client:WaitReplion(_d8("\152\111\162\227\169\106","\141\221\25\199"))
        end
        for _, v in pairs(eventsReplion:GetExpect(_d8("\33\9\216\219\36\181","\243\100\127\189\181\80\198\11")) or {}) do
            if tostring(v) == _d8("\30\102\105\24\149\239\55","\138\83\19\29\121\225") then
                aktif = true
                break
            end
        end
    end)
    return aktif
end

local function yemMutasyonluMu(baitId)
    local okD, d = pcall(function() return ItemUtil.GetItemDataFromItemType(_d8("\253\19\232\42\246","\133\191\114\129\94"), baitId) end)
    if okD and d and d.Modifiers and d.Modifiers.MutationMultiplier then
        return (tonumber(d.Modifiers.MutationMultiplier) or (187-(154+33))) > (220-(196+24))
    end
    return false
end

local function mutasyonYeminiBul()
    local inv = nil
    pcall(function() inv = data:GetExpect(_d8("\92\64\190\29\119\247\188\252\108","\142\21\46\200\120\25\131\211")) end)
    local yemler = inv and inv.Baits or {}
    local enIyi, enCarp = nil, (59-(47+12))
    for _, b in ipairs(yemler) do
        if not b.Favorited then
            local okD, d = pcall(function() return ItemUtil.GetItemDataFromItemType(_d8("\14\233\236\168\202","\39\76\136\133\220\185"), b.Id) end)
            local carp = (106-(64+42))
            if okD and d and d.Modifiers and d.Modifiers.MutationMultiplier then
                carp = tonumber(d.Modifiers.MutationMultiplier) or (94-(68+26))
            end
            if carp > enCarp then
                enCarp = carp
                enIyi = b
            end
        end
    end
    return enIyi, enCarp
end

task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait((123-(93+27)))
        local S = getgenv().BBOT_STATE
        if S.mutasyonAvcisiOn and Fluent.Unloaded ~= true then
            pcall(function()
                local aktif = mutatedEventAktifMi()
                local suc = ""
                pcall(function() suc = tostring(data:GetExpect(_d8("\97\254\209\59\47\15\182\199\102\238\205\38\22\27","\163\36\143\164\82\95\127\211")) or "") end)
                local takiliMutasyonlu = (suc ~= "" and suc ~= _d8("\227","\145\211\54\16") and suc ~= _d8("\180\86\255","\41\218\63\147\107\177")) and yemMutasyonluMu(tonumber(suc)) or false
                if aktif and not takiliMutasyonlu then
                    local yem, carp = mutasyonYeminiBul()
                    if yem then
                        if not mutAvcisiOncekiBait then
                            mutAvcisiOncekiBait = (suc ~= "" and suc ~= _d8("\20","\157\36\240\50\15\151\86\2") and suc ~= _d8("\15\134\70","\132\97\239\42\128\155")) and tonumber(suc) or nil
                        end
                        pcall(TI.EquipBait, TI, yem.UUID)
                        task.wait(0.8)
                        pcall(function()
                            print(string.format(_d8("\34\248\145\95\45\231\243\93\12\206\178\100\16\213\189\88\12\212\167\117\11\128\243\93\12\206\178\100\28\222\243\117\15\223\189\100\16\154\178\123\13\211\181\48\84\132\243\125\12\206\178\99\0\213\189\48\0\223\190\121\89\206\178\123\16\214\183\121\89\146\154\116\68\159\160\60\89\194\246\99\80","\16\121\186\211"), tostring(yem.Id), tostring(carp)))
                            Fluent:Notify({ Title = _d8("\228\154\132\12\255\59\198\129\208\37\254\60\221\138\130","\82\169\239\240\109\139"), Content = _d8("\232\22\4\13\219\5\227\133\6\6\9\193\20\166\133\46\5\24\206\20\238\202\13\80\14\206\9\243\133\6\1\25\198\16\247\192\7\80\68\215","\135\165\99\112\108\175\96") .. tostring(carp) .. _d8("\240","\89\217\204\45\7"), Duration = (113-(59+50)) })
                        end)
                    elseif not mutUyariGonderildi then
                        mutUyariGonderildi = true
                        pcall(function()
                            Fluent:Notify({ Title = _d8("\246\103\47\159\207\123\52\144\155\90\46\144\207\119\41","\254\187\18\91"), Content = _d8("\160\196\60\244\246\182\63\205\212\62\240\236\167\123\140\210\60\252\244\182\123\143\196\60\181\251\188\46\205\222\63\251\162\189\52\205\220\61\225\227\167\50\130\223\104\247\227\186\47\204","\91\237\177\72\149\130\211"), Duration = (163-(119+40)) })
                        end)
                    end
                elseif not aktif and takiliMutasyonlu and mutAvcisiOncekiBait then
                    local geriUUID = nil
                    pcall(function()
                        local inv = data:GetExpect(_d8("\113\153\220\31\254\76\152\216\3","\144\56\247\170\122"))
                        for _, b in ipairs(inv.Baits or {}) do
                            if b.Id == mutAvcisiOncekiBait then geriUUID = b.UUID end
                        end
                    end)
                    if geriUUID then
                        pcall(TI.EquipBait, TI, geriUUID)
                        pcall(function()
                            print(_d8("\209\138\92\203\222\149\62\201\255\188\127\240\227\167\112\204\255\166\106\225\248\242\62\225\252\173\112\240\170\170\119\240\254\161\62\169\180\232\113\234\233\173\117\237\170\177\123\233\239\232\122\235\228\189\114\224\255\232\54\205\238\245","\132\138\200\30") .. tostring(mutAvcisiOncekiBait) .. _d8("\198","\94\239\129\114\236\126\41"))
                        end)
                    end
                    mutAvcisiOncekiBait = nil
                    mutUyariGonderildi = false
                end
            end)
        end
    end
end)

 
local AreaUtil2 = require(ReplicatedStorage.Shared.AreaUtility)
local AreasData = require(ReplicatedStorage.Areas)
local BolgeListesi = {}
pcall(function()
    for ad, d in pairs(AreasData) do
        if not d.Hidden and not d.NoDisplay and d.SpawnLocation then
            BolgeListesi[#BolgeListesi + (119-(70+48))] = { ad = tostring(ad), order = tonumber(d.Order) or 999 }
        end
    end
    table.sort(BolgeListesi, function(a, b) return a.ad < b.ad end)
end)

local function bolgeBilgi(ad)
    local kilitli, yuzde = true, (51-(31+20))
    pcall(function() kilitli = not AreaUtil2:AreaUnlocked(data, ad, true) end)
    pcall(function()
        local c = AreaUtil2:GetAreaCompletion(data, ad, nil, false)
        if c and c.Max and c.Max > (106-(96+10)) then yuzde = math.floor(c.Min / c.Max * (179-(39+40))) end
    end)
    return kilitli, yuzde
end

local function bolgeSpawnYap(ad)
    local kilitli = bolgeBilgi(ad)
    if kilitli then
        pcall(function()
            Fluent:Notify({ Title = _d8("\200\33\28\12\83\110","\144\156\83\125\122\54\2\155"), Content = ad .. _d8("\19\28\9\62\243\198\80\30\31\122\191\75\179\225\90\125\240\196\67\25\31\106\250\137\90\1\9\62\249\192\64\29\90\119\241\205\86\13\90\120\246\219\64\1\91","\169\51\117\122\30\159"), Duration = (230-(193+34)) })
        end)
        return false
    end
    pcall(function()
        Net:RemoteEvent(_d8("\151\7\184\217\254\111\34\4","\106\196\98\204\138\142\14\85")):FireServer(ad)
    end)
    task.wait(0.5)
    local kaydedildi = false
    pcall(function() kaydedildi = tostring(data:GetExpect(_d8("\178\58\194\169\86\178\142\56\213\184\91\145\143","\254\225\91\180\204\50"))) == ad end)
    pcall(function()
        Fluent:Notify({
            Title = _d8("\219\51\184\87\183\208","\88\143\65\217\33\210\188"),
            Content = kaydedildi and (_d8("\8\23\29\224\53\71\15\242\47\71\8\248\123","\151\91\103\124") .. ad .. _d8("\202\72\234\84\44\152\9\209\202\216\19\173\99\19\231\101\158\197\86\180\124\27\254\43\202\222\30\162\126\31\168","\69\234\170\118\199\12\122\137")) or _d8("\245\97\181\140\244\199\115\175\255\226\199\109\173\186\224","\132\166\4\193\223"),
            Duration = (219-(181+34)),
        })
    end)
    return kaydedildi
end

 
local spawnKlasoru = workspace:FindFirstChild(_d8("\251\68\143\100\245\165\221\171\148\69\226\11\229\180\200\181\149\43\253","\252\218\101\174\68\166\245\156"))
local function isinlanmaNoktalari()
    local liste = {}
    pcall(function()
        for _, c in ipairs(spawnKlasoru:GetChildren()) do
            local part = c:FindFirstChild(_d8("\12\143\57\97\49\179\55\117\62\139\49\121\49","\22\95\255\88")) or c:FindFirstChildWhichIsA(_d8("\199\201\99\31\248\238\138\241","\248\133\168\16\122\168\143"))
            if part then
                liste[#liste+(212-(193+18))] = { ad = c.Name, pos = part.Position }
            end
        end
    end)
    table.sort(liste, function(a, b) return a.ad < b.ad end)
    return liste
end

local function adaIsinla(ad)
    if not spawnKlasoru then return false end
    local bolum = spawnKlasoru:FindFirstChild(ad)
    local part = bolum and (bolum:FindFirstChild(_d8("\84\120\6\91\178\75\103\4\77\168\110\103\9","\220\7\8\103\44")) or bolum:FindFirstChildWhichIsA(_d8("\228\132\93\169\246\132\92\184","\204\166\229\46")))
    if not part then return false end
    getgenv().BBOT_STATE.autoFishOn = false
    camBirak()
    task.wait(0.3)
    local ch = LocalPlayer.Character
    local hrp = ch and ch:FindFirstChild(_d8("\143\83\238\70\169\73\234\67\149\73\236\83\151\71\241\83","\39\199\38\131"))
    if not hrp then return false end
    pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
    hrp.CFrame = part.CFrame + Vector3.new((211-(169+42)), (167-(120+43)), (216-(177+39)))
    task.wait((176-(155+19)))
    getgenv().BBOT_STATE.redler = (202-(153+49))
    spot = nil
    getgenv().BBOT_SPOT = nil
    pcall(function()
        Fluent:Notify({ Title = _d8("\132\28\51\155\181\2","\237\208\110\82"), Content = _d8("\186\16\122\48\233\132\253\143\139\17\54\33\246\203","\251\238\117\22\85\153\235\143") .. ad .. _d8("\11\71\78\12\61\74\204\163\184\124\95\133\185\249\105\78\215\226\184\78\74\211\171\184\78\91\202\186\180\61\95\205\171\246\61\95\202\169\255\113\78\133\143\237\105\68\133\136\241\110\67","\29\43\165\206\152"), Duration = (93-(62+27)) })
    end)
    return true
end

 
local function gucluCastYap()
    local vp = workspace.CurrentCamera.ViewportSize
    local hedef = Vector2.new(vp.X / (91-(51+38)) + math.random(-(147-(92+45)), (105-(77+18))), vp.Y / (168-(126+40)) + math.random(-(188-(128+50)), (74-(41+23))))
    local okB, basladi = pcall(function()
        return FC:RequestChargeFishingRod(hedef, false)
    end)
    if not (okB and basladi) then
        pcall(function() FC:RequestChargeFishingRod(hedef, true) end)
        return _d8("\19\159\241\184\249\249\15\159\235","\140\124\235\158\149\157")
    end
    local bar = PlayerGui:FindFirstChild(_d8("\160\46\151\18\230\237","\194\227\70\246\96\129\136"))
    bar = bar and bar:FindFirstChild(_d8("\215\223\7\13","\99\154\190\110"))
    bar = bar and bar:FindFirstChild(_d8("\38\117\109\145\224\88\34\102\108\146\241","\43\101\20\3\231\129"))
    bar = bar and bar:FindFirstChild(_d8("\170\70\21","\13\232\39\103\185\32\110\128"))
    local token = nil
    local tepe = (193-(171+22))
    local tw = os.clock()
    while os.clock() - tw < (154-(140+10)) do
        task.wait(0.015)
        elevateThread()
        if snap().Phase ~= _d8("\96\178\7\171\129\170\145\68","\255\35\218\102\217\230\195") then break end
        local guc = (146-(116+30))
        if bar then
            pcall(function() guc = bar.Size.Y.Scale end)
        end
        if guc > tepe then tepe = guc end
        if guc >= 0.96 then
            token = snap().Token
            break
        end
    end
    pcall(function() Core:ReleaseCharge(token) end)
    pcall(function()
        print(string.format(_d8("\155\29\127\31\107\40\224\26\83\112\86\12\169\127\82\34\94\27\250\127\95\49\77\85\229\113\15\54\31\88\254\127\69\117\17\68\166\127\113\37\92\30\224\54\81\53\31\23\169\45\92\59\86\25\164\54","\117\192\95\61\80\63"), tepe, (65-(35+29)) + math.floor(tepe * (243-(199+34)) + 0.5) / (83-(62+11))))
    end)
    return tepe
end

local function birTur()
    elevateThread()
    local char = LocalPlayer.Character

    local okS, spotDurum = spotKontrol()
    if not okS then return _d8("\249\177\7\71\161\115\4\254\160\82","\101\138\193\104\51\140\27") .. tostring(spotDurum) end

    if not rodHazirla() then return _d8("\156\241\77\108\237\176\156\246","\201\243\157\57\13\192") end
    elevateThread()

    if getgenv().BBOT_PREF.autoBait ~= false then
        yemKontrol()
        elevateThread()
    end

    local envOnce = envSay()

    local curSnap = snap()
    if curSnap.Phase ~= _d8("\209\149\69\189\99\237\151","\10\131\240\32\209") then
        local okA, av = pcall(function() return FC:GetAvailability() end)
        if not (okA and av and av.Ready) then return _d8("\12\48\255\24\177\73\53\224\22\170\8\107","\195\100\81\133\113") .. tostring(okA and av and av.Reason) end

        camTut()
        task.wait(0.1)
        elevateThread()

        local iw = os.clock()
        while os.clock() - iw < (97-(72+19)) do
            task.wait(0.25)
            elevateThread()
            if snap().Phase == _d8("\133\203\224\10","\111\204\175\140") then break end
        end
        elevateThread()

        if getgenv().BBOT_PREF.enIyiOran ~= false then
            gucluCastYap()
        else
            local vp = workspace.CurrentCamera.ViewportSize
            local castTarget = Vector2.new(vp.X / (187-(175+10)) + math.random(-(231-(184+37)), (234-(197+27))), vp.Y / (187-(165+20)) + math.random(-(180-(155+15)), (140-(87+43))))
            pcall(function() FC:RequestChargeFishingRod(castTarget, true) end)
        end

        local reeling = false
        local rw = os.clock()
        while os.clock() - rw < (213-(163+38)) do
            task.wait(0.15)
            elevateThread()
            local cur = snap()
            if cur.Phase == _d8("\89\45\249\70\229\32\108","\78\11\72\156\42\140") then reeling = true break end
            if cur.Phase == _d8("\118\32\10\203","\174\63\68\102") then break end
        end
        camBirak()
        if not reeling then return _d8("\59\6\250\192\206\158\182\60","\211\88\103\137\180\227\236") end
    end

    local instantAcik = getgenv().BBOT_PREF.instantReel ~= false
    if instantAcik then
        pcall(function() ConstantsMod.ClickDelay = 0.03 end)
    end
    local tikSay, tikKabul = (79-(52+27)), (53-(35+18))
    local cw = os.clock()
     
     
     
    local tempoMs = nil
    pcall(function()
        local AreaUtil = require(ReplicatedStorage.Shared.AreaUtility)
        local area = AreaUtil:GetArea(LocalPlayer:GetAttribute(_d8("\146\171\228\123\170\173\232\116\144\165\234\127","\26\222\196\135")) or _d8("\32\56\64\180\61\20\60\82\178\120\47\34\95\189\54\2","\88\102\81\51\220")) or { ClickPowerMultiplier = (243-(197+45)) }
        local rarity = LocalPlayer:GetAttribute(_d8("\228\130\225\253\210\195\130\233\202\208\197\142\249\225","\177\183\231\141\152")) or (117-(86+30))
        local t = ConstantsMod:GetClickTiming(rarity, area)
        if type(t) == _d8("\192\155\36\48\164\21","\208\174\238\73\82\193\103") and t > (137-(108+29)) then tempoMs = t * 1000 end
    end)
    local function tabanTempo()
        if instantAcik and tempoMs then
            return tempoMs * (0.92 + math.random() * 0.16)
        end
        return instantAcik and math.random((204-(129+37)), (119-(48+19))) or math.random((248-(53+13)), (332-(48+49)))
    end
     
    local beklemeMs = tabanTempo()
    local ardArdaRed = (112-(73+39))
    while os.clock() - cw < (155-(67+43)) do
        task.wait(beklemeMs / 1000)
        elevateThread()

        local s = snap()
        if s.Phase ~= _d8("\73\219\52\29\114\208\54","\113\27\190\81") then break end

        if s.Progress and s.Progress >= (186-(175+10)) then
            break
        end

        tikSay += (67-(45+21))
        local okT, kabul = pcall(function() return FC:RequestFishingMinigameClick() end)
        if okT and kabul then
            tikKabul += (114-(67+46))
            ardArdaRed = (105-(85+20))
            beklemeMs = tabanTempo()
        else
            ardArdaRed += (162-(119+42))
            if ardArdaRed >= (118-(100+16)) then
                beklemeMs = math.min(beklemeMs * 1.7, (463-(177+26)))
                ardArdaRed = (170-(121+48))
            end
        end
    end
    if instantAcik then
        pcall(function() ConstantsMod.ClickDelay = 0.14 end)
    end
    pcall(function()
        print(string.format(_d8("\193\182\247\94\206\169\149\67\255\145\217\57\191\135\156\43\186\209\209\49\238\157\222\61\186\209\209\49\241\149\215\100\246\216\149\52\180\198\211\98","\17\154\244\181"), instantAcik and _d8("\215\21\211\185\223\21\212","\237\158\91\128") or _d8("\180\140\30\101\11\230","\69\218\227\108\8\106\138"), tikSay, tikKabul, os.clock() - cw))
    end)

    local restTime = math.random(1200, 1800) / 1000
    task.wait(restTime)

    local envSonra = envSay()
    if envSonra > envOnce then
        getgenv().BBOT_STATE.caught = (getgenv().BBOT_STATE.caught or (133-(89+44))) + (envSonra - envOnce)
        pcall(function()
            Fluent:Notify({ Title = _d8("\237\203\22\78\56\63\116\39\238\241\91\24\104\51\238\165\57","\121\29\84\134\209\24"), Content = _d8("\143\231\221\162\49\20\76\184\227\209\241\58","\53\219\143\180\209\17\119") .. (envSonra - envOnce) .. _d8("\74\57\226\26\57\108\11\41\248\110","\24\106\69\194\78\86") .. getgenv().BBOT_STATE.caught, Duration = (215-(170+42)) })
        end)
    end
    return _d8("\92\74\200\192\220","\177\40\43\165\161")
end

 
local satisKilit = false

local function autoSat(sebep)
    if satisKilit then return _d8("\100\153\64\191\191\84","\56\9\252\51\216\202") end
    satisKilit = true
    elevateThread()
    local okV, sonuc = pcall(function()
        local once = envSay()
        local coinOnce = coinOku()
        local okS, satis = pcall(FI.Sell, function() return true end)
        task.wait(0.6)
        local sonra = envSay()
        local coinSonra = coinOku()
        local esya = once - sonra
        local coin = coinSonra - coinOnce
        if esya > (86-(38+48)) then
            pcall(function()
                Fluent:Notify({
                    Title = _d8("\229\186\69\15\207\121\96\81\184\159\188\93\121\73\247\151","\56\21\37\215\191\239") .. tostring(sebep) .. _d8("\178","\183\155\53\199\178"),
                    Content = esya .. _d8("\9\20\175\194\68\14\251\212\70\17\191\135\85\93\240","\167\41\125\219") .. tostring(coin) .. _d8("\206\47\245\189\128\63","\212\238\76\154"),
                    Duration = (209-(167+38)),
                })
            end)
            print(string.format(_d8("\134\28\93\247\241\40\253\31\106\204\202\38\184\50\115\144\128\6\244\100\63\149\128\17\253\59\108\193\196\89\253\117\58\220\133\22\178\55\113\148\133\29\188\51\34\157\214","\117\221\94\31\184\165"), tostring(sebep), esya, coin, tostring(satis)))
            return _d8("\89\89\231\3\129\7\87\248","\242\42\56\147\106")
        end
        print(string.format(_d8("\49\23\62\0\201\55\117\61\58\233\5\6\25\35\241\66\112\15\102\167\74\38\29\59\244\25\117\37\0\214\74\125\20\46\240\87\112\15\102","\157\106\85\124\79"), tostring(sebep), tostring(satis)))
        pcall(function()
            Fluent:Notify({ Title = _d8("\86\118\210\208\118\187\211\157\47\64\5\159\202\133\96\72","\250\166\233\64\96\86") .. tostring(sebep) .. _d8("\6","\73\47\32\8\112\252\83"), Content = _d8("\0\162\203\192\197\33\196\93\63\162\195\140\205\41\202\64\59\174\201\203\197\52\192\88\63\166\197\192\128\103\202\70\115\180\194\222\147\34\215\20\33\162\193\217\150\34\193\29","\52\83\199\167\172\229\71\165"), Duration = (144-(126+15)) })
        end)
        return _d8("\254\186\75","\230\156\213\56\28\30\24")
    end)
    satisKilit = false
    return okV and sonuc or _d8("\215\113\30\73","\129\191\16\106\40\125\154\177")
end

 
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        elevateThread()
        local S = getgenv().BBOT_STATE
        if S.autoFishOn and S.redler < (174-(123+48)) and Fluent.Unloaded ~= true then
            local okC, sonuc = pcall(birTur)
            if okC and sonuc == _d8("\19\226\214\70\120\61\21\231","\79\112\131\165\50\85") then
                S.redler = (S.redler or (165-(152+13))) + (81-(33+47))
                camBirak()
                pcall(function()
                    Fluent:Notify({ Title = _d8("\139\199\163\121\234\140\173\204\181\110\190\187\172","\222\200\166\208\13\202"), Content = _d8("\14\194\180\228\34\198\180\161","\129\79\182\192") .. S.redler .. _d8("\249\133\15\248\74\152\145\162\150\75\185\75\141\157\162\223\64\190\25\133\159\175\150\65\191\77\200\142\185\223\65\164\25\137\138\246\193\78\164\92\154\215","\254\214\182\47\208\57\232"), Duration = (132-(91+38)) })
                end)
                task.wait(3.5)
            elseif okC and sonuc == _d8("\247\120\115\90\162","\48\131\25\30\59\207\121") then
                S.redler = (98-(64+34))
                task.wait(0.8)
            else
                task.wait(1.5)
            end
        else
            task.wait(0.4)
        end
    end
    camBirak()
end)

 
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait((74-(36+35)))
        local S = getgenv().BBOT_STATE
        if S.autoSellOn and Fluent.Unloaded ~= true and not satisKilit then
            local okA, av = pcall(function() return FC:GetAvailability() end)
            if okA and av and av.Ready == false and av.Reason == _d8("\145\67\56\92\123\172\66\60\64","\21\216\45\78\57") then
                pcall(autoSat, _d8("\2\161\181\240\78\178\180\243\15","\159\99\212\193"))
            end
        end
    end
end)

 
 
 
local function setParaByTitle(title, newText)
    pcall(function()
        for _, d in ipairs(Fluent.GUI:GetDescendants()) do
            if d:IsA(_d8("\127\174\164\126\103\170\190\111\71","\10\43\203\220")) and d.Text == title then
                for _, sib in ipairs(d.Parent:GetChildren()) do
                    if sib:IsA(_d8("\104\76\45\89\31\161\142\142\80","\235\60\41\85\45\83\192\236")) and sib ~= d then
                        sib.Text = newText
                        return
                    end
                end
            end
        end
    end)
end

pcall(function()
    Tabs.Dashboard:CreateParagraph(_d8("\87\136\217\219\63\180\98","\218\22\235\186\180\74"), { Title = _d8("\0\135\124\235\64\235\53","\133\65\228\31\132\53"), Content = _d8("\158\100\2\109\187\101\4\39\252\37","\9\210\11\99") })
end)
pcall(function()
    Tabs.Dashboard:CreateParagraph(_d8("\232\74\203\45\52\66","\9\187\62\170\89\65\49\149"), { Title = _d8("\93\235\142\202\154\36","\87\14\159\239\190\239"), Content = _d8("\204\186\144\217\114\53\231\251\223\147","\91\128\213\241\189\27") })
end)

local function dashboardYenile()
    pcall(function()
        setParaByTitle(_d8("\1\62\34\108\34\173\52","\195\64\93\65\3\87"), string.format(
            _d8("\47\83\236\160\23\13\5\173\252\1\95\23\168\170\91\117\106\254\188\0\95\118\201\227\82\90\91\135\145\7\29\5\173\131\11\17\90\245\157\23\9\31\251\232\92\79\31\111\89\230\95\121\228\170\17\23\31\200\189\27\11\86\226\183","\114\127\63\141\217"),
            LocalPlayer.Name, tostring(LocalPlayer.DisplayName), LocalPlayer.UserId
        ))
        local S = getgenv().BBOT_STATE
        setParaByTitle(_d8("\91\250\254\195\156\145","\254\8\142\159\183\233\226"), string.format(
            _d8("\5\131\153\211\169\136\59\68\44\204\205\153\250\238\46\23\6\147\158\200\169\129\54\83\55\204\205\153\250\196\19\66\48\153\205\239\236\162\62\13\100\211\158\156\245\238\27\89\55\130\140\210\253\238\0\82\33\154\215\156\172\189\88\118\49\130\130\156\203\175\59\67\126\214\200\207\169\178\114\117\37\159\153\134\169\235\33\61\2\159\158\212\169\141\51\66\35\158\153\134\169\235\54\23\56\214\174\211\224\160\33\13\100\211\137\156\245\238\1\71\43\130\215\156\172\189","\55\68\246\237\188\137\206\82"),
            tostring(S.autoFishOn),
            tostring(getgenv().BBOT_PREF.enIyiOran ~= false),
            tostring(S.autoSellOn),
            tostring(getgenv().BBOT_PREF.instantReel ~= false),
            tostring(getgenv().BBOT_PREF.autoBait ~= false),
            (function()
                local suc = ""
                pcall(function() suc = tostring(data:GetExpect(_d8("\155\243\255\240\174\242\239\253\156\227\227\237\151\230","\153\222\130\138")) or "") end)
                return (suc ~= "" and suc ~= _d8("\28","\93\44\19\138") and suc ~= _d8("\149\166\152","\46\251\207\244")) and (_d8("\135","\175\164\134\246\198\80\244") .. suc) or _d8("\183\134\40\250","\228\217\233\70\159")
            end)(),
            S.caught or (212-(170+42)),
            coinOku(),
            spot and _d8("\133\11\58\229\130\226\8\106\249","\234\246\106\76\128\230\194") or _d8("\220\243\242\103\130\215\232","\241\178\156\134\71")
        ))
    end)
end
dashboardYenile()

pcall(function()
    Tabs.Dashboard:CreateButton({
        Title = _d8("\62\75\206\222\211\31\70","\182\108\46\168\172"),
        Description = _d8("\8\196\207\195\158\144\46\148\223\202\143\213\46\192\202\214\159\134\125\196\202\204\143\153","\245\93\180\171\162\234"),
        Callback = function()
            dashboardYenile()
        end,
    })
end)

 
 
 
pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\186\137\127\22\64\146\143\99","\6\251\252\11\121"), {
        Title = _d8("\153\176\238\144\162\12\47\171\173","\70\216\197\154\255\130\74"),
        Description = _d8("\60\40\54\177\70\211\179\39\26\58\54\182\90\211\179\54\3\43\114\243\9\138\175\34\7\110\117\170\91\129\165\57\1\110\102\176\90\154\180\62\26\32\54\244\9\149\161\52\28\32\113\255\64\128\224\52\20\62\98\170\91\150\164\121\85\7\112\255\80\156\181\119\20\60\115\255\72\132\161\46\85\40\100\176\68\211\180\63\16\110\101\175\70\135\236\119\28\58\54\171\76\159\165\39\26\60\98\172\9\135\168\50\7\43\54\190\71\151\224\49\28\61\126\186\90\211\169\57\85\55\121\170\91\211\179\54\3\43\114\255\77\154\178\50\22\58\127\176\71","\87\117\78\22\223\41\243\192"),
        Default = false,
        Callback = function(v)
            getgenv().BBOT_STATE.autoFishOn = v
            if v then
                getgenv().BBOT_STATE.redler = (75-(43+32))
                if not spot then
                    local ok = spotKaydet()
                    pcall(function()
                        Fluent:Notify({ Title = _d8("\174\59\75\128\118\68\134\61\87","\2\239\78\63\239\86"), Content = ok and _d8("\210\3\38\218\161\16\40\222\245\6\59\203\229\83\171\46\21\83\61\198\232\0\105\222\238\0\32\218\232\28\39\142\170\83\47\207\226\26\39\201\161\4\32\194\237\83\43\203\161\6\58\203\229","\174\129\115\73") or _d8("\10\177\59\221\41\180\114\197\35\240\49\208\60\164\39\195\41\240\33\193\35\164\115","\177\76\208\82"), Duration = (187-(148+36)) })
                    end)
                else
                    pcall(function()
                        Fluent:Notify({ Title = _d8("\224\16\204\102\151\231\12\203\97","\183\161\101\184\9"), Content = _d8("\213\144\48\69\26\74\48\211\255\178\117\215\245\172\100\206\244\185\48\211\245\254\99\198\236\187\116\135\233\174\127\211","\167\154\222\16"), Duration = (197-(166+29)) })
                    end)
                end
            else
                camBirak()
            end
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\250\104\244\151\123\159\205\103\211","\208\191\6\189\238\18"), {
        Title = _d8("\71\153\2\173\143\74\152\21\170\143\45\132\67\249\227\112\159\26\240","\175\5\252\113\217"),
        Description = _d8("\184\121\87\62\200\153\121\72\123\221\130\121\27\56\200\153\104\27\58\221\202\104\83\62\137\158\115\75\123\198\140\60\79\51\204\202\108\84\44\204\152\60\89\58\219\202\52\67\105\135\218\60\119\46\202\129\60\82\53\218\158\121\90\63\137\133\122\27\47\193\143\60\90\46\221\133\60\67\106\135\223\53\27\185\41\126\60\83\50\206\130\121\73\123\202\130\125\85\56\204\202\122\84\41\137\152\125\73\62\137\140\117\72\51","\169\234\28\59\91"),
        Default = getgenv().BBOT_PREF.enIyiOran ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.enIyiOran = v
            pcall(function()
                Fluent:Notify({ Title = _d8("\97\26\116\64\237\39\135\71\12","\227\35\127\7\52\205\104"), Content = v and _d8("\62\160\16\27\246\58\81\158\85\152\29\142\3\139\92\156\23\221\20\206\24\129\68\142\61\155\83\146\95","\174\113\238\48\249\118") or _d8("\112\206\137\136\75\223\205\101\94\253\187\199\137\60\56\54\75\168\231\208\152\113\108\108","\69\63\136\207\168\169\95\89"), Duration = (133-(83+48)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\199\230\149\68\141\123\101\94\235\237\138","\12\142\136\230\48\236\21\17"), {
        Title = _d8("\218\250\96\56\255\159\27\179\198\118\41\242","\111\147\148\19\76\158\241"),
        Description = _d8("\219\84\40\232\250\17\44\240\169\69\37\225\169\92\44\252\224\92\56\233\169\66\61\225\236\85\109\240\225\84\109\227\232\92\40\163\250\17\34\243\231\17\36\234\249\68\57\164\250\72\62\240\236\92\109\229\229\93\34\243\250\17\101\240\236\92\61\235\251\80\63\237\229\72\109\232\230\70\40\246\250\17\57\236\236\17\46\232\224\84\35\240\164\66\36\224\236\17\46\232\224\82\38\164\234\94\34\232\237\94\58\234\169\85\56\246\224\95\42\164\253\89\40\164\228\88\35\237\238\80\32\225\165\17\63\225\250\69\34\246\236\66\109\237\253\17\44\226\253\84\63\173\167\17\14\232\224\82\38\164\237\80\57\229\169\95\40\242\236\67\109\232\236\80\59\225\250\17\57\236\236\17\46\232\224\84\35\240\167","\132\137\49\77"),
        Default = getgenv().BBOT_PREF.instantReel ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.instantReel = v
            pcall(function() ConstantsMod.ClickDelay = 0.14 end)
            pcall(function()
                Fluent:Notify({ Title = _d8("\67\157\85\252\200\93\128\42\161\67\237\197","\244\10\243\38\136\169\51"), Content = v and _d8("\142\120\60\111\57\123\93\173\160\78\49\254\201\138\24\164\225\68\121\232\213","\192\193\54\28\141\185\239\125") or _d8("\33\218\34\213\140\28\240\213\6\233\9\148\0\177\20\148\13\249\0\213\28\249\1\153","\245\110\156\100"), Duration = (59-(30+27)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\238\139\242\251\167\187\198\138","\218\175\254\134\148\229"), {
        Title = _d8("\211\159\242\9\173\208\139\239\18","\141\146\234\134\102"),
        Description = _d8("\11\106\193\174\42\149\121\132\41\126\217\173\62\212\127\136\103\122\196\180\46\132\126\205\43\63\215\160\46\128\45\139\56\112\216\225\62\155\120\159\106\118\219\183\34\154\121\130\56\102\149\182\47\145\99\205\35\107\149\179\50\154\126\205\37\106\193\225\111\129\126\136\57\63\193\169\34\212\106\140\39\122\146\178\103\155\122\131\106\122\196\180\46\132\45\172\26\86\142\225\52\159\100\157\57\63\211\160\49\155\127\132\62\122\209\225\37\149\100\153\57\51\149\177\53\145\107\136\56\108\149\181\47\145\45\129\43\109\210\164\52\128\45\158\62\126\214\170\110","\237\74\31\181\193\71\244\13"),
        Default = getgenv().BBOT_PREF.autoBait ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.autoBait = v
            pcall(function()
                Fluent:Notify({ Title = _d8("\242\167\20\64\147\144\1\70\199","\47\179\210\96"), Content = v and _d8("\254\97\104\131\162\35\145\93\45\76\71\198\196\70\56\18\2\213\208\70\60\65\85\223\212\65\104\5\71\199\221\74\60\4\70","\183\177\47\72\97\34") or _d8("\143\224\130","\211\192\166\196\145"), Duration = (181-(129+50)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\131\83\129\5\178\68\128\47\164","\74\202\61\231"), {
        Title = _d8("\108\230\45\88\57\143\122\182\245\23\224\147\124\230\91\168\229\30\236\137","\208\156\121\137\231\25\198\20"),
        Description = _d8("\88\181\176\232\171\136\111\253\177\232\172\155\110\173\171\232\189\135\101\191\183\191\169\157\100\168\229\42\72\125\33\177\160\173\184\154\33\174\173\173\232\142\96\183\160\239\187\201\110\173\171\232\167\145\120\189\160\166\229\133\110\169\182\232\170\133\110\185\174\232\184\140\115\183\164\166\173\135\117\182\188\232\173\135\96\184\169\173\172\199\33\156\176\164\164\144\33\185\169\161\173\135\117\247\182\161\172\140\33\242\162\169\165\140\44\180\164\188\161\159\100\250\167\164\167\138\106\250\163\164\169\142\40\246\229\166\167\201\115\191\168\167\188\140\114\250\182\173\166\157\47","\233\1\218\197\200\200"),
        Default = false,
        Callback = function(v)
            pcall(getgenv().BBOT_OKSIJEN, v)
            pcall(function()
                Fluent:Notify({ Title = _d8("\138\44\202\90\173\43\216\86\227\13\212\74\164\39\194","\51\195\66\172"), Content = v and _d8("\92\41\233\38\10\173\76\106\8\188\228\233\88\2\52\19\233\160\248\86\27\125\71\168\170\243\84\3\97\2","\108\19\103\201\196\138\57") or _d8("\177\93\114\231\28\155\160\231\144\116\70\170\159\119\20\163\140\116\67\169\151\117\83\231\140\110\88\162\141","\199\254\27\52"), Duration = (124-(99+23)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\223\62\49\119\8\183\42\242\238\45\38","\156\154\72\84\25\124\255\95"), {
        Title = _d8("\48\126\207\152\69\233\147\165\143\53\23\67\140\167\175\146\50\23\45\217\139\180\132\51","\229\192\225\65\55\101\172"),
        Description = _d8("\120\85\229\184\39\94\81\250\178\110\95\85\226\168\38\77\71\182\170\34\68\20\229\174\60\94\81\228\235\43\94\81\248\191\61\8\28\248\164\110\90\81\251\164\58\77\71\182\184\43\70\64\191\229\110\100\65\245\160\110\77\66\243\165\58\91\14\182\165\33\92\93\240\178\110\3\20\210\162\61\75\91\228\175\110\71\90\250\178\110\0\64\254\174\55\8\71\226\170\45\67\20\247\165\55\95\92\243\185\43\1\26\182\137\33\91\71\185\163\59\70\64\182\174\56\77\90\226\184\116\8\85\227\191\33\5\64\228\170\56\77\88\229\235\58\71\20\226\163\43\8\64\247\185\41\77\64\182\162\61\68\85\248\175\98\8\82\247\168\43\91\20\225\170\58\77\70\186\235\37\77\81\230\184\110\78\85\228\166\39\70\83\173\235\60\77\64\227\185\32\91\20\254\164\35\77\20\225\163\43\70\20\243\189\43\70\64\229\235\43\70\80\184","\78\40\52\150\203"),
        Default = false,
        Callback = function(v)
            pcall(getgenv().BBOT_EVENT, v)
            pcall(function()
                Fluent:Notify({ Title = _d8("\236\160\130\8\29\89\73\105\201\73\60\119\121\201\73\121\77","\61\28\63\12\167"), Content = v and _d8("\196\72\138\193\84\205\171\113\203\87\183\49\226\104\205\3\177\47\238\104\222\80\248\121\234\115\222\76\249\51\228\111\196\3\181\58\255\111\220\70","\89\139\6\170\35\212") or _d8("\26\204\163","\206\85\138\229"), Duration = (72-(45+25)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle(_d8("\28\90\59\53\36\65\59\24\35","\125\81\47\79"), {
        Title = _d8("\166\231\239\201\226\94\54\120\203\218\238\198\226\82\43","\22\235\146\155\168\150\55\89"),
        Description = _d8("\243\196\55\192\163\106\154\132\210\38\194\191\103\140\214\133\38\213\174\97\157\215\159\99\212\163\106\135\132\196\99\238\190\123\136\208\192\39\131\174\121\140\202\209\99\208\191\110\155\208\214\99\139\179\61\201\201\208\55\194\191\102\134\202\133\32\203\170\97\138\193\140\111\131\170\122\157\203\200\34\215\162\108\136\200\201\58\131\174\126\156\205\213\48\131\178\96\156\214\133\33\198\184\123\201\201\208\55\194\191\102\134\202\136\33\204\164\124\157\205\203\36\131\169\110\128\208\158\99\208\188\102\157\199\205\38\208\235\109\136\199\206\99\215\164\47\144\203\208\49\131\187\125\140\210\204\44\214\184\47\139\197\204\55\131\188\103\140\202\133\42\215\235\106\135\192\214\109\131\141\122\133\200\220\99\211\170\124\154\205\211\38\131\41\143\125\132\208\48\198\184\47\157\204\192\99\196\170\98\140\131\214\99\204\188\97\201\198\196\42\215\235\78\185\237\139","\233\164\165\67\163\203\15"),
        Default = false,
        Callback = function(v)
            getgenv().BBOT_STATE.mutasyonAvcisiOn = v
            pcall(function()
                Fluent:Notify({ Title = _d8("\8\25\60\226\220\13\207\43\76\0\246\198\16\197\55","\160\69\108\72\131\168\100"), Content = v and _d8("\78\246\176\154\129\44\176\15\96\209\228\17\111\223\176\30\110\202\176\53\116\204\241\12\100\220\176\29\119\221\254\12\114","\120\1\184\144") or _d8("\171\83\166","\159\228\21\224"), Duration = (87-(59+26)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateButton({
        Title = _d8("\139\23\233\80\248\37\239\90\172","\53\216\118\159"),
        Description = _d8("\76\59\60\182\225\185\250\18\106\40\106\176\231\235\241\24\113\46\106\163\253\234\234\9\118\53\36\243\185\185\229\28\124\51\36\180\178\178\163\30\126\55\47\161\243\183\163\60\106\46\37\243\212\240\240\21\63\59\38\164\243\224\240\93\107\63\38\182\226\246\241\9\108\122\34\182\224\252\163\28\113\62\106\181\251\234\235\24\108\122\62\187\251\234\163\10\126\35\100","\125\31\90\74\211\146\153\131"),
        Callback = function()
            local ok = spotKaydet()
            pcall(function()
                Fluent:Notify({
                    Title = _d8("\255\49\93\66\64\255\32\68\83","\96\172\80\43\39"),
                    Content = ok and _d8("\192\127\103\165\198\135\242\121\109\181\198\22\15\156\40\51\102\96\179\127\103\162\143\128\250\96\102\241\205\212\245\110\107\184\136\147\179\36\40\178\135\153\246\125\105\241\133\149\227\123\125\163\131\144","\244\147\15\8\209\230") or _d8("\73\134\147\209\222\34\237\184\120\206\156\204\203\97\255\178\127\128\150\130","\221\10\238\242\163\191\65\153"),
                    Duration = (80-(40+37)),
                })
            end)
            dashboardYenile()
        end,
    })
end)


pcall(function()
    Tabs.Fishing:CreateButton({
        Title = _d8("\222\238\191\195\14\35\78\106\93\16\93\34\14\34\91\40\90\81\99\34\92\20","\71\46\113\43"),
        Description = _d8("\22\239\139\71\41\216\48\253\219\74\51\223\39\174\152\70\46\216\48\224\143\19\44\197\38\231\143\90\51\196\117\165\219\85\61\201\60\224\156\19\119\138\54\239\150\86\46\203\117\239\157\71\57\216\117\247\148\70\124\203\60\227\158\87\124\203\33\174\143\91\57\138\34\239\143\86\46\132","\170\85\142\251\51\92"),
        Callback = function(
            )
            elevateThread()
            local ok = spotKaydet()
            pcall(function()
                Fluent:Notify({ Title = _d8("\163\111\51\68","\133\240\31\92\48\9\38"), Content = ok and _d8("\98\251\71\19\114\24\60\88\190\67\82\119\13\55\12\124\172\160","\83\44\158\48\51\1\104") or _d8("\219\27\118\201\248\30","\165\157\122\31"), Duration = (181-(140+39)) })
            end)
            dashboardYenile()
        end,
    })
end)

 
 
 
pcall(function()
    Tabs.Travel = Window:CreateTab({ Title = _d8("\43\233\50\26\149\243","\159\127\155\83\108\240"), Icon = _d8("\237\47\207\174\240\39\209","\131\128\78\191") })
end)
if not Tabs.Travel then
    Tabs.Travel = Window:CreateTab({ Title = _d8("\113\93\139\101\109\73","\8\37\47\234\19") })
end
pcall(function()
    Tabs.Discord = Window:CreateTab({ Title = _d8("\163\147\228\118\136\136\243","\21\231\250\151"), Icon = _d8("\94\116\209\19\92","\113\57\24\190") })
    Tabs.Settings = Window:CreateTab({ Title = _d8("\86\139\131\216\108\128\144\223","\172\5\238\247"), Icon = _d8("\120\1\35\75\102\35\235\65","\50\11\100\87\63\15\77\140") })
end)
if not Tabs.Discord then
    Tabs.Discord = Window:CreateTab({ Title = _d8("\10\212\182\48\81\216\42","\170\78\189\197\83\62") })
end
if not Tabs.Settings then
    Tabs.Settings = Window:CreateTab({ Title = _d8("\217\254\123\16\74\56\237\232","\86\138\155\15\100\35") })
end

pcall(function()
    Tabs.Travel:CreateParagraph(_d8("\50\58\253\83\25\152\47\38\250\74","\244\102\72\156\37\124"), {
        Title = _d8("\75\113\220\205\46\124\34\86\213\192\37\104\109\112\196","\24\2\2\176\172\64"),
        Content = _d8("\104\17\126\135\9\71\55\96\76\95\111\207\6\78\46\108\85\11\59\222\5\11\63\109\94\95\114\217\6\74\48\103\9\95\90\223\30\68\126\69\78\12\115\138\26\74\43\112\66\12\59\203\4\79\126\119\79\26\59\197\6\79\126\112\87\16\111\138\3\88\126\96\75\26\122\216\15\79\126\225\167\235\59\203\3\70\126\98\83\95\108\203\30\78\44\47\7\15\105\207\25\88\126\80\70\9\126\138\57\91\49\119\11\95\111\194\15\69\126\119\72\24\124\198\15\11\31\118\83\16\59\236\3\88\54\35\94\16\110\216\25\78\50\101\9","\3\39\127\27\170\106\43\94"),
    })
end)

pcall(function()
    for _, b in ipairs(isinlanmaNoktalari()) do
        Tabs.Travel:CreateButton({
            Title = _d8("\110\208\158\19\179","\21\158\79\17\142\147\115") .. b.ad,
            Description = string.format(_d8("\226\107\23\235\250\248\69\71\150\122\20\174\175\228\23\64\198\111\12\224\170\191\18\29\134\104\87\174\175\185\7\85\154\46\94\160\186\241\30","\51\182\14\123\142\138\151\55"), b.ad, b.pos.X, b.pos.Y, b.pos.Z),
            Callback = function()
                elevateThread()
                task.spawn(function()
                    pcall(adaIsinla, b.ad)
                    dashboardYenile()
                end)
            end,
        })
    end
end)

 
 
 
pcall(function()
    Tabs.Selling:CreateToggle(_d8("\126\12\221\20\34\87\94\210","\190\63\121\169\123\113\50\50"), {
        Title = _d8("\60\7\114\108\143\211\87\17\30","\50\125\114\6\3\175\128"),
        Description = _d8("\111\60\116\191\42\139\250\73\45\119\190\56\223\242\95\56\116\191\32\139\236\84\60\118\243\32\196\238\78\121\113\189\47\206\245\72\54\106\170\121\194\232\28\31\77\159\21\139\179\73\42\125\160\121\223\243\89\121\127\178\52\206\188\79\121\119\164\55\139\253\73\53\116\189\60\216\232\28\42\113\180\55\202\247\21\119\56\149\56\221\244\78\48\108\182\61\139\250\82\61\56\178\59\196\237\89\116\108\187\43\206\232\84\54\116\183\121\217\250\78\60\56\181\48\216\243\28\56\106\182\121\219\233\83\45\125\176\45\206\255\28\59\97\243\45\195\254\28\42\125\161\47\206\233\18","\155\60\89\24\211\89\171"),
        Default = false,
        Callback = function(v)
            getgenv().BBOT_STATE.autoSellOn = v
            pcall(function()
                Fluent:Notify({ Title = _d8("\160\196\196\250\106\226\145\141\221","\244\225\177\176\149\74\177"), Content = v and _d8("\52\189\219\123\144\23\17\8\150\151\245\99\163\70\19\150\149\185\121\237\71\30\157\143\246\98\250\17\18\128\219\255\101\239\93","\49\123\243\251\153\16\131") or _d8("\104\82\238","\102\39\20\168\123\11\252\55"), Duration = (180-(131+47)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateToggle(_d8("\248\49\23\61\223\34\4","\111\190\80\97"), {
        Title = _d8("\13\54\27\1\108\5\14\24\35\49\6\26\41\121\79\60\45\49\10","\110\76\67\111"),
        Description = _d8("\244\212\145\13\185\67\245\194\134\14\163\0\152\218\156\2\234\2\218\212\132\3\234\5\209\200\154\70\168\26\152\221\147\16\165\17\209\207\155\8\173\67\204\211\151\11\234\23\208\222\210\11\165\14\221\213\134\70\190\11\221\194\210\7\184\6\152\216\147\19\173\11\204\155\16\230\94\67\204\211\151\70\185\6\202\205\151\20\237\16\152\200\151\10\166\78\217\215\158\70\164\6\206\222\128\70\190\12\205\216\154\3\185\67\222\218\132\9\184\10\204\222\150\70\163\23\221\214\129","\99\184\187\242\102\202"),
        Default = getgenv().BBOT_PREF.favRare ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.favRare = v
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateToggle(_d8("\252\171\193\102\206\187\219\190\222\68\213","\207\186\202\183\43\187"), {
        Title = _d8("\67\167\117\70\223\244\99\164\110\91\150\198\103\232\33\100\138\198\99\166\100\77","\178\2\210\1\41\255"),
        Description = _d8("\171\139\176\92\73\203\180\104\158\196\190\66\78\138\161\99\131\196\181\94\73\131\245\46\180\140\186\89\67\199\245\85\151\133\161\92\86\130\187\97\199\133\189\83\26\138\185\106\199\139\167\95\95\153\245\112\134\150\186\86\84\159\166\47\199\134\170\23\92\138\163\105\149\141\167\94\84\140\245\114\143\129\190\23\77\131\176\104\199\135\178\66\93\131\161","\6\231\228\211\55\58\235\213"),
        Default = getgenv().BBOT_PREF.favMutation ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.favMutation = v
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateButton({
        Title = _d8("\21\116\157\107\227\112\109\138\159\99\169\183\0\86\139\157\99\164\183\79\109\156\203\72\165\180","\31\229\235\6\202\195\32"),
        Description = _d8("\223\200\27\193\218\240\221\8\221\136\248\197\1\142\222\248\197\24\207\202\245\204\77\200\193\234\193\77\205\221\235\219\8\192\220\245\208\77\199\198\185\208\2\219\218\185\192\3\216\205\247\221\2\220\209\185\129\32\215\220\241\192\14\133\132\185\196\24\218\201\237\204\9\130\136\248\203\2\216\205\185\222\8\199\207\241\221\77\218\192\235\204\30\198\199\245\205\68","\168\153\169\109\174"),
        Callback = function()
            elevateThread()
            task.spawn(function()
                local kilit = (91-(70+21))
                pcall(function()
                    local liste = data:GetExpect({_d8("\176\141\14\127\178\141\140\10\99","\220\249\227\120\26"), _d8("\208\253\252\253\186","\201\153\137\153\144")}) or {}
                    for _, item in ipairs(liste) do
                        local degerli, neden = balikDegerliMi(item)
                        if degerli then
                            pcall(TI.FavoriteItem, TI, item.UUID)
                            kilit += (234-(196+37))
                            task.wait(0.15)
                        end
                    end
                end)
                pcall(function()
                    Fluent:Notify({ Title = _d8("\60\48\197\151\9\33\222\195\37\44\220\134\2\54\197\145\21","\227\108\66\170"), Content = kilit .. _d8("\222\157\151\173\111\222\151\145\189\108\155\159\222\60\170\110","\7\254\251\254\222"), Duration = (83-(49+31)) })
                end)
                dashboardYenile()
            end)
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateButton({
        Title = _d8("\1\119\29\215\123\31\148\132\227\71\21\35\134","\76\241\232\143\103\91"),
        Description = _d8("\185\93\74\217\251\139\245\200\143\92\79\212\175\135\244\220\208\24\71\217\183\194\235\192\134\84\71\215\183\135\184\195\131\75\78\149\243\132\249\211\133\74\79\193\190\145\184\196\132\92\6\212\185\141\238\192\199\76\78\199\190\145\240\202\134\92\6\199\186\144\253\214\202\89\84\208\251\137\253\213\158\17\8","\165\234\56\38\181\219\226\152"),
        Callback = function()
            elevateThread()
            pcall(autoSat, _d8("\175\59\150\115\224\174","\129\194\90\248\6"))
            dashboardYenile()
        end,
    })
end)

 
 
local function webhookSend(mesaj)
    local url = getgenv().BBOT_PREF.webhook
    if not url or #url < (166-(122+24)) then return false, _d8("\170\132\203\128\153\191","\21\196\235\235\245\235\211") end
    local req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if not req then return false, _d8("\203\224\187\36\138\232\232","\152\165\143\155\76\254\156") end
    local ok = pcall(function()
        req({
            Url = url,
            Method = _d8("\18\161\172\55","\63\66\238\255\99\137"),
            Headers = { [_d8("\41\135\13\230\204\63\127\71\188\26\226\204","\11\106\232\99\146\169\81")] = _d8("\106\175\149\56\75\122\111\126\98\176\139\123\72\106\97\100","\10\11\223\229\84\34\25\14") },
            Body = game:GetService(_d8("\69\166\181\27\94\183\179\29\100\177\164","\107\13\210\193")):JSONEncode({ content = mesaj }),
        })
    end)
    return ok
end

 
 
 
 
local EVENT_BILGI = {
    [_d8("\220\74\115\213\184\102\100\217\249\71\110\218\247\69\33\246\237\69\117","\190\152\43\1")] = { oncelik = (137-(84+45)), ada = _d8("\227\75\39\190\199\71\117\156\220\84\48","\223\179\34\85") },
    [_d8("\160\49\245\2\231\222\141\130\58\178\43\254\223\157","\233\237\84\146\99\139\177")] = { oncelik = (92-(46+39)), ada = _d8("\84\163\183\201\112\175\229\235\107\188\160","\168\4\202\197") },
    [_d8("\86\132\212\98\26\177\113\133\198\48\33\188\102\159","\211\21\236\181\16\99")] = { oncelik = (207-(165+36)), ada = nil },
    [_d8("\15\56\188\126\78\46\147\34\51\234\95\90\52\143","\251\67\93\202\23\47\90")] = { oncelik = (228-(194+28)), ada = nil },
    [_d8("\43\77\189\225\233\26\87\178\230\225\19\68\232\199\248\17\81","\141\127\37\200\143")] = { oncelik = (217-(200+11)), ada = nil },
    [_d8("\146\146\83\14\194\180\146\18\62\206\167\142\87\3\223\245\182\71\3\223","\171\213\254\50\109")] = { oncelik = (87-(57+24)), ada = nil },
    [_d8("\118\92\37\250\169\42\99\237\2\102\53\245\174","\136\34\46\64\155\218\95\17")] = { oncelik = (142-(114+23)), ada = nil },
    [_d8("\236\99\48\37\212\127\56\57\216\51\18\56\201\118","\87\191\19\81")] = { oncelik = (118-(85+28)), ada = nil },
    [_d8("\106\159\134\50\7\150\180\16\76","\115\39\218\193")] = { oncelik = (84-(39+35)), ada = nil },
}
local eventAktifler = {}
local eventEveSpot = nil
local eventSuAnHedef = nil

local function eventBildirim(isim, basladi)
    local durum = basladi and _d8("\70\204\237\212\92\80\220","\8\21\152\172\134") or _d8("\103\218\236\158\151","\141\2\180\136\251\243\44")
    pcall(function()
        Fluent:Notify({ Title = _d8("\154\212\87\103\110\47\61\188\166\58\74\3\172\166\58\15\57","\78\106\75\217\200"), Content = isim .. _d8("\183","\153\151\21\158") .. durum .. _d8("\157","\210\188\38\133\239\94\194\102"), Duration = (82-(44+33)) })
    end)
    pcall(function()
        local bilgi = EVENT_BILGI[isim]
        local yer = bilgi and bilgi.ada and (_d8("\15\157\79\231\62\136\7\160","\128\91\252\61") .. bilgi.ada) or _d8("\180\29\15\241\142\4\10\191\141\28\7\254\149\26\11\241\193\145\228\11\193\21\5\237\140\26\10\248\193\16\11\241\149\26\10\234\132\0","\159\225\115\100")
        webhookSend(_d8("\148\116\129\123\68\193\49","\211\100\235\27") .. isim .. _d8("\79\29\249","\202\101\55\217") .. durum .. _d8("\99\189\183\9\209\58\103","\150\66\183\71") .. yer .. _d8("\118\245\148\22\157\92","\57\124\5\11\135") .. LocalPlayer.Name)
    end)
end

local function suYonuBul(konum)
    local Terrain = workspace.Terrain
    local function sudaMi(x, y, z)
        local ok, w = pcall(function()
            local r = Region3.new(Vector3.new(x, y, z) - Vector3.new((63-(38+23)), (118-(87+29)), (102-(90+10))), Vector3.new(x, y, z) + Vector3.new((193-(154+37)), (77-(38+37)), (134-(99+33)))):ExpandToGrid((193-(151+38)))
            local v = Terrain:ReadVoxels(r, (110-(83+23)))
            return v[(205-(154+50))] and v[(104-(54+49))][(62-(43+18))] and (v[(84-(38+45))][(76-(51+24))][(182-(151+30))] == Enum.Material.Water)
        end)
        return ok and w or false
    end
    local best = nil
    for i = (190-(168+22)), (249-(190+44)) do
        local aci = (i / (159-(97+46))) * math.pi * (151-(99+50))
        local yon = Vector3.new(math.sin(aci), (144-(108+36)), math.cos(aci))
        for _, mesafe in ipairs({ (231-(193+26)), (96-(51+20)), (218-(123+50)), (255-(129+46)), (323-(174+29)) }) do
            local p = konum + yon * mesafe
            local bulundu = false
            for _, dy in ipairs({ -(121-(91+28)), -(225-(177+42)), -(128-(92+24)) }) do
                if sudaMi(p.X, p.Y + dy, p.Z) then
                    bulundu = true
                    break
                end
            end
            if bulundu then
                if not best or mesafe < best.mesafe then
                    best = { yon = yon, mesafe = mesafe }
                end
                break
            end
        end
        if best then break end
    end
    return best
end

local function eventEveDon()
    local spot = eventEveSpot
    eventEveSpot = nil
    local ch = LocalPlayer.Character
    local hrp = ch and ch:FindFirstChild(_d8("\156\245\218\38\33\54\162\169\134\239\216\51\31\56\185\185","\205\212\128\183\71\79\89\203"))
    if not (hrp and spot and spot.pos) then return end
    getgenv().BBOT_STATE.autoFishOn = false
    camBirak()
    task.wait(0.3)
    pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
    hrp.CFrame = CFrame.new(spot.pos + Vector3.new((143-(97+46)), (155-(128+24)), (104-(70+34))))
    task.wait((135-(103+31)))
    spotKaydet()
    getgenv().BBOT_STATE.autoFishOn = true
    getgenv().BBOT_STATE.redler = (150-(139+11))
    pcall(function()
        Fluent:Notify({ Title = _d8("\108\40\143\116\24\239\149\124\242\195\33\147\77\196\151\124\238","\25\156\183\1\219\56\170\227"), Content = _d8("\198\79\44\1\226\85\37\79\243\80\96\68\233\71\37\69\167\193\192\181\167\65\33\66\236\3\40\78\234\70\108\1\225\74\51\73\238\77\39\1\245\70\51\84\234\70\36","\33\135\35\64"), Duration = (106-(87+15)) })
    end)
end

local function eventAdaGecis(ad)
    local ch = LocalPlayer.Character
    local hrp = ch and ch:FindFirstChild(_d8("\215\194\234\215\170\191\184\251\229\232\217\176\128\176\237\195","\209\159\183\135\182\196\208"))
    if not hrp then return false end
    if not eventEveSpot and getgenv().BBOT_SPOT then
        eventEveSpot = getgenv().BBOT_SPOT
    end
    if not adaIsinla(ad) then
        pcall(function()
            Fluent:Notify({ Title = _d8("\109\219\76\44\165\133\235\33\172\247\165\136\232\42\182\230\247","\192\157\68\194\131\133"), Content = ad .. _d8("\35\104\168\2\17\109\59\182\12\18\35\125\183\22\8\103\59\58\227\242\35\125\185\17\11\106\117\191\67\5\108\117\172\10\8\118\126\171","\102\3\27\216\99"), Duration = (149-(100+45)) })
        end)
        return false
    end
    task.wait((228-(177+49)))
    ch = LocalPlayer.Character
    hrp = ch and ch:FindFirstChild(_d8("\31\86\69\243\131\51\68\51\113\71\253\153\12\76\37\87","\45\87\35\40\146\237\92"))
    if not hrp then return false end
    local bulunan = suYonuBul(hrp.Position)
    if bulunan then
        local hedefPos = hrp.Position + bulunan.yon * math.max(bulunan.mesafe - (152-(118+26)), (193-(155+32)))
        pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
        hrp.CFrame = CFrame.new(hedefPos, hedefPos + bulunan.yon)
        task.wait(0.5)
    end
    spotKaydet()
    getgenv().BBOT_STATE.autoFishOn = true
    getgenv().BBOT_STATE.redler = (130-(97+33))
    pcall(function()
        Fluent:Notify({ Title = _d8("\90\141\52\185\138\87\204\115\196\102\154\94\223\124\206\115\216","\22\170\18\186"), Content = _d8("\91\250\1\62\168\171\126\178\83","\206\26\136\115\87\222") .. ad .. (bulunan and _d8("\77\171\9\177\39\31\12\42\224\75\96\89\26\40\253\64\117\89\143\213\26","\121\109\73\137\37\7") or _d8("\115\90\57\237\115\214\214\89\36\217\205\28\33\152\223\22\38\214\221\85\115\217\208\20\115\213\216\23\38\217\213\21\42","\121\83\184\185")), Duration = (170-(139+26)) })
    end)
    return true
end

getgenv().BBOT_EVENT = function(v)
    getgenv().BBOT_STATE.eventAvcisiOn = v and true or false
    if v and getgenv().BBOT_SPOT and not eventEveSpot then
        eventEveSpot = getgenv().BBOT_SPOT
    end
    if not v then
        eventSuAnHedef = nil
    end
end

 
 
 
 
 
getgenv().BBOT_ANTIAFK = function(v)
    getgenv().BBOT_STATE.antiAfkOn = v and true or false
end
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait(math.random((316-(146+20)), (344-(124+10))))
        local S = getgenv().BBOT_STATE
        if S.antiAfkOn and Fluent.Unloaded ~= true then
            pcall(function()
                if isrbxactive() then
                    mousemoverel((91-(74+17)), (95-(84+10)))
                    task.wait(0.06)
                    mousemoverel((242-(199+43)), -(174-(151+22)))
                end
            end)
        end
    end
end)

task.spawn(function()
    local eventsReplion = nil
    while myGen == getgenv().BBOT_GEN do
        task.wait((194-(159+30)))
        local S = getgenv().BBOT_STATE
        if S.eventAvcisiOn and Fluent.Unloaded ~= true then
            pcall(function()
                if not eventsReplion then
                    eventsReplion = Replion.Client:WaitReplion(_d8("\226\214\165\219\201\168","\138\167\160\192\181\189\219\137"))
                end
                local simdi = {}
                for _, v in ipairs(eventsReplion:GetExpect(_d8("\145\238\6\40\80\167","\36\212\152\99\70")) or {}) do
                    simdi[tostring(v)] = true
                end
                for isim in pairs(simdi) do
                    if not eventAktifler[isim] then
                        eventBildirim(isim, true)
                    end
                end
                for isim in pairs(eventAktifler) do
                    if not simdi[isim] then
                        eventBildirim(isim, false)
                    end
                end
                eventAktifler = simdi
                local secilen, secOnc = nil, -(204-(183+20))
                for isim in pairs(simdi) do
                    local bilgi = EVENT_BILGI[isim]
                    if bilgi and bilgi.ada and bilgi.oncelik > secOnc then
                        secilen, secOnc = isim, bilgi.oncelik
                    end
                end
                if secilen and secilen ~= eventSuAnHedef then
                    eventSuAnHedef = secilen
                    task.spawn(eventAdaGecis, EVENT_BILGI[secilen].ada)
                elseif not secilen and eventSuAnHedef then
                    eventSuAnHedef = nil
                    task.spawn(eventEveDon)
                end
            end)
        end
    end
end)

pcall(function()
    Tabs.Discord:CreateInput(_d8("\63\229\72\252\48\70\3\213\120\216","\41\104\128\42\148\95"), {
        Title = _d8("\85\197\127\69\158\109\203\61\120\163\78","\241\2\160\29\45"),
        Description = _d8("\228\232\206\93\49\156\205\230\200\91\116\248\221\250\222\70\38\216\148\254\216\75\60\211\219\226\157\65\49\206\209\169\149\90\53\202\209\237\157\89\49\206\217\232\211\76\58\200\216\240\148","\188\180\137\189\41\84"),
        Placeholder = _d8("\21\48\92\45\9\53\1\82\32\65\46\25\96\92\25\106\75\50\23\32\79\13\45\7\42\31\109\70\18\43\67\46\85\33\0\83","\46\125\68\40\93\122\15"),
        Finished = true,
        Callback = function(v)
            getgenv().BBOT_PREF.webhook = v
            pcall(function()
                Fluent:Notify({ Title = _d8("\187\13\29\112\255\58\13","\105\255\100\110\19\144\72"), Content = _d8("\122\194\248\37\79\66\204\186\62\65\91\194\254\109\194\177\52","\32\45\167\154\77"), Duration = (127-(100+25)) })
            end)
        end,
    })
end)

pcall(function()
    Tabs.Discord:CreateButton({
        Title = _d8("\113\149\230\26\5\167\240\12\77\159\250\5","\110\37\240\149"),
        Description = _d8("\157\78\235\138\222\233\175\11\241\139\222\189\238\70\224\157\222\168\169\78\165\154\194\233\183\68\240\156\141\186\175\93\224\138\141\190\171\73\237\129\194\162","\201\206\43\133\238\173"),
        Callback = function()
            elevateThread()
            local ok, neden = webhookSend(_d8("\44\17\4\61\203\246\164\193\230\133\185\246\187\215\158\190\174\237\174\197\236\164\177\191\136\179\224\245\250\136\168\235\255\191\151\252\222\247\254\146\185\252\161\191\193\246","\235\220\142\155\159") .. LocalPlayer.Name .. _d8("\18\140\71\182\102\173\22\52\93\156\71\140\47\153\20\49\24\142\51\152\111","\89\56\166\103\202\70\234\119"))
            pcall(function()
                Fluent:Notify({
                    Title = _d8("\94\156\52\91\42\174\34\77\98\150\40\68","\47\10\249\71"),
                    Content = ok and _d8("\196\102\231\188\136\173\11\144\169\42\40\219\183\96\225\173\203\36\183\122\230\189\218\111\211\106\250\171\199\61\243\35\234\160\201\33\249\102\229","\79\151\3\137\200\168") or _d8("\180\64\183\200\253\150\1\246","\152\242\33\222\164") .. tostring(neden) .. _d8("\240","\135\217\32\141"),
                    Duration = (85-(52+30)),
                })
            end)
        end,
    })
end)

pcall(function()
    Tabs.Discord:CreateParagraph(_d8("\42\207\161\223\159\5\182\241\0\192\189","\184\110\166\210\188\240\119\210"), {
        Title = _d8("\103\209\13\253","\146\46\191\107"),
        Content = _d8("\176\203\248\165\112\125\62\131\138\138\233\161\36\120\63\208\140\197\254\169\54\114\52\145\150\195\229\174\35\59\33\153\131\138\206\169\35\120\56\130\134\138\253\165\50\115\56\159\137\138\253\169\60\119\119\146\135\138\235\164\52\126\51\208\139\196\170\180\56\126\119\158\135\210\254\224\37\107\51\145\150\207\164\224\3\122\33\149\194\211\229\181\34\59\32\149\128\194\229\175\59\59\57\159\149\138\249\175\112\114\35\215\145\138\248\165\49\127\46\222","\240\226\170\138\192\80\27\87"),
    })
end)

pcall(function()
    Tabs.Discord:CreateParagraph(_d8("\188\126\15\158\183\152\119\9","\254\246\17\102\240"), {
        Title = _d8("\172\93\17\109\156\147\158\131\18\59\108\209\138\131\136\91\12\122","\246\230\50\120\3\188\231"),
        Content = _d8("\127\25\79\8\99\79\26\7\73\114\92\12\69\29\55\75\7\69\6\98\68\10\78\4\114\68\29\88\69\55\89\10\89\0\103\94\73\69\12\96\89\73\74\7\115\10\26\94\25\103\69\27\95\73\245\170\253\11\8\123\70\73\66\7\55\69\28\89\73\83\67\26\72\6\101\78\73\88\12\101\92\12\89\71","\23\42\105\43\105"),
    })
end)

pcall(function()
    Tabs.Discord:CreateButton({
        Title = _d8("\227\203\237\77\95\222\241\10\125\116\59\136\12\247\241\17\119\116\44\132\13\226\251\17","\99\19\84\127\225\127\148\158"),
        Description = _d8("\16\3\141\224\75\51\21\217\247\75\51\70\144\237\85\63\18\156\163\69\36\9\148\163\100\63\18\177\246\65\118\78\152\239\84\55\31\138\163\86\38\70\141\236\3\50\7\141\230\10\118\7\151\231\3\53\9\137\234\70\37\70\144\247\3\34\9\217\250\76\35\20\217\224\79\63\22\155\236\66\36\2\217\97\163\194\70\137\226\80\34\3\217\234\87\118\15\151\163\90\57\19\139\163\65\36\9\142\240\70\36\70\141\236\3\60\9\144\237\13","\35\86\102\249\131"),
        Callback = function()
            elevateThread()
            task.spawn(function()
                local davet = nil
                pcall(function()
                    local cevap = game:HttpGetAsync(_d8("\110\232\169\232\107\65\186\3\116\253\170\182\127\18\225\68\115\254\168\235\125\9\246\67\104\232\184\246\108\85\246\67\107\179\176\225\112\30\252\95\99\242\191\253\106\28\186\106\106\233\184\246\108\86\199\73\104\249\170\253\124\84\248\77\111\242\242\252\113\8\246\67\116\248\243\236\96\15","\44\6\156\221\152\24\123\149"))
                    if cevap and string.find(cevap, _d8("\102\168\20\136\162\38\83\44\166\0\196","\55\2\193\103\235\205\84")) then
                        davet = cevap:gsub(_d8("\189\249\27","\178\152\138\48\160\109\26"), "")
                    end
                end)
                if not davet then
                    davet = _d8("\113\202\177\143\55\129\54\145\161\150\55\216\118\204\161\209\35\220\54\219\173\157\28\137\84\232\167\171\51","\187\25\190\197\255\68")
                end
                pcall(function() setclipboard(davet) end)
                pcall(function()
                    Fluent:Notify({ Title = _d8("\248\103\15\143\201\208\77\33\107\151\239\71","\82\8\248\157\35\233\148\36"), Content = _d8("\171\74\31\199\150\65\73\205\141\84\0\203\134\4\29\193\194\71\5\199\146\70\6\207\144\64\73\76\98\176\73\222\131\87\29\203\194\77\29\142\139\74\73\215\141\81\27\142\128\86\6\217\145\65\27\143","\174\226\36\105"), Duration = (162-(144+14)) })
                end)
            end)
        end,
    })
end)

 
 
 
pcall(function()
    Tabs.Settings:CreateParagraph(_d8("\76\181\50\204","\163\5\219\84"), {
        Title = _d8("\54\164\232\98\204\7\103\25\191\166\113\133\9\31\76\63\6\147\148\97\70\31\190\238\39\241\67\70\24\180\233\105","\47\108\221\134\7\180\39"),
        Content = _d8("\111\79\132\249\66\152\76\89\223\135\213\106\139\10\164\248\67\133\9\108\140\254\95\202\203\170\113\173\68\154\70\94\200\239\86\153\76\78\197\165\71\133\90\67\145\228\88\132\9\1\197\235\86\137\64\68\130\173\28\202\74\75\136\232\69\139\0\32\7\13\149\202\107\79\150\249\23\165\77\78\150\173\213\106\189\10\149\232\86\129\9\88\128\225\82\139\90\79\197\235\88\152\9\82\215\163\7\202\101\95\134\230\61\8\169\136\197\196\89\153\93\75\139\249\23\184\76\79\137\173\213\106\189\10\136\236\79\199\90\90\128\232\83\202\91\79\128\225\61\8\169\136\197\204\66\158\70\10\167\236\94\158\9\200\101\25\23\141\72\71\128\160\89\139\93\67\147\232\23\136\72\67\145\173\69\143\4\79\148\248\94\154\35\200\101\47\23\171\92\94\138\173\100\143\69\70\197\111\183\126\9\77\132\224\82\199\71\75\145\228\65\143\9\89\128\225\91\202\70\68\197\235\66\134\69\10\140\227\65\143\71\94\138\255\78\224\203\170\71\173\113\131\90\66\197\203\94\134\93\79\151\173\213\106\189\10\131\236\65\133\91\67\145\232\68\202\100\83\145\229\94\137\2\10\132\227\83\202\68\95\145\236\67\143\77\32\7\13\149\202\100\95\145\236\67\131\70\68\197\197\66\132\93\79\151\173\213\106\189\10\136\248\67\139\93\67\138\227\23\136\72\67\145\173\88\132\9\79\147\232\89\158\90\32\7\13\149\202\125\88\132\251\82\134\9\200\101\25\23\133\71\79\200\238\91\131\74\65\197\228\68\134\72\68\129\173\67\143\69\79\149\226\69\158\90\32\239\192\94\132\64\71\140\247\82\208\9\120\140\234\95\158\9\105\145\255\91\224\109\75\150\229\85\133\72\88\129\173\67\139\75\10\140\238\88\132\9\89\141\226\64\153\9\83\138\248\69\202\72\92\132\249\86\152\7","\234\41\42\229\141\55"),
    })
end)

pcall(function()
    Tabs.Settings:CreateToggle(_d8("\164\53\250\170\8\232\221","\242\229\91\142\195\73\174\150"), {
        Title = _d8("\60\35\148\220\207\141\210\123\20\194\141\250\68","\239\204\188\15\125"),
        Description = _d8("\248\32\57\146\205\247\195\2\136\38\52\129\136\171\135\92\197\59\50\145\220\252\151\24\204\62\57\196\204\240\196\18\199\60\50\129\203\237\151\7\193\51\124\150\205\248\219\81\231\1\113\136\205\239\210\29\136\63\51\145\219\252\151\28\193\49\46\139\133\243\222\5\220\55\46\196\128\168\199\9\132\114\41\138\204\252\195\20\203\38\61\134\196\252\158\95\136\29\50\136\209\185\209\24\218\55\47\196\223\241\222\29\205\114\40\140\205\185\229\30\202\62\51\156\136\238\222\31\204\61\43\196\193\234\151\23\199\49\41\151\205\253\153","\113\168\82\92\228\168\153\183"),
        Default = false,
        Callback = function(v)
            pcall(getgenv().BBOT_ANTIAFK, v)
            pcall(function()
                Fluent:Notify({ Title = _d8("\247\124\146\207\106\232\1\253","\71\182\18\230\166\71\169"), Content = v and _d8("\247\134\185\250\56\92\185\113\220\164\252\56\211\161\250\115\152\184\235\125\206\173\247\108\221\172","\24\184\200\153") or _d8("\195\33\122","\127\140\103\60\200\201\15"), Duration = (101-(72+27)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Settings:CreateButton({
        Title = _d8("\177\248\218\113\214\4\183\241\140\233","\129\227\157\169\20\162\36\228"),
        Description = _d8("\7\118\34\253\126\203\74\48\114\34\188\127\217\28\33\126\103\239\124\215\30\106\58\9\249\116\204\74\5\111\51\243\44\254\3\55\114\103\232\99\223\13\40\127\103\235\101\212\6\100\121\38\236\120\205\24\33\58\38\188\106\202\15\55\114\103\243\98\221\68","\106\68\26\71\156\12\184"),
        Callback = function()
            spot = nil
            getgenv().BBOT_SPOT = nil
            pcall(function()
                Fluent:Notify({ Title = _d8("\105\116\132\244\233\83\104\97\152\229","\115\59\17\247\145\157"), Content = _d8("\105\180\217\97\173\247\192\95\165\196\112\233\180\78\166\87\150\247\13\0\140\78\171\209\114\225\241\140\123\177\194\122\173\210\197\73\172\150\97\226\180\207\91\180\194\96\255\241\140\91\228\216\112\250\180\195\84\161","\172\58\196\182\21\141\148"), Duration = (101-(76+22)) })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Settings:CreateButton({
        Title = _d8("\112\145\118\81\68\155\58\118\80\157","\62\37\255\26"),
        Description = _d8("\110\34\170\161\156\129\251\154\69\43\229\149\172\187\251\143\67\42\229\161\141\157\171\157\13\47\169\190\217\147\174\154\66\35\164\166\144\157\181","\238\45\78\197\210\249\242\219"),
        Callback = function()
            pcall(getgenv().BBOT_CLEANUP)
        end,
    })
end)

 
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait((104-(68+33)))
        if Fluent.Unloaded ~= true then
            dashboardYenile()
        end
    end
end)

 
 
 
getgenv().BBOT = Fluent
getgenv().BBOT_OPTIONS = Fluent.Options
getgenv().BBOT_WINDOW = Window
getgenv().BBOT_TABS = Tabs
getgenv().BBOT_CAMSTOP = camBirak
getgenv().BBOT_SPOTRESET = function()
    spot = nil
    getgenv().BBOT_SPOT = nil
end
getgenv().BBOT_SELLNOW = function()
    pcall(autoSat, _d8("\84\150\69\34","\184\32\243\54\86\189\200\55"))
end
getgenv().BBOT_CLEANUP = function()
    getgenv().BBOT_STATE.autoFishOn = false
    getgenv().BBOT_STATE.autoSellOn = false
    getgenv().BBOT_STATE.antiAfkOn = false
    pcall(oksijenGeriAl)
    camBirak()
    pcall(function() Fluent:Destroy() end)
end

Window:SelectTab((116-(104+11)))
pcall(function() Fluent.GUI.Name = _d8("\80\30\155\144\28\83\75\202\76\63","\168\10\103\245\245\100\27\62") end)
Fluent.GUI.Enabled = true
disableAutoLocalize(Fluent.GUI)
dashboardYenile()

pcall(function()
    elevateThread()
    local spotBilgi = spot and _d8("\23\106\218\215\178\236\209\180\13\108\208\131\112\17\33","\192\100\26\181\163\146\141\178") or _d8("\205\151\159\208\80\204\140\159\208\65\213\157\219\131\89\198\140","\32\163\248\191\163")
    Fluent:Notify({ Title = _d8("\13\43\174\206\47\114\136\222\53\114\182\154\121\98","\171\87\82\192"), Content = _d8("\239\51\198\145\143\87\118\149\192\46\220\157\137\87\95\158\200\62\208\150\199\149\179\101\137","\241\169\90\181\242\231\119\51") .. spotBilgi, Duration = (142-(91+47)) })
end)

return _d8("\186\45\238\71\233\238\168\33\226\2\231\255\206\100\160\10\215\167\147\55\232\2\212\170\137\32\233\77\255\231\192\56\239\67\245\171\132\116\243\87\242\173\133\39\243\68\228\162\140\45","\206\224\84\128\34\145")
