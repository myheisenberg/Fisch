-- ZYNEX HUB v1.0 (Fisch Edition) | Spot System + Best Odds (x2 Luck) + Auto Sell + Human Jitter + BAC Shields
-- Auto Sell uses the game's OWN sell module (FishingRuntime.Inventory): fullness detection comes from the
-- game's own GetAvailability("Inventory") signal (works regardless of per-player limits), and the server
-- decides what gets sold (favorites + AutoSellThreshold are protected).
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function elevateThread()
    if setthreadidentity then pcall(setthreadidentity, 8) end
    if setidentity then pcall(setidentity, 8) end
    if set_thread_identity then pcall(set_thread_identity, 8) end
end
elevateThread()

-- NOT (v1.1): TeleportService hook'lari ve izleyici koparma KALDIRILDI.
-- RSE2 deseni: sifir engine hook'u, sifir baglanti bozma — sadece elevateThread.
-- Iki vektor de yuklenme aninda kick (267/bac) tetikliyor olabilirdi.

getgenv().BBOT_GEN = (getgenv().BBOT_GEN or 0) + 1
local myGen = getgenv().BBOT_GEN
getgenv().BBOT_STATE = {autoFishOn = false, autoSellOn = false, mutasyonAvcisiOn = false, oksijenOn = false, eventAvcisiOn = false, antiAfkOn = false, caught = 0, redler = 0}
getgenv().BBOT_PREF = getgenv().BBOT_PREF or {enIyiOran = true, instantReel = true, autoBait = true, favRare = true, favMutation = true, minWeight = 0}
pcall(function() if getgenv().BBOT_CLEANUP then pcall(getgenv().BBOT_CLEANUP) end end)

-- Fluent: GitHub (12sn butce, takilirsa iptal) -> local yedek -> GitHub tekrar
local Fluent
do
    local bitti, f = false, nil
    local th = task.spawn(function()
        local ok, r = pcall(function()
            return loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/Fluent.luau"))()
        end)
        f = ok and r or nil
        bitti = true
    end)
    local tw = os.clock()
    while not bitti and os.clock() - tw < 12 do
        task.wait(0.25)
    end
    if not bitti then
        pcall(task.cancel, th)
    end
    Fluent = f
    if not Fluent then
        pcall(function() Fluent = loadstring(readfile("Fluent.luau"))() end)
    end
    if not Fluent then
        local ok, r = pcall(function()
            return loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/Fluent.luau"))()
        end)
        Fluent = ok and r or nil
    end
end
if not Fluent then
    return "Zynex Hub: Fluent yuklenemedi (GitHub + local)"
end
-- bu thread eski surum kaldıysa devam etme (zombi pencere onlemi)
if myGen ~= getgenv().BBOT_GEN then
    return "Zynex Hub: eski yukleme denemesi iptal"
end

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
Fluent.GUI.Parent = PlayerGui
Fluent.GUI.DisplayOrder = 999999
Fluent.GUI.Enabled = false

local Window = Fluent:CreateWindow({
    Title = "Zynex Hub",
    SubTitle = "Fisch | by ZynexDev",
    Size = UDim2.fromOffset(560, 470),
    TabWidth = 150,
    Theme = "Dark",
    Acrylic = false,
    MinimizeKey = Enum.KeyCode.RightControl,
})

