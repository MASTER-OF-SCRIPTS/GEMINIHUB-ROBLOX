
-- Designed and Powered by MASTER OF SCRIPTS 👑
-- Gemini Hub: Ultimate AI Edition (Full GUI, OpenAI API with Encoded Key)

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local memoryFile = "GeminiAI_MemoryData.txt"
local memoryMode = "super"
local whitelist = {"MASTER OF SCRIPTS", "ابو سروال"}
local blacklist = {"guerric", "badadmin123"}
local stealthMode = false

-- Decode Base64
local function decodeBase64(str)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    str = string.gsub(str, '[^'..b..'=]', '')
    return (str:gsub('.', function(x)
        if x == '=' then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c=0
        for i=1,8 do c=c + (x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

-- Encrypted API Key
local ENCODED_API = "c2stcHJvai1VQ1dKU2VGRUI1ckFnU1Z5TzN2SF9qcHIycHlRdU85dHpwVkRNM3VnM3ZMU29haEJIa01xTHRsRXNvMl9GZmM2TkZ6VzBtMWo5QlQzQmxiRkoxS3kzSTRBTjFaenF4LVpnYjNXamROeDd5OWUwMG1WcTh2NndySVVVdkEwdWZKUkRqNE85OTZEdFpFLWUybTFPWFBjMURpX3dB"
local OPENAI_API_KEY = decodeBase64(ENCODED_API)

-- FE Chat
local function sendToFEChat(msg)
    StarterGui:SetCore("ChatMakeSystemMessage", {Text = msg})
end

-- Whitelist / Blacklist check
local function isAllowed()
    for _, n in ipairs(blacklist) do if n == LocalPlayer.Name then return false end end
    for _, n in ipairs(whitelist) do if n == LocalPlayer.Name then return true end end
    return false
end

-- Admin detection
local function isAdminPresent()
    local keywords = {"admin", "hd", "adonis", "panel", "log", "handler"}
    for _, obj in ipairs(game:GetDescendants()) do
        for _, word in ipairs(keywords) do
            if obj.Name:lower():find(word) then return true end
        end
    end
    return false
end

-- API Request
local function askChatGPT(prompt)
    local data = {
        model = "gpt-3.5-turbo",
        messages = {{role = "user", content = prompt}}
    }
    local headers = {
        ["Authorization"] = "Bearer " .. OPENAI_API_KEY,
        ["Content-Type"] = "application/json"
    }
    local request = http_request or syn and syn.request or fluxus and fluxus.request
    if request then
        local response = request({
            Url = "https://api.openai.com/v1/chat/completions",
            Method = "POST",
            Headers = headers,
            Body = HttpService:JSONEncode(data)
        })
        if response and response.Body then
            local body = HttpService:JSONDecode(response.Body)
            return body.choices[1].message.content
        end
    end
    return "❌ فشل الاتصال بـ API."
end

-- Memory
local chatHistory = {}

local function loadMemory()
    if isfile and readfile and isfile(memoryFile) then
        local content = readfile(memoryFile)
        chatHistory = string.split(content, "|")
    end
end

local function saveMemory()
    if writefile then
        writefile(memoryFile, table.concat(chatHistory, "|"))
    end
end

-- Admin stealth
task.spawn(function()
    while true do
        task.wait(10)
        local detected = isAdminPresent()
        if detected and not stealthMode then
            stealthMode = true
            sendToFEChat("🚫 Gemini AI دخل وضع التخفي")
        elseif not detected and stealthMode then
            stealthMode = false
            sendToFEChat("✅ عاد Gemini AI للعمل")
        end
    end
end)

-- Load Memory and Welcome
loadMemory()
if not isAllowed() then sendToFEChat("🚫 لا تملك صلاحية استخدام Gemini AI.") return end
sendToFEChat("🤖 Gemini AI جاهز!")
if #chatHistory > 0 then sendToFEChat("🔁 تم تحميل ذاكرتك السابقة.") end

-- GUI Creation
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

createButton("🎭 تغيير الشخصية", 10, function()
    sendToFEChat("🌀 تم تغيير الشخصية! (هذه ميزة تجريبية)")
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

createButton("🔁 إعادة تشغيل الذكاء", 130, function()
    sendToFEChat("♻️ جاري إعادة التشغيل...")
    task.wait(1)
    sendToFEChat("✅ تم!")
end)

createButton("❌ إغلاق الواجهة", 170, function()
    gui:Destroy()
end)
