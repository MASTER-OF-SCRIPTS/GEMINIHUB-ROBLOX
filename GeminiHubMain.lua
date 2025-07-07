-- 🔷 Gemini Hub Infinite Edition -- Designed and powered by MASTER OF SCRIPTS 🇵🇸 -- GitHub: https://github.com/MASTER-OF-SCRIPTS

if game.CoreGui:FindFirstChild("GeminiHub") then game.CoreGui.GeminiHub:Destroy() end

local gui = Instance.new("ScreenGui") gui.Name = "GeminiHub" gui.ResetOnSpawn = false gui.Parent = game.CoreGui

local main = Instance.new("Frame") main.Size = UDim2.new(0, 350, 0, 420) main.Position = UDim2.new(0.5, -175, 0.5, -210) main.BackgroundColor3 = Color3.fromRGB(30, 30, 30) main.BorderSizePixel = 0 main.Parent = gui

local title = Instance.new("TextLabel") title.Size = UDim2.new(1, 0, 0, 40) title.BackgroundColor3 = Color3.fromRGB(50, 50, 50) title.Text = "🔷 Gemini Hub - Infinite Edition" title.TextColor3 = Color3.fromRGB(255, 255, 255) title.Font = Enum.Font.SourceSansBold title.TextSize = 18 title.Parent = main

function createButton(text, posY, callback) local btn = Instance.new("TextButton") btn.Size = UDim2.new(0.9, 0, 0, 40) btn.Position = UDim2.new(0.05, 0, 0, posY) btn.Text = text btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70) btn.TextColor3 = Color3.fromRGB(255, 255, 255) btn.Font = Enum.Font.SourceSans btn.TextSize = 16 btn.Parent = main btn.MouseButton1Click:Connect(callback) end

-- Infinite Knowledge Mode createButton("🌍 Infinite Knowledge Mode", 50, function() local responses = { "هل تعلم أن القمر لا يملك غلافًا جويًا؟", "الماء الساخن يتجمد أسرع من البارد!", "أنت تسأل، وجيميني يجيب دائمًا!", "عدد النجوم يفوق عدد حبات الرمل!" } local fact = responses[math.random(1, #responses)] game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "[Gemini AI]: " .. fact, Color = Color3.fromRGB(0, 255, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 }) end)

-- Personality Mode createButton("🧠 Personality Mode", 100, function() local moods = { "🤖 الجاد: لا وقت للضحك، هيا نعمل!", "😈 الشرير: أنا أراقب كل تحركاتك!", "😂 الكوميدي: لماذا لم تعبر الدجاجة الشارع؟", "😎 الغامض: أنا أعرف كل شيء ولا أكشف شيئًا." } local mood = moods[math.random(1, #moods)] game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "[Gemini Personality]: " .. mood, Color = Color3.fromRGB(255, 200, 0), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 }) end)

-- Random Facts Mode createButton("📚 Random Facts", 150, function() local facts = { "النحل يرقص ليدل على مكان الزهور!", "الحبار العملاق له 3 قلوب!", "القطة ترى في الظلام أفضل من الإنسان بست مرات!", "يبلغ طول الأمعاء الدقيقة 7 أمتار تقريبًا!" } local fact = facts[math.random(1, #facts)] game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "[Gemini Fact]: " .. fact, Color = Color3.fromRGB(200, 255, 100), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 }) end)

-- Translator Mode (Simulated) createButton("🌍 Language Translator", 200, function() local phrases = { {original = "Hello", arabic = "مرحبًا"}, {original = "Goodbye", arabic = "وداعًا"}, {original = "Friend", arabic = "صديق"}, {original = "Victory", arabic = "نصر"} } local pick = phrases[math.random(1, #phrases)] game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "[Translator]: '" .. pick.original .. "' ↔️ '" .. pick.arabic .. "'", Color = Color3.fromRGB(150, 150, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 }) end)

-- Quiz Mode createButton("❓ Quiz Mode", 250, function() local questions = { {q = "كم عدد الكواكب في المجموعة الشمسية؟", a = "8"}, {q = "من أول من نزل على القمر؟", a = "نيل أرمسترونغ"}, {q = "كم عدد ألوان قوس قزح؟", a = "7"}, {q = "أين تقع الأهرامات؟", a = "مصر"}, {q = "ما اسم أطول نهر في العالم؟", a = "الأمازون"} } local q = questions[math.random(1, #questions)] game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "[Gemini Quiz]: " .. q.q .. " (جاوب في الشات)", Color = Color3.fromRGB(0, 255, 127), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 }) end)

-- Joke Generator createButton("😂 Joke Generator", 300, function() local jokes = { "مرة واحد ذهب يشتري نظارة، قال له البائع: على نظرك!", "واحد بلع ساعة... من وقتها وهو حاسس بالوقت!", "ليش السمكة تخاف من الكمبيوتر؟ لأنه فيه شبكة 😂", "واحد راح يتعلم السباحة... غرق في الكتاب!" } local joke = jokes[math.random(1, #jokes)] game.StarterGui:SetCore("ChatMakeSystemMessage", { Text = "[Gemini Joke]: " .. joke, Color = Color3.fromRGB(255, 150, 0), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24 }) end)

-- Closing Button createButton("❌ Close Hub", 350, function() gui:Destroy() end)