local function disableAutoLocalize(root)
    if not root then return end
    pcall(function()
        for _, v in ipairs(root:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then v.AutoLocalize = false end
        end
    end)
end
Fluent.GUI.DescendantAdded:Connect(function(v)
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then v.AutoLocalize = false end
end)

local avatarIcon = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"

local Tabs = {}
pcall(function()
    Tabs.Dashboard = Window:CreateTab({ Title = "Dashboard", Icon = avatarIcon })
    Tabs.Fishing = Window:CreateTab({ Title = "Fishing", Icon = "fish" })
    Tabs.Selling = Window:CreateTab({ Title = "Selling", Icon = "coins" })
end)
if not Tabs.Dashboard then
    Tabs.Dashboard = Window:CreateTab({ Title = "Dashboard" })
    Tabs.Fishing = Window:CreateTab({ Title = "Fishing" })
    Tabs.Selling = Window:CreateTab({ Title = "Selling" })
end

-- ============ MOTOR (v0.9) ============
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
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
local data = Replion.Client:GetReplion("Data")

local rp = RaycastParams.new()
rp.IgnoreWater = true
rp.FilterType = Enum.RaycastFilterType.Exclude

-- SPOT: eski oturumdan devral (yeniden inject'te kaybolmaz)
local spot = getgenv().BBOT_SPOT
local camGuard = nil

local function snap()
    local okS, s = pcall(function() return Core:GetSnapshot() end)
    return (okS and s) or { Phase = "?" }
end

local function envSay()
    local toplam = 0
    pcall(function()
        local inv = data:GetExpect("Inventory") or {}
        for _, liste in pairs(inv) do
            if type(liste) == "table" then toplam += #liste end
        end
    end)
    return toplam
end

local function coinOku()
    local c = 0
    pcall(function() c = data:GetExpect("Coins") or 0 end)
    return c
end

local function rodHazirla()
    if data:GetExpect("EquippedType") == "Fishing Rods" then return true end
    local char = LocalPlayer.Character
    if char then
        for _, t in ipairs(char:GetChildren()) do
            if t:IsA("Tool") and t.Name:lower():find("rod") then return true end
        end
    end
    local rods = data:GetExpect("Inventory")["Fishing Rods"] or {}
    if #rods == 0 then return false end
    local rodUUID = rods[1].UUID
    if not table.find(data:GetExpect("EquippedItems") or {}, rodUUID) then
        pcall(TI.EquipRod, TI, rodUUID)
        task.wait(1.2)
        elevateThread()
    end
    if data:GetExpect("EquippedType") ~= "Fishing Rods" then
        pcall(BP.ToggleHotbarItem, BP, rodUUID)
        local kw = os.clock()
        while os.clock() - kw < 4 do
            task.wait(0.3)
            elevateThread()
            if data:GetExpect("EquippedType") == "Fishing Rods" then break end
        end
    end
    return data:GetExpect("EquippedType") == "Fishing Rods"
end

local function spotKaydet()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local look = hrp.CFrame.LookVector
    local duz = Vector3.new(look.X, 0, look.Z)
    if duz.Magnitude < 0.05 then
        local cam = workspace.CurrentCamera
        if cam then duz = Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z) end
    end
    if duz.Magnitude < 0.05 then duz = Vector3.new(0, 0, -1) end
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

-- Kamera kilidi: cast ışını kaydedilen yöne gitsin diye (sadece client-side, sunucu görmez)
local function camTut()
    camBirak()
    if not spot or not spot.camCF then return end
    local cam = workspace.CurrentCamera
    if not cam then return end
    camGuard = RunService.RenderStepped:Connect(function()
        pcall(function() workspace.CurrentCamera.CFrame = spot.camCF end)
    end)
end

-- Karakter spottaysa yerinde çalış; değilse KAYITLI KONUM+YÖNE ışınla
local function spotKontrol()
    if not spot then
        if not spotKaydet() then return false, "spot-yok" end
    end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false, "hrp-yok" end
    local mesafe = (hrp.Position - spot.pos).Magnitude
    if mesafe > 12 then
        pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
        hrp.CFrame = CFrame.new(spot.pos, spot.pos + spot.look)
        task.wait(0.2)
        return true, "isinlandi(" .. string.format("%.0f", mesafe) .. "m)"
    end
    return true, "yerinde"
end

-- AUTO BAIT: yem bitince (EquippedBaitId bosalir) envanterden yem takar (oyunun kendi API'si)
local yemUyarildi = false
local function yemKontrol()
    local suc = ""
    pcall(function() suc = tostring(data:GetExpect("EquippedBaitId") or "") end)
    if suc ~= "" and suc ~= "0" and suc ~= "nil" then
        yemUyarildi = false
        return true -- yem takili
    end
    local inv = nil
    pcall(function() inv = data:GetExpect("Inventory") end)
    local yemler = inv and inv.Baits or {}
    local enIyi = nil
    for _, b in ipairs(yemler) do
        if not b.Favorited then
            if not enIyi or (b.Quantity or 0) > (enIyi.Quantity or 0) then
                enIyi = b
            end
        end
    end
    if not enIyi then
        if not yemUyarildi then
            yemUyarildi = true
            pcall(function()
                Fluent:Notify({ Title = "Auto Bait", Content = "No baits in inventory — fishing without bait", Duration = 3 })
            end)
        end
        return false
    end
    pcall(TI.EquipBait, TI, enIyi.UUID)
    task.wait(0.6)
    local yeni = ""
    pcall(function() yeni = tostring(data:GetExpect("EquippedBaitId") or "") end)
    pcall(function()
        print(string.format("[BBOT] AutoBait: yem bitti -> Id=%s takildi (EquippedBaitId=%s)", tostring(enIyi.Id), yeni))
    end)
    return yeni ~= "" and yeni ~= "0" and yeni ~= "nil"
end

-- FISH FILTER & AUTO FAVORITE: degerli baliklari favorile (satış sunucuda favorileri atlarken korur)
local mythicTier = 6
pcall(function() mythicTier = TierUtil:GetTier("Mythic").Tier end)

local function balikDegerliMi(item)
    if not item or item.Favorited then return false end
    local okD, itemData = pcall(function() return ItemUtil:GetItemData(item.Id) end)
    -- 1) Nadirlik: Mythic ve ustu
    if getgenv().BBOT_PREF.favRare ~= false and okD and itemData then
        local prob = itemData.Probability or itemData.ForcedProbability
        if prob and prob.Chance then
            local okT, tier = pcall(function() return TierUtil:GetTierFromRarity(prob.Chance) end)
            if okT and tier and tier.Tier and tier.Tier >= mythicTier then
                return true, "rare (T" .. tostring(tier.Tier) .. ")"
            end
        end
    end
    local meta = item.Metadata or {}
    -- 2) Mutasyon: herhangi bir VariantId (Shiny/Sparkling ve diger tum mutasyonlar)
    if getgenv().BBOT_PREF.favMutation ~= false and meta.VariantId then
        local mutName = "mutation"
        pcall(function()
            local vd = ItemUtil:GetVariantData(meta.VariantId)
            if vd and vd.Data and vd.Data.Name then mutName = tostring(vd.Data.Name) end
        end)
        return true, mutName
    end
    -- 3) Agirlik esigi (0 = kapali)
    local sinir = tonumber(getgenv().BBOT_PREF.minWeight) or 0
    if sinir > 0 and (tonumber(meta.Weight) or 0) >= sinir then
        return true, "weight " .. string.format("%.1fkg", tonumber(meta.Weight) or 0)
    end
    return false
end

-- yeni yakalanan baliklari izle (2sn'de bir envanter diff'i)
local bilinenUUID = {}
local function uuidHaritasi()
    local set = {}
    pcall(function()
        local liste = data:GetExpect({"Inventory", "Items"}) or {}
        for _, v in ipairs(liste) do set[v.UUID] = v end
    end)
    return set
end
bilinenUUID = uuidHaritasi()

task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait(2)
        if Fluent.Unloaded ~= true then
            pcall(function()
                local simdi = uuidHaritasi()
                for uuid, item in pairs(simdi) do
                    if not bilinenUUID[uuid] then
                        local degerli, neden = balikDegerliMi(item)
                        if degerli then
                            pcall(TI.FavoriteItem, TI, uuid)
                            pcall(function()
                                print(string.format("[BBOT] AutoFavorite: yeni balik kilitlendi (%s)", tostring(neden)))
                                Fluent:Notify({ Title = "Auto Favorite", Content = "Valuable fish locked ⭐ (" .. tostring(neden) .. ")", Duration = 3 })
                            end)
                        end
                    end
                end
                bilinenUUID = simdi
            end)
        end
    end
end)

-- INFINITE OXYGEN (Temassiz): oyunun kendi BlockOxygenLoss bayragini kalici acik tutar.
-- Mekanizma (SwimController'dan okundu): O2 client'ta hesaplaniyor; olum hasari YALNIZCA
-- O2=0 iken client'in UpdateOxygen sinyali atmasiyle gelir. Bayrak acikken DealDamage'in
-- ilk satiri (if u101 then return) sinyali engeller -> sunucuya giden tek byte yok.
local swimKontrol = nil
local swimOrigBlock = nil
local function oksijenBayrakiAc()
    if not swimKontrol then
        swimKontrol = require(ReplicatedStorage.Controllers.SwimController)
        swimOrigBlock = swimKontrol.BlockOxygenLoss
        -- false'a gecen cagrilari yok say: oyunun StateChanged dinleyicisi bayragi asla kapamaz
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
-- Bar dolu gorunsun: 3 sn'de bir false->true gecisi u103 sinyalini tetikler (O2 full'e dolum).
-- Iki cagri arasinda yield yok -> baska thread araya giremez, yarisma penceresi sifir.
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait(3)
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

