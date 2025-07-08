
-- Designed and Powered by MASTER OF SCRIPTS 👑
-- Gemini Hub: OFFLINE AI Edition (Delta-Compatible, Full GUI)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local memoryMode = "super"
local whitelist = {"MASTER OF SCRIPTS", "ابو سروال"}
local blacklist = {"guerric", "badadmin123"}
local stealthMode = false

-- FE Chat function
local function sendToFEChat(msg)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = msg})
end

-- Whitelist / Blacklist
local function isAllowed()
    for _, n in ipairs(blacklist) do if n == LocalPlayer.Name then return false end end
    for _, n in ipairs(whitelist) do if n == LocalPlayer.Name then return true end end
    return false
end

-- Fake AI Response
local function fakeAIResponse(input)
    input = input:lower()
    if input:find("tds") then
        return "🎯 هيا نلعب Tower Defense Simulator! أنا جاهز للدفاع!"
    elseif input:find("roleplay") then
        return "🎭 رائع! دعنا نبدأ التمثيل. من تريد أن أكون؟"
    elseif input:find("كيفك") or input:find("hello") then
        return "👋 أنا بخير! كيف يمكنني مساعدتك اليوم؟"
    elseif input:find("من انت") then
        return "🤖 أنا Gemini AI، صُنع بواسطة MASTER OF SCRIPTS!"
    else
        return "🤔 لم أفهم ذلك تماماً، لكني دائماً أتعلم!"
    end
end

-- Admin detection (fake)
local function isAdminPresent()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr:GetRankInGroup(1200769) >= 200 then
            return true
        end
    end
    return false
end

-- Stealth mode
task.spawn(function()
    while true do
        task.wait(10)
        if isAdminPresent() and not stealthMode then
            stealthMode = true
            sendToFEChat("🚫 دخل الأدمن. تفعيل وضع التخفي!")
        elseif not isAdminPresent() and stealthMode then
            stealthMode = false
            sendToFEChat("✅ عاد Gemini AI للعمل.")
        end
    end
end)

-- GUI Setup
if not isAllowed() then sendToFEChat("🚫 لا تملك صلاحية استخدام Gemini AI.") return end
sendToFEChat("🤖 Gemini AI (Offline) جاهز!")

local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "GeminiAI_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.05, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Text = text
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createButton("🎤 اسأل الذكاء", 10, function()
    local input = tostring(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Chat").Frame.BoxFrame.Frame.ChatBarParentFrame.Frame.Box.Text)
    local response = fakeAIResponse(input)
    sendToFEChat("🤖 Gemini: " .. response)
end)

createButton("🧠 تبديل الذاكرة", 50, function()
    if memoryMode == "super" then
        memoryMode = "short"
        sendToFEChat("🔄 الوضع الحالي: ذاكرة قصيرة")
    elseif memoryMode == "short" then
        memoryMode = "none"
        sendToFEChat("💤 تم إيقاف الذاكرة")
    else
        memoryMode = "super"
        sendToFEChat("⚡ ذاكرة خارقة مفعلة!")
    end
end)

createButton("👻 وضع التخفي", 90, function()
    stealthMode = not stealthMode
    if stealthMode then
        sendToFEChat("🔕 التخفي مفعّل")
    else
        sendToFEChat("🔔 التخفي متوقف")
    end
end)

createButton("🔁 إعادة الذكاء", 130, function()
    sendToFEChat("♻️ إعادة تمثيل الذكاء... جاهز الآن!")
end)

createButton("❌ إغلاق الواجهة", 170, function()
    gui:Destroy()
end)