-- MUTATION HUNTER (Temassiz): "Mutated" hava eventi baslayinca mutasyon yemini otomatik takar,
-- event bitince onceki yeme geri doner. Events Replion'u PASIF okunur (sunucuya giden yok),
-- yem takma oyunun kendi EquipBait API'si (Auto Bait'te canlı kanitlandi).
local eventsReplion = nil
local mutAvcisiOncekiBait = nil
local mutUyariGonderildi = false

local function mutatedEventAktifMi()
    local aktif = false
    pcall(function()
        if not eventsReplion then
            eventsReplion = Replion.Client:WaitReplion("Events")
        end
        for _, v in pairs(eventsReplion:GetExpect("Events") or {}) do
            if tostring(v) == "Mutated" then
                aktif = true
                break
            end
        end
    end)
    return aktif
end

local function yemMutasyonluMu(baitId)
    local okD, d = pcall(function() return ItemUtil.GetItemDataFromItemType("Baits", baitId) end)
    if okD and d and d.Modifiers and d.Modifiers.MutationMultiplier then
        return (tonumber(d.Modifiers.MutationMultiplier) or 0) > 0
    end
    return false
end

local function mutasyonYeminiBul()
    local inv = nil
    pcall(function() inv = data:GetExpect("Inventory") end)
    local yemler = inv and inv.Baits or {}
    local enIyi, enCarp = nil, 0
    for _, b in ipairs(yemler) do
        if not b.Favorited then
            local okD, d = pcall(function() return ItemUtil.GetItemDataFromItemType("Baits", b.Id) end)
            local carp = 0
            if okD and d and d.Modifiers and d.Modifiers.MutationMultiplier then
                carp = tonumber(d.Modifiers.MutationMultiplier) or 0
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
        task.wait(3)
        local S = getgenv().BBOT_STATE
        if S.mutasyonAvcisiOn and Fluent.Unloaded ~= true then
            pcall(function()
                local aktif = mutatedEventAktifMi()
                local suc = ""
                pcall(function() suc = tostring(data:GetExpect("EquippedBaitId") or "") end)
                local takiliMutasyonlu = (suc ~= "" and suc ~= "0" and suc ~= "nil") and yemMutasyonluMu(tonumber(suc)) or false
                if aktif and not takiliMutasyonlu then
                    local yem, carp = mutasyonYeminiBul()
                    if yem then
                        if not mutAvcisiOncekiBait then
                            mutAvcisiOncekiBait = (suc ~= "" and suc ~= "0" and suc ~= "nil") and tonumber(suc) or nil
                        end
                        pcall(TI.EquipBait, TI, yem.UUID)
                        task.wait(0.8)
                        pcall(function()
                            print(string.format("[BBOT] MutationHunter: Mutated eventi aktif -> mutasyon yemi takildi (Id=%s, x%s)", tostring(yem.Id), tostring(carp)))
                            Fluent:Notify({ Title = "Mutation Hunter", Content = "Mutated event! Mutation bait equipped (x" .. tostring(carp) .. ")", Duration = 4 })
                        end)
                    elseif not mutUyariGonderildi then
                        mutUyariGonderildi = true
                        pcall(function()
                            Fluent:Notify({ Title = "Mutation Hunter", Content = "Mutated event active but you own no mutation bait!", Duration = 4 })
                        end)
                    end
                elseif not aktif and takiliMutasyonlu and mutAvcisiOncekiBait then
                    local geriUUID = nil
                    pcall(function()
                        local inv = data:GetExpect("Inventory")
                        for _, b in ipairs(inv.Baits or {}) do
                            if b.Id == mutAvcisiOncekiBait then geriUUID = b.UUID end
                        end
                    end)
                    if geriUUID then
                        pcall(TI.EquipBait, TI, geriUUID)
                        pcall(function()
                            print("[BBOT] MutationHunter: event bitti -> onceki yeme donuldu (Id=" .. tostring(mutAvcisiOncekiBait) .. ")")
                        end)
                    end
                    mutAvcisiOncekiBait = nil
                    mutUyariGonderildi = false
                end
            end)
        end
    end
end)

-- TRAVEL: bolgeler (oyunun kendi SetSpawn sistemi — sunucu tarafindan dogurma, sifir CFrame hack)
local AreaUtil2 = require(ReplicatedStorage.Shared.AreaUtility)
local AreasData = require(ReplicatedStorage.Areas)
local BolgeListesi = {}
pcall(function()
    for ad, d in pairs(AreasData) do
        if not d.Hidden and not d.NoDisplay and d.SpawnLocation then
            BolgeListesi[#BolgeListesi + 1] = { ad = tostring(ad), order = tonumber(d.Order) or 999 }
        end
    end
    table.sort(BolgeListesi, function(a, b) return a.ad < b.ad end)
end)

local function bolgeBilgi(ad)
    local kilitli, yuzde = true, 0
    pcall(function() kilitli = not AreaUtil2:AreaUnlocked(data, ad, true) end)
    pcall(function()
        local c = AreaUtil2:GetAreaCompletion(data, ad, nil, false)
        if c and c.Max and c.Max > 0 then yuzde = math.floor(c.Min / c.Max * 100) end
    end)
    return kilitli, yuzde
end

local function bolgeSpawnYap(ad)
    local kilitli = bolgeBilgi(ad)
    if kilitli then
        pcall(function()
            Fluent:Notify({ Title = "Travel", Content = ad .. " is locked — complete its fish index first!", Duration = 3 })
        end)
        return false
    end
    pcall(function()
        Net:RemoteEvent("SetSpawn"):FireServer(ad)
    end)
    task.wait(0.5)
    local kaydedildi = false
    pcall(function() kaydedildi = tostring(data:GetExpect("SavedLocation")) == ad end)
    pcall(function()
        Fluent:Notify({
            Title = "Travel",
            Content = kaydedildi and ("Spawn set to " .. ad .. " ✓ — rejoin to spawn there!") or "SetSpawn failed",
            Duration = 4,
        })
    end)
    return kaydedildi
end

-- TRAVEL: ada isinlanma (CFrame, 3000m testi temiz gecti; her adanin spawn noktasi workspace'te)
local spawnKlasoru = workspace:FindFirstChild("!!! SPAWN LOCATIONS")
local function isinlanmaNoktalari()
    local liste = {}
    pcall(function()
        for _, c in ipairs(spawnKlasoru:GetChildren()) do
            local part = c:FindFirstChild("SpawnLocation") or c:FindFirstChildWhichIsA("BasePart")
            if part then
                liste[#liste+1] = { ad = c.Name, pos = part.Position }
            end
        end
    end)
    table.sort(liste, function(a, b) return a.ad < b.ad end)
    return liste
end

local function adaIsinla(ad)
    if not spawnKlasoru then return false end
    local bolum = spawnKlasoru:FindFirstChild(ad)
    local part = bolum and (bolum:FindFirstChild("SpawnLocation") or bolum:FindFirstChildWhichIsA("BasePart"))
    if not part then return false end
    getgenv().BBOT_STATE.autoFishOn = false
    camBirak()
    task.wait(0.3)
    local ch = LocalPlayer.Character
    local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
    hrp.CFrame = part.CFrame + Vector3.new(0, 4, 0)
    task.wait(2)
    getgenv().BBOT_STATE.redler = 0
    spot = nil
    getgenv().BBOT_SPOT = nil
    pcall(function()
        Fluent:Notify({ Title = "Travel", Content = "Teleported to " .. ad .. " — aim at water, Save Spot, then toggle Auto Fish", Duration = 4 })
    end)
    return true
end

-- v0.8 EN İYİ ORAN: Manuel şarj -> güç çubuğu tepeye (>=0.96) çıkınca bırak -> x2.0 Luck
local function gucluCastYap()
    local vp = workspace.CurrentCamera.ViewportSize
    local hedef = Vector2.new(vp.X / 2 + math.random(-10, 10), vp.Y / 2 + math.random(-10, 10))
    local okB, basladi = pcall(function()
        return FC:RequestChargeFishingRod(hedef, false)
    end)
    if not (okB and basladi) then
        pcall(function() FC:RequestChargeFishingRod(hedef, true) end)
        return "oto-dustu"
    end
    local bar = PlayerGui:FindFirstChild("Charge")
    bar = bar and bar:FindFirstChild("Main")
    bar = bar and bar:FindFirstChild("CanvasGroup")
    bar = bar and bar:FindFirstChild("Bar")
    local token = nil
    local tepe = 0
    local tw = os.clock()
    while os.clock() - tw < 4 do
        task.wait(0.015)
        elevateThread()
        if snap().Phase ~= "Charging" then break end
        local guc = 0
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
        print(string.format("[BBOT] En iyi oran: bar %.2f -> x%.1f Luck ile birakildi", tepe, 1 + math.floor(tepe * 10 + 0.5) / 10))
    end)
    return tepe
end

local function birTur()
    elevateThread()
    local char = LocalPlayer.Character

    local okS, spotDurum = spotKontrol()
    if not okS then return "spot-hata:" .. tostring(spotDurum) end

    if not rodHazirla() then return "olta-yok" end
    elevateThread()

    if getgenv().BBOT_PREF.autoBait ~= false then
        yemKontrol()
        elevateThread()
    end

    local envOnce = envSay()

    local curSnap = snap()
    if curSnap.Phase ~= "Reeling" then
        local okA, av = pcall(function() return FC:GetAvailability() end)
        if not (okA and av and av.Ready) then return "hazir-degil:" .. tostring(okA and av and av.Reason) end

        camTut()
        task.wait(0.1)
        elevateThread()

        local iw = os.clock()
        while os.clock() - iw < 6 do
            task.wait(0.25)
            elevateThread()
            if snap().Phase == "Idle" then break end
        end
        elevateThread()

        if getgenv().BBOT_PREF.enIyiOran ~= false then
            gucluCastYap()
        else
            local vp = workspace.CurrentCamera.ViewportSize
            local castTarget = Vector2.new(vp.X / 2 + math.random(-10, 10), vp.Y / 2 + math.random(-10, 10))
            pcall(function() FC:RequestChargeFishingRod(castTarget, true) end)
        end

        local reeling = false
        local rw = os.clock()
        while os.clock() - rw < 12 do
            task.wait(0.15)
            elevateThread()
            local cur = snap()
            if cur.Phase == "Reeling" then reeling = true break end
            if cur.Phase == "Idle" then break end
        end
        camBirak()
        if not reeling then return "cast-red" end
    end

    local instantAcik = getgenv().BBOT_PREF.instantReel ~= false
    if instantAcik then
        pcall(function() ConstantsMod.ClickDelay = 0.03 end)
    end
    local tikSay, tikKabul = 0, 0
    local cw = os.clock()
    -- OYUN TEMPOSU: sunucu reel suresini dogruluyor — cok hizli Complete'te baligi TANIMIYOR
    -- (canli olcum: 1.36sn reel'de balik dushmuyor, 6-9sn'de dushuyor). Oyunun kendi Auto modunun
    -- kullandigi GetClickTiming(rarity, area) temposu = sunucunun bekledigi hiz. Onu kullan.
    local tempoMs = nil
    pcall(function()
        local AreaUtil = require(ReplicatedStorage.Shared.AreaUtility)
        local area = AreaUtil:GetArea(LocalPlayer:GetAttribute("LocationName") or "Fisherman Island") or { ClickPowerMultiplier = 1 }
        local rarity = LocalPlayer:GetAttribute("SelectedRarity") or 1
        local t = ConstantsMod:GetClickTiming(rarity, area)
        if type(t) == "number" and t > 0 then tempoMs = t * 1000 end
    end)
    local function tabanTempo()
        if instantAcik and tempoMs then
            return tempoMs * (0.92 + math.random() * 0.16)
        end
        return instantAcik and math.random(38, 52) or math.random(182, 235)
    end
    -- ADAPTIF EMNIYET: red gelirse yavasla (kapinin hizina uy), kabul edilirse taban temposuna don.
    local beklemeMs = tabanTempo()
    local ardArdaRed = 0
    while os.clock() - cw < 45 do
        task.wait(beklemeMs / 1000)
        elevateThread()

        local s = snap()
        if s.Phase ~= "Reeling" then break end

        if s.Progress and s.Progress >= 1 then
            break
        end

        tikSay += 1
        local okT, kabul = pcall(function() return FC:RequestFishingMinigameClick() end)
        if okT and kabul then
            tikKabul += 1
            ardArdaRed = 0
            beklemeMs = tabanTempo()
        else
            ardArdaRed += 1
            if ardArdaRed >= 2 then
                beklemeMs = math.min(beklemeMs * 1.7, 260)
                ardArdaRed = 1
            end
        end
    end
    if instantAcik then
        pcall(function() ConstantsMod.ClickDelay = 0.14 end)
    end
    pcall(function()
        print(string.format("[BBOT] Reel(%s): %d tik, %d kabul, %.2fs", instantAcik and "INSTANT" or "normal", tikSay, tikKabul, os.clock() - cw))
    end)

    local restTime = math.random(1200, 1800) / 1000
    task.wait(restTime)

    local envSonra = envSay()
    if envSonra > envOnce then
        getgenv().BBOT_STATE.caught = (getgenv().BBOT_STATE.caught or 0) + (envSonra - envOnce)
        pcall(function()
            Fluent:Notify({ Title = "🐟 Fish Caught!", Content = "This cycle +" .. (envSonra - envOnce) .. " | Total: " .. getgenv().BBOT_STATE.caught, Duration = 3 })
        end)
    end
    return "tamam"
end

-- ============ AUTO SELL (oyunun kendi modulu) ============
local satisKilit = false

local function autoSat(sebep)
    if satisKilit then return "mesgul" end
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
        if esya > 0 then
            pcall(function()
                Fluent:Notify({
                    Title = "💰 Auto Sell (" .. tostring(sebep) .. ")",
                    Content = esya .. " items sold | +" .. tostring(coin) .. " coins",
                    Duration = 4,
                })
            end)
            print(string.format("[BBOT] AutoSell(%s): -%d esya, +%d coin, ham=%s", tostring(sebep), esya, coin, tostring(satis)))
            return "satis-ok"
        end
        print(string.format("[BBOT] AutoSell(%s): satis YOK (ham=%s)", tostring(sebep), tostring(satis)))
        pcall(function()
            Fluent:Notify({ Title = "💰 Auto Sell (" .. tostring(sebep) .. ")", Content = "Sell failed (nothing sellable or server refused)", Duration = 3 })
        end)
        return "bos"
    end)
    satisKilit = false
    return okV and sonuc or "hata"
end

-- arka plan: Auto Fish dongusu (GEN-korumali)
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        elevateThread()
        local S = getgenv().BBOT_STATE
        if S.autoFishOn and S.redler < 3 and Fluent.Unloaded ~= true then
            local okC, sonuc = pcall(birTur)
            if okC and sonuc == "cast-red" then
                S.redler = (S.redler or 0) + 1
                camBirak()
                pcall(function()
                    Fluent:Notify({ Title = "Cast Rejected", Content = "Attempt " .. S.redler .. "/3 (spot direction may not point at water)", Duration = 3 })
                end)
                task.wait(3.5)
            elseif okC and sonuc == "tamam" then
                S.redler = 0
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

-- arka plan: Auto Sell gozlemcisi
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait(3)
        local S = getgenv().BBOT_STATE
        if S.autoSellOn and Fluent.Unloaded ~= true and not satisKilit then
            local okA, av = pcall(function() return FC:GetAvailability() end)
            if okA and av and av.Ready == false and av.Reason == "Inventory" then
                pcall(autoSat, "auto-full")
            end
        end
    end
end)

-- ============================================================
--  UI (v1.0 | Zynex Hub — English)
-- ============================================================
local function setParaByTitle(title, newText)
    pcall(function()
        for _, d in ipairs(Fluent.GUI:GetDescendants()) do
            if d:IsA("TextLabel") and d.Text == title then
                for _, sib in ipairs(d.Parent:GetChildren()) do
                    if sib:IsA("TextLabel") and sib ~= d then
                        sib.Text = newText
                        return
                    end
                end
            end
        end
    end)
end

pcall(function()
    Tabs.Dashboard:CreateParagraph("Account", { Title = "Account", Content = "Loading..." })
end)
pcall(function()
    Tabs.Dashboard:CreateParagraph("Status", { Title = "Status", Content = "Loading..." })
end)

local function dashboardYenile()
    pcall(function()
        setParaByTitle("Account", string.format(
            "Player: %s (%s)\nUser ID: %d\nHub: ZynexDev v1.0 — Fisch Edition",
            LocalPlayer.Name, tostring(LocalPlayer.DisplayName), LocalPlayer.UserId
        ))
        local S = getgenv().BBOT_STATE
        setParaByTitle("Status", string.format(
            "Auto Fish: %s | Best Odds: %s\nAuto Sell: %s | Instant Reel: %s\nAuto Bait: %s | Bait: %s\nFish Caught: %d | Coins: %d | Spot: %s",
            tostring(S.autoFishOn),
            tostring(getgenv().BBOT_PREF.enIyiOran ~= false),
            tostring(S.autoSellOn),
            tostring(getgenv().BBOT_PREF.instantReel ~= false),
            tostring(getgenv().BBOT_PREF.autoBait ~= false),
            (function()
                local suc = ""
                pcall(function() suc = tostring(data:GetExpect("EquippedBaitId") or "") end)
                return (suc ~= "" and suc ~= "0" and suc ~= "nil") and ("#" .. suc) or "none"
            end)(),
            S.caught or 0,
            coinOku(),
            spot and "saved ✓" or "not set"
        ))
    end)
end
dashboardYenile()

pcall(function()
    Tabs.Dashboard:CreateButton({
        Title = "Refresh",
        Description = "Updates the status panel",
        Callback = function()
            dashboardYenile()
        end,
    })
end)

-- ============================================================
--  FISHING TAB
-- ============================================================
pcall(function()
    Tabs.Fishing:CreateToggle("AutoFish", {
        Title = "Auto Fish",
        Description = "If no spot is saved, your current position + facing is captured. If you are away from the spot, it teleports there and fishes in your saved direction",
        Default = false,
        Callback = function(v)
            getgenv().BBOT_STATE.autoFishOn = v
            if v then
                getgenv().BBOT_STATE.redler = 0
                if not spot then
                    local ok = spotKaydet()
                    pcall(function()
                        Fluent:Notify({ Title = "Auto Fish", Content = ok and "Spot captured — this position + facing will be used" or "Failed to capture spot!", Duration = 3 })
                    end)
                else
                    pcall(function()
                        Fluent:Notify({ Title = "Auto Fish", Content = "ON — teleporting to saved spot", Duration = 2 })
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
    Tabs.Fishing:CreateToggle("EnIyiOran", {
        Title = "Best Odds (x2 Luck)",
        Description = "Releases the cast at the top of the power bar (x2.0 Luck instead of the auto x1.5) — higher chance for rare fish",
        Default = getgenv().BBOT_PREF.enIyiOran ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.enIyiOran = v
            pcall(function()
                Fluent:Notify({ Title = "Best Odds", Content = v and "ON — peak release (x2 Luck)" or "OFF — auto cast (x1.5)", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle("InstantReel", {
        Title = "Instant Reel",
        Description = "Reels at the maximum speed the game's own input system allows (temporarily lowers the client-side click cooldown during the minigame, restores it after). Click data never leaves the client.",
        Default = getgenv().BBOT_PREF.instantReel ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.instantReel = v
            pcall(function() ConstantsMod.ClickDelay = 0.14 end)
            pcall(function()
                Fluent:Notify({ Title = "Instant Reel", Content = v and "ON — max-speed reel" or "OFF — human-paced reel", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle("AutoBait", {
        Title = "Auto Bait",
        Description = "Automatically re-equips a bait from your inventory when it runs out (uses the game's own equip API; skips favorited baits, prefers the largest stack)",
        Default = getgenv().BBOT_PREF.autoBait ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.autoBait = v
            pcall(function()
                Fluent:Notify({ Title = "Auto Bait", Content = v and "ON — re-equips bait when depleted" or "OFF", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle("InfOxygen", {
        Title = "🤿 Infinite Oxygen",
        Description = "You can't drown underwater — keeps the game's own oxygen-loss block permanently enabled. Fully client-side (game-native block flag), no remotes sent.",
        Default = false,
        Callback = function(v)
            pcall(getgenv().BBOT_OKSIJEN, v)
            pcall(function()
                Fluent:Notify({ Title = "Infinite Oxygen", Content = v and "ON — you can't drown anymore" or "OFF — normal drowning rules", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle("EventHunter", {
        Title = "🎯 Event & Boss Hunter",
        Description = "Passively watches all server events (no remotes sent). Luck events: notify + Discord only (they stack anywhere). Boss/hunt events: auto-travels to the target island, faces water, keeps farming; returns home when events end.",
        Default = false,
        Callback = function(v)
            pcall(getgenv().BBOT_EVENT, v)
            pcall(function()
                Fluent:Notify({ Title = "🎯 Event Hunter", Content = v and "ON — watching events, auto-join active" or "OFF", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateToggle("MutHunter", {
        Title = "Mutation Hunter",
        Description = "Watches weather events: when a Mutated event starts (x2 mutation chance), automatically equips your best mutation-boosting bait; switches back to your previous bait when it ends. Fully passive — uses the game's own bait API.",
        Default = false,
        Callback = function(v)
            getgenv().BBOT_STATE.mutasyonAvcisiOn = v
            pcall(function()
                Fluent:Notify({ Title = "Mutation Hunter", Content = v and "ON — waiting for Mutated events" or "OFF", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Fishing:CreateButton({
        Title = "Save Spot",
        Description = "Saves your current position + facing + camera. Auto Fish always teleports here and fishes this way.",
        Callback = function()
            local ok = spotKaydet()
            pcall(function()
                Fluent:Notify({
                    Title = "Save Spot",
                    Content = ok and "Spot saved ✓ — position + facing + camera captured" or "Character not found!",
                    Duration = 3,
                })
            end)
            dashboardYenile()
        end,
    })
end)


pcall(function()
    Tabs.Fishing:CreateButton({
        Title = "🔄 Re-save Spot Here",
        Description = "Captures your current position + facing + camera after you aimed at the water.",
        Callback = function(
            )
            elevateThread()
            local ok = spotKaydet()
            pcall(function()
                Fluent:Notify({ Title = "Spot", Content = ok and "New spot saved ✓" or "Failed", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

-- ============================================================
--  TRAVEL TAB (island teleports)
-- ============================================================
pcall(function()
    Tabs.Travel = Window:CreateTab({ Title = "Travel", Icon = "map-pin" })
end)
if not Tabs.Travel then
    Tabs.Travel = Window:CreateTab({ Title = "Travel" })
end
pcall(function()
    Tabs.Discord = Window:CreateTab({ Title = "Discord", Icon = "globe" })
    Tabs.Settings = Window:CreateTab({ Title = "Settings", Icon = "settings" })
end)
if not Tabs.Discord then
    Tabs.Discord = Window:CreateTab({ Title = "Discord" })
end
if not Tabs.Settings then
    Tabs.Settings = Window:CreateTab({ Title = "Settings" })
end

pcall(function()
    Tabs.Travel:CreateParagraph("TravelInfo", {
        Title = "Island Teleport",
        Content = "One-click teleport to any island. Auto Fish pauses and the old spot is cleared — aim at water, press Save Spot, then toggle Auto Fish yourself.",
    })
end)

pcall(function()
    for _, b in ipairs(isinlanmaNoktalari()) do
        Tabs.Travel:CreateButton({
            Title = "🏝 " .. b.ad,
            Description = string.format("Teleport to %s spawn (%.0f, %.0f, %.0f)", b.ad, b.pos.X, b.pos.Y, b.pos.Z),
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

-- ============================================================
--  SELLING TAB
-- ============================================================
pcall(function()
    Tabs.Selling:CreateToggle("AutoSell", {
        Title = "Auto Sell",
        Description = "Sells automatically when your inventory is FULL (uses the game's own fullness signal). Favorited and above-threshold rare fish are protected by the server.",
        Default = false,
        Callback = function(v)
            getgenv().BBOT_STATE.autoSellOn = v
            pcall(function()
                Fluent:Notify({ Title = "Auto Sell", Content = v and "ON — sells when inventory is full" or "OFF", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateToggle("FavRare", {
        Title = "Auto Favorite: Rare",
        Description = "Locks Mythic and above fish by favoriting them the moment they are caught — the server's sell-all never touches favorited items",
        Default = getgenv().BBOT_PREF.favRare ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.favRare = v
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateToggle("FavMutation", {
        Title = "Auto Favorite: Mutated",
        Description = "Locks any mutated fish (Shiny, Sparkling and all other variants) by favoriting them when caught",
        Default = getgenv().BBOT_PREF.favMutation ~= false,
        Callback = function(v)
            getgenv().BBOT_PREF.favMutation = v
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateButton({
        Title = "🛡 Protect Inventory Now",
        Description = "Favorites all valuable fish currently in your inventory (Mythic+, mutated, above weight threshold)",
        Callback = function()
            elevateThread()
            task.spawn(function()
                local kilit = 0
                pcall(function()
                    local liste = data:GetExpect({"Inventory", "Items"}) or {}
                    for _, item in ipairs(liste) do
                        local degerli, neden = balikDegerliMi(item)
                        if degerli then
                            pcall(TI.FavoriteItem, TI, item.UUID)
                            kilit += 1
                            task.wait(0.15)
                        end
                    end
                end)
                pcall(function()
                    Fluent:Notify({ Title = "Protect Inventory", Content = kilit .. " fish locked ⭐", Duration = 3 })
                end)
                dashboardYenile()
            end)
        end,
    })
end)

pcall(function()
    Tabs.Selling:CreateButton({
        Title = "💰 Sell Now",
        Description = "Sell immediately: all sellable fish (favorites and above-threshold rares are kept).",
        Callback = function()
            elevateThread()
            pcall(autoSat, "manual")
            dashboardYenile()
        end,
    })
end)

--  DISCORD TAB (webhook notifications)
-- ============================================================
local function webhookSend(mesaj)
    local url = getgenv().BBOT_PREF.webhook
    if not url or #url < 20 then return false, "no url" end
    local req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if not req then return false, "no http" end
    local ok = pcall(function()
        req({
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = game:GetService("HttpService"):JSONEncode({ content = mesaj }),
        })
    end)
    return ok
end

-- EVENT & BOSS AVCISI (Temassiz): Events Replion'u PASIF okur (sunucuya giden sinyal yok).
-- Sans/weather eventleri: TP YOK (çarpanlar her yerde geçerli) — sadece bildirim, üst üste biner.
-- Hedef eventleri: kanıtlı Travel TP + 16-yön su taraması (kıyıya dönük konum) + spot + farm.
-- Çakışma: TEK hedef — öncelik sırası (yüksek kazanır), diğerleri kuyrukta; bitince eve dönüş.
local EVENT_BILGI = {
    ["Dark Megalodon Hunt"] = { oncelik = 8, ada = "Pirate Cove" },
    ["Megalodon Hunt"] = { oncelik = 7, ada = "Pirate Cove" },
    ["Charybdis Boss"] = { oncelik = 6, ada = nil },
    ["Leviathan Hunt"] = { oncelik = 6, ada = nil },
    ["Thunderzilla Hunt"] = { oncelik = 6, ada = nil },
    ["Glacial Serpent Hunt"] = { oncelik = 6, ada = nil },
    ["Treasure Hunt"] = { oncelik = 5, ada = nil },
    ["Sparkling Cove"] = { oncelik = 5, ada = nil },
    ["MEGA Luck"] = { oncelik = 10, ada = nil },
}
local eventAktifler = {}
local eventEveSpot = nil
local eventSuAnHedef = nil

local function eventBildirim(isim, basladi)
    local durum = basladi and "STARTED" or "ended"
    pcall(function()
        Fluent:Notify({ Title = "🎯 Event Hunter", Content = isim .. " " .. durum .. "!", Duration = 5 })
    end)
    pcall(function()
        local bilgi = EVENT_BILGI[isim]
        local yer = bilgi and bilgi.ada and ("Target: " .. bilgi.ada) or "Unknown location — farming continues"
        webhookSend("🚨 **" .. isim .. "** " .. durum .. "!\n📍 " .. yer .. "\n👤 " .. LocalPlayer.Name)
    end)
end

local function suYonuBul(konum)
    local Terrain = workspace.Terrain
    local function sudaMi(x, y, z)
        local ok, w = pcall(function()
            local r = Region3.new(Vector3.new(x, y, z) - Vector3.new(2, 2, 2), Vector3.new(x, y, z) + Vector3.new(2, 2, 2)):ExpandToGrid(4)
            local v = Terrain:ReadVoxels(r, 4)
            return v[1] and v[1][1] and (v[1][1][1] == Enum.Material.Water)
        end)
        return ok and w or false
    end
    local best = nil
    for i = 0, 15 do
        local aci = (i / 16) * math.pi * 2
        local yon = Vector3.new(math.sin(aci), 0, math.cos(aci))
        for _, mesafe in ipairs({ 12, 25, 45, 80, 120 }) do
            local p = konum + yon * mesafe
            local bulundu = false
            for _, dy in ipairs({ -2, -6, -12 }) do
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
    local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
    if not (hrp and spot and spot.pos) then return end
    getgenv().BBOT_STATE.autoFishOn = false
    camBirak()
    task.wait(0.3)
    pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
    hrp.CFrame = CFrame.new(spot.pos + Vector3.new(0, 3, 0))
    task.wait(1)
    spotKaydet()
    getgenv().BBOT_STATE.autoFishOn = true
    getgenv().BBOT_STATE.redler = 0
    pcall(function()
        Fluent:Notify({ Title = "🎯 Event Hunter", Content = "All events ended — back home, fishing resumed", Duration = 4 })
    end)
end

local function eventAdaGecis(ad)
    local ch = LocalPlayer.Character
    local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    if not eventEveSpot and getgenv().BBOT_SPOT then
        eventEveSpot = getgenv().BBOT_SPOT
    end
    if not adaIsinla(ad) then
        pcall(function()
            Fluent:Notify({ Title = "🎯 Event Hunter", Content = ad .. " spawn not found — farming continues", Duration = 4 })
        end)
        return false
    end
    task.wait(2)
    ch = LocalPlayer.Character
    hrp = ch and ch:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local bulunan = suYonuBul(hrp.Position)
    if bulunan then
        local hedefPos = hrp.Position + bulunan.yon * math.max(bulunan.mesafe - 8, 6)
        pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
        hrp.CFrame = CFrame.new(hedefPos, hedefPos + bulunan.yon)
        task.wait(0.5)
    end
    spotKaydet()
    getgenv().BBOT_STATE.autoFishOn = true
    getgenv().BBOT_STATE.redler = 0
    pcall(function()
        Fluent:Notify({ Title = "🎯 Event Hunter", Content = "Arrived: " .. ad .. (bulunan and " — facing water ✓" or " — no water found, aim manually"), Duration = 5 })
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

-- ANTI-AFK v2 (Gercek Girisi): Roblox'un 20 dk bos kalma kick'i motor sayacidir.
-- VirtualUser yontemi BAC 9291 ile IKI KEZ iliskilendi -> tamamen sokuldu.
-- Yeni yontem: OS seviyesi GERCEK fare girisi (mousemoverel 1px asagi + geri) — motor
-- acisindan gercek girişten farksiz (idle sayacini sifirlar), sunucu izi sifir.
-- Pencere odakta degilse (isrbxactive false) atlanir — kullanicinin faresini rahatsiz etmez.
getgenv().BBOT_ANTIAFK = function(v)
    getgenv().BBOT_STATE.antiAfkOn = v and true or false
end
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait(math.random(150, 210))
        local S = getgenv().BBOT_STATE
        if S.antiAfkOn and Fluent.Unloaded ~= true then
            pcall(function()
                if isrbxactive() then
                    mousemoverel(0, 1)
                    task.wait(0.06)
                    mousemoverel(0, -1)
                end
            end)
        end
    end
end)

task.spawn(function()
    local eventsReplion = nil
    while myGen == getgenv().BBOT_GEN do
        task.wait(5)
        local S = getgenv().BBOT_STATE
        if S.eventAvcisiOn and Fluent.Unloaded ~= true then
            pcall(function()
                if not eventsReplion then
                    eventsReplion = Replion.Client:WaitReplion("Events")
                end
                local simdi = {}
                for _, v in ipairs(eventsReplion:GetExpect("Events") or {}) do
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
                local secilen, secOnc = nil, -1
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
    Tabs.Discord:CreateInput("WebhookURL", {
        Title = "Webhook URL",
        Description = "Paste your Discord webhook here (saved permanently)",
        Placeholder = "https://discord.com/api/webhooks/...",
        Finished = true,
        Callback = function(v)
            getgenv().BBOT_PREF.webhook = v
            pcall(function()
                Fluent:Notify({ Title = "Discord", Content = "Webhook saved ✓", Duration = 2 })
            end)
        end,
    })
end)

pcall(function()
    Tabs.Discord:CreateButton({
        Title = "Test Webhook",
        Description = "Sends a test message to your saved webhook",
        Callback = function()
            elevateThread()
            local ok, neden = webhookSend("🟢 **Zynex Hub v1.0** connected | Player: **" .. LocalPlayer.Name .. "** | Game: Fisch (TR)")
            pcall(function()
                Fluent:Notify({
                    Title = "Test Webhook",
                    Content = ok and "Sent ✓ — check your Discord channel" or "Failed (" .. tostring(neden) .. ")",
                    Duration = 3,
                })
            end)
        end,
    })
end)

pcall(function()
    Tabs.Discord:CreateParagraph("DiscordInfo", {
        Title = "Info",
        Content = "Rare fish catch notifications via Discord webhook will be added in the next update. Save your webhook now so it's ready.",
    })
end)

pcall(function()
    Tabs.Discord:CreateParagraph("JoinInfo", {
        Title = "Join the Community",
        Content = "Updates, event announcements, script news and support — all in our Discord server.",
    })
end)

pcall(function()
    Tabs.Discord:CreateButton({
        Title = "💬 Join Discord Server",
        Description = "Fetches the invite from GitHub (always up to date) and copies it to your clipboard — paste it in your browser to join.",
        Callback = function()
            elevateThread()
            task.spawn(function()
                local davet = nil
                pcall(function()
                    local cevap = game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fluent-Renewed/main/discord.txt")
                    if cevap and string.find(cevap, "discord.gg/") then
                        davet = cevap:gsub("%s+", "")
                    end
                end)
                if not davet then
                    davet = "https://discord.gg/ehbX2MVbTw"
                end
                pcall(function() setclipboard(davet) end)
                pcall(function()
                    Fluent:Notify({ Title = "💬 Discord", Content = "Invite copied to clipboard — paste it in your browser!", Duration = 4 })
                end)
            end)
        end,
    })
end)

-- ============================================================
--  SETTINGS TAB
-- ============================================================
pcall(function()
    Tabs.Settings:CreateParagraph("Info", {
        Title = "Zynex Hub v1.0 — Fisch Edition",
        Content = "Features:\n• Auto Fish — spot-based (position + facing + camera)\n• Best Odds — peak release for x2.0 Luck\n• Instant Reel — max-speed reel\n• Auto Bait — game-native bait re-equip\n• Auto Sell — game-native sell on full inventory\n• Fish Filter — favorites Mythic+ and mutated\n• Mutation Hunter — mutation bait on events\n• Travel — one-click island teleports\n\nMinimize: Right Ctrl\nDashboard tab icon shows your avatar.",
    })
end)

pcall(function()
    Tabs.Settings:CreateToggle("AntiAFK", {
        Title = "🛡 Anti-AFK",
        Description = "Prevents the 20-minute idle disconnect via real OS-level mouse micro-jitter (1px, undetectable). Only fires while the Roblox window is focused.",
        Default = false,
        Callback = function(v)
            pcall(getgenv().BBOT_ANTIAFK, v)
            pcall(function()
                Fluent:Notify({ Title = "Anti-AFK", Content = v and "ON — idle kick prevented" or "OFF", Duration = 2 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Settings:CreateButton({
        Title = "Reset Spot",
        Description = "Clears the saved spot. Next Auto Fish toggle will capture a fresh one.",
        Callback = function()
            spot = nil
            getgenv().BBOT_SPOT = nil
            pcall(function()
                Fluent:Notify({ Title = "Reset Spot", Content = "Spot cleared ✓ — toggle Auto Fish to capture a new one", Duration = 3 })
            end)
            dashboardYenile()
        end,
    })
end)

pcall(function()
    Tabs.Settings:CreateButton({
        Title = "Unload Hub",
        Description = "Closes the GUI and stops all automation",
        Callback = function()
            pcall(getgenv().BBOT_CLEANUP)
        end,
    })
end)

-- canli durum guncelleme (3 sn'de bir)
task.spawn(function()
    while myGen == getgenv().BBOT_GEN do
        task.wait(3)
        if Fluent.Unloaded ~= true then
            dashboardYenile()
        end
    end
end)

-- ============================================================
--  GLOBALS + CLEANUP
-- ============================================================
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
    pcall(autoSat, "test")
end
getgenv().BBOT_CLEANUP = function()
    getgenv().BBOT_STATE.autoFishOn = false
    getgenv().BBOT_STATE.autoSellOn = false
    getgenv().BBOT_STATE.antiAfkOn = false
    pcall(oksijenGeriAl)
    camBirak()
    pcall(function() Fluent:Destroy() end)
end

Window:SelectTab(1)
pcall(function() Fluent.GUI.Name = "ZynexHubFX" end)
Fluent.GUI.Enabled = true
disableAutoLocalize(Fluent.GUI)
dashboardYenile()

pcall(function()
    elevateThread()
    local spotBilgi = spot and "spot active ✓" or "no spot saved yet"
    Fluent:Notify({ Title = "Zynex Hub v1.0", Content = "Fisch Edition loaded — " .. spotBilgi, Duration = 4 })
end)

return "Zynex Hub v1.0 (Fisch Edition) loaded successfully"
