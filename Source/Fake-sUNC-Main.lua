local functionsToTest = { -- List of functions to test! add more if u want
	"Drawing.Fonts",
	"Drawing.new",
	"WebSocket.connect",
	"appendfile",
	"base64_decode",
	"base64_encode",
	"cache.invalidate",
	"cache.iscached",
	"cache.replace",
	"checkcaller",
	"cleardrawcache",
	"clonefunction",
	"cloneref",
	"compareinstances",
	"crypt.decrypt",
	"crypt.encrypt",
	"crypt.generatebytes",
	"crypt.generatekey",
	"crypt.hash",
	"debug.getconstant",
	"debug.getconstants",
	"debug.getinfo",
	"debug.getproto",
	"debug.getprotos",
	"debug.getstack",
	"debug.getupvalue",
	"debug.getupvalues",
	"debug.setconstant",
	"debug.setstack",
	"debug.setupvalue",
	"decompile",
	"delfile",
	"delfolder",
	"fireclickdetector",
	"fireproximityprompt",
	"firesignal",
	"firetouchinterest",
	"getcallbackvalue",
	"getcallingscript",
	"getconnections",
	"getcustomasset",
	"getgc",
	"getgenv_access",
	"gethiddenproperty",
	"gethui",
	"getinstances",
	"getloadedmodules",
	"getnamecallmethod",
	"getnilinstances",
	"getrawmetatable",
	"getrenderproperty",
	"getrenv",
	"getrunningscripts",
	"getscriptbytecode",
	"getscriptclosure",
	"getscripts",
	"getsenv",
	"getthreadidentity",
	"hookfunction",
	"hookmetamethod",
	"identifyexecutor",
	"iscclosure",
	"isexecutorclosure",
	"isfile",
	"isfolder",
	"islclosure",
	"isrbxactive",
	"isreadonly",
	"isrenderobj",
	"isscriptable",
	"listfiles",
	"loadfile",
	"loadstring",
	"lz4compress",
	"lz4decompress",
	"makefolder",
	"newcclosure",
	"readfile",
	"request",
	"restorefunction",
	"sethiddenproperty",
	"setrawmetatable",
	"setreadonly",
	"setrenderproperty",
	"setscriptable",
	"setthreadidentity",
	"writefile"
}

local Ui = {}

local failed_tests = {}
local succeeded_tests = {}

local defaultInfo = loadstring(game:HttpGet("https://github.com/skintalker/Fake-sUNC/raw/refs/heads/main/Source/info.lua"))()

-- FakeSUNC
Ui["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
Ui["1"]["IgnoreGuiInset"] = true;
Ui["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
Ui["1"]["Name"] = [[FakeSUNC]];
Ui["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- FakeSUNC.Canvas
Ui["2"] = Instance.new("CanvasGroup", Ui["1"]);
Ui["2"]["ZIndex"] = 999999;
Ui["2"]["BorderSizePixel"] = 0;
Ui["2"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
Ui["2"]["Size"] = UDim2.new(1, 0, 1, 0);
Ui["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
Ui["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["2"]["Name"] = [[Canvas]];
Ui["2"]["BackgroundTransparency"] = 1;


-- FakeSUNC.Canvas.Main
Ui["3"] = Instance.new("Frame", Ui["2"]);
Ui["3"]["BorderSizePixel"] = 0;
Ui["3"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["3"]["Size"] = UDim2.new(1, 0, 1, 0);
Ui["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["3"]["Name"] = [[Main]];
Ui["3"]["Position"] = UDim2.new(0,0,1,0)


-- FakeSUNC.Canvas.Main.Title
Ui["4"] = Instance.new("TextLabel", Ui["3"]);
Ui["4"]["TextWrapped"] = true;
Ui["4"]["BorderSizePixel"] = 0;
Ui["4"]["TextScaled"] = true;
Ui["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["4"]["TextSize"] = 14;
Ui["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["4"]["BackgroundTransparency"] = 1;
Ui["4"]["Size"] = UDim2.new(1, 0, 0.07814, 0);
Ui["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["4"]["Text"] = [[Fake sUNC Test]];
Ui["4"]["Name"] = [[Title]];
Ui["4"]["Position"] = UDim2.new(0, 0, 0.01133, 0);


-- FakeSUNC.Canvas.Main.note
Ui["5"] = Instance.new("TextLabel", Ui["3"]);
Ui["5"]["TextWrapped"] = true;
Ui["5"]["BorderSizePixel"] = 0;
Ui["5"]["TextScaled"] = true;
Ui["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["5"]["TextSize"] = 14;
Ui["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["5"]["BackgroundTransparency"] = 1;
Ui["5"]["Size"] = UDim2.new(0.544, 0, 0.053, 0);
Ui["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["5"]["Text"] = [[Press K to toggle UI. Please send me feedback or new features at my discord btw.]];
Ui["5"]["Name"] = [[note]];
Ui["5"]["Position"] = UDim2.new(0.008, 0, 0.946, 0);


-- FakeSUNC.Canvas.Main.credits
Ui["6"] = Instance.new("TextLabel", Ui["3"]);
Ui["6"]["TextWrapped"] = true;
Ui["6"]["BorderSizePixel"] = 0;
Ui["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["6"]["TextScaled"] = true;
Ui["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["6"]["TextSize"] = 14;
Ui["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["6"]["BackgroundTransparency"] = 1;
Ui["6"]["Size"] = UDim2.new(0.31199, 0, 0.07098, 0);
Ui["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["6"]["Text"] = [[Made by @skintalker on discord.]];
Ui["6"]["Name"] = [[credits]];
Ui["6"]["Position"] = UDim2.new(0.00719, 0, -0.00081, 0);


-- FakeSUNC.Canvas.Main.ExecuteButton
Ui["7"] = Instance.new("TextButton", Ui["3"]);
Ui["7"]["TextWrapped"] = true;
Ui["7"]["BorderSizePixel"] = 0;
Ui["7"]["TextSize"] = 14;
Ui["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["7"]["TextScaled"] = true;
Ui["7"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
Ui["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["7"]["AnchorPoint"] = Vector2.new(0.5, 0);
Ui["7"]["Size"] = UDim2.new(0.24107, 0, 0.08381, 0);
Ui["7"]["Name"] = [[ExecuteButton]];
Ui["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["7"]["Text"] = [[Execute (or Q)]];
Ui["7"]["Position"] = UDim2.new(0.8647, 0, 0.89589, 0);


-- FakeSUNC.Canvas.Main.ExecuteButton.UICorner
Ui["8"] = Instance.new("UICorner", Ui["7"]);
Ui["8"]["CornerRadius"] = UDim.new(0.25, 0);


-- FakeSUNC.Canvas.Main.ExecuteButton.UIStroke
Ui["9"] = Instance.new("UIStroke", Ui["7"]);
Ui["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Ui["9"]["Thickness"] = 5;
Ui["9"]["Color"] = Color3.fromRGB(21, 21, 21);


-- FakeSUNC.Canvas.Main.UIGradient
Ui["a"] = Instance.new("UIGradient", Ui["3"]);
Ui["a"]["Rotation"] = 90;
Ui["a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(224, 224, 224)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(214, 214, 214))};


-- FakeSUNC.Canvas.Main.scrollingFrames
Ui["b"] = Instance.new("Folder", Ui["3"]);
Ui["b"]["Name"] = [[scrollingFrames]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Total
Ui["c"] = Instance.new("Folder", Ui["b"]);
Ui["c"]["Name"] = [[Total]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.total
Ui["d"] = Instance.new("TextLabel", Ui["c"]);
Ui["d"]["TextWrapped"] = true;
Ui["d"]["BorderSizePixel"] = 0;
Ui["d"]["TextScaled"] = true;
Ui["d"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["d"]["TextSize"] = 14;
Ui["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["d"]["Size"] = UDim2.new(0.28709, 0, 0.05379, 0);
Ui["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["d"]["Text"] = [[Total: ...]];
Ui["d"]["Name"] = [[total]];
Ui["d"]["Position"] = UDim2.new(0.03228, 0, 0.10646, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.totalFrame
Ui["e"] = Instance.new("ScrollingFrame", Ui["c"]);
Ui["e"]["Active"] = true;
Ui["e"]["ZIndex"] = 3;
Ui["e"]["BorderSizePixel"] = 0;
Ui["e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
Ui["e"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["e"]["Name"] = [[totalFrame]];
Ui["e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
Ui["e"]["Size"] = UDim2.new(0.28709, 0, 0.46434, 0);
Ui["e"]["Position"] = UDim2.new(0.03228, 0, 0.1624, 0);
Ui["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.totalFrame.UIListLayout
Ui["f"] = Instance.new("UIListLayout", Ui["e"]);
Ui["f"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
Ui["f"]["Padding"] = UDim.new(0, 5);
Ui["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar
Ui["10"] = Instance.new("Folder", Ui["c"]);
Ui["10"]["Name"] = [[BottomBar]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.Circle2
Ui["11"] = Instance.new("ImageLabel", Ui["10"]);
Ui["11"]["BorderSizePixel"] = 0;
Ui["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["11"]["ImageColor3"] = Color3.fromRGB(46, 46, 46);
Ui["11"]["Image"] = [[http://www.roblox.com/asset/?id=9208578430]];
Ui["11"]["Size"] = UDim2.new(0.08702, 0, 0.15463, 0);
Ui["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["11"]["BackgroundTransparency"] = 1;
Ui["11"]["Name"] = [[Circle2]];
Ui["11"]["Position"] = UDim2.new(0.23179, 0, 0.5509, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.Circle1
Ui["12"] = Instance.new("ImageLabel", Ui["10"]);
Ui["12"]["BorderSizePixel"] = 0;
Ui["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["12"]["ImageColor3"] = Color3.fromRGB(46, 46, 46);
Ui["12"]["Image"] = [[http://www.roblox.com/asset/?id=9208578430]];
Ui["12"]["Size"] = UDim2.new(0.08702, 0, 0.15463, 0);
Ui["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["12"]["BackgroundTransparency"] = 1;
Ui["12"]["Name"] = [[Circle1]];
Ui["12"]["Position"] = UDim2.new(0.03283, 0, 0.5509, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.buttons
Ui["13"] = Instance.new("CanvasGroup", Ui["10"]);
Ui["13"]["ZIndex"] = 2;
Ui["13"]["BorderSizePixel"] = 0;
Ui["13"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46);
Ui["13"]["Size"] = UDim2.new(0.19305, 0, 0.08029, 0);
Ui["13"]["Position"] = UDim2.new(0.07882, 0, 0.62535, 0);
Ui["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["13"]["Name"] = [[buttons]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.buttons.New
Ui["14"] = Instance.new("ImageButton", Ui["13"]);
Ui["14"]["BorderSizePixel"] = 0;
Ui["14"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["14"]["Image"] = [[http://www.roblox.com/asset/?id=12072054746]];
Ui["14"]["Size"] = UDim2.new(0.21681, 0, 0.85965, 0);
Ui["14"]["BackgroundTransparency"] = 0.5;
Ui["14"]["Name"] = [[New]];
Ui["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["14"]["Position"] = UDim2.new(-0.15155, 0, 0.4386, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.buttons.UIListLayout
Ui["15"] = Instance.new("UIListLayout", Ui["13"]);
Ui["15"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
Ui["15"]["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceAround;
Ui["15"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
Ui["15"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
Ui["15"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.buttons.Up
Ui["16"] = Instance.new("ImageButton", Ui["13"]);
Ui["16"]["BorderSizePixel"] = 0;
Ui["16"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["16"]["Image"] = [[http://www.roblox.com/asset/?id=18705278858]];
Ui["16"]["Size"] = UDim2.new(0.21681, 0, 0.85965, 0);
Ui["16"]["BackgroundTransparency"] = 0.5;
Ui["16"]["Name"] = [[Up]];
Ui["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["16"]["Position"] = UDim2.new(0.09845, 0, 0.4386, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.buttons.Down
Ui["17"] = Instance.new("ImageButton", Ui["13"]);
Ui["17"]["BorderSizePixel"] = 0;
Ui["17"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["17"]["Image"] = [[http://www.roblox.com/asset/?id=18705278858]];
Ui["17"]["ImageRectSize"] = Vector2.new(1024, -1024);
Ui["17"]["Size"] = UDim2.new(0.21681, 0, 0.85965, 0);
Ui["17"]["BackgroundTransparency"] = 0.5;
Ui["17"]["Name"] = [[Down]];
Ui["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["17"]["ImageRectOffset"] = Vector2.new(0, 1024);
Ui["17"]["Position"] = UDim2.new(0.34845, 0, 0.4386, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Total.BottomBar.buttons.Delete
Ui["18"] = Instance.new("ImageButton", Ui["13"]);
Ui["18"]["BorderSizePixel"] = 0;
Ui["18"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["18"]["Image"] = [[http://www.roblox.com/asset/?id=6741600111]];
Ui["18"]["Size"] = UDim2.new(0.21681, 0, 0.85965, 0);
Ui["18"]["BackgroundTransparency"] = 0.5;
Ui["18"]["Name"] = [[Delete]];
Ui["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["18"]["Position"] = UDim2.new(0.59845, 0, 0.4386, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed
Ui["19"] = Instance.new("Folder", Ui["b"]);
Ui["19"]["Name"] = [[Failed]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.failed
Ui["1a"] = Instance.new("TextLabel", Ui["19"]);
Ui["1a"]["TextWrapped"] = true;
Ui["1a"]["BorderSizePixel"] = 0;
Ui["1a"]["TextScaled"] = true;
Ui["1a"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["1a"]["TextSize"] = 14;
Ui["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["1a"]["Size"] = UDim2.new(0.28709, 0, 0.05493, 0);
Ui["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["1a"]["Text"] = [[Failed: ...]];
Ui["1a"]["Name"] = [[failed]];
Ui["1a"]["Position"] = UDim2.new(0.35646, 0, 0.10532, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.failedFrame
Ui["1b"] = Instance.new("ScrollingFrame", Ui["19"]);
Ui["1b"]["Active"] = true;
Ui["1b"]["ZIndex"] = 3;
Ui["1b"]["BorderSizePixel"] = 0;
Ui["1b"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
Ui["1b"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["1b"]["Name"] = [[failedFrame]];
Ui["1b"]["AnchorPoint"] = Vector2.new(0.5, 0);
Ui["1b"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
Ui["1b"]["Size"] = UDim2.new(0.287, 0, 0.464, 0);
Ui["1b"]["Position"] = UDim2.new(0.5, 0, 0.16251, 0);
Ui["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.failedFrame.UIListLayout
Ui["1c"] = Instance.new("UIListLayout", Ui["1b"]);
Ui["1c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
Ui["1c"]["Padding"] = UDim.new(0, 5);
Ui["1c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.BottomBar
Ui["1d"] = Instance.new("Folder", Ui["19"]);
Ui["1d"]["Name"] = [[BottomBar]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.BottomBar.Circle2
Ui["1e"] = Instance.new("ImageLabel", Ui["1d"]);
Ui["1e"]["BorderSizePixel"] = 0;
Ui["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["1e"]["ImageColor3"] = Color3.fromRGB(46, 46, 46);
Ui["1e"]["Image"] = [[http://www.roblox.com/asset/?id=9208578430]];
Ui["1e"]["Size"] = UDim2.new(0.08702, 0, 0.15463, 0);
Ui["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["1e"]["BackgroundTransparency"] = 1;
Ui["1e"]["Name"] = [[Circle2]];
Ui["1e"]["Position"] = UDim2.new(0.55591, 0, 0.5509, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.BottomBar.Circle1
Ui["1f"] = Instance.new("ImageLabel", Ui["1d"]);
Ui["1f"]["BorderSizePixel"] = 0;
Ui["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["1f"]["ImageColor3"] = Color3.fromRGB(46, 46, 46);
Ui["1f"]["Image"] = [[http://www.roblox.com/asset/?id=9208578430]];
Ui["1f"]["Size"] = UDim2.new(0.08702, 0, 0.15463, 0);
Ui["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["1f"]["BackgroundTransparency"] = 1;
Ui["1f"]["Name"] = [[Circle1]];
Ui["1f"]["Position"] = UDim2.new(0.35696, 0, 0.5509, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.BottomBar.buttons
Ui["20"] = Instance.new("CanvasGroup", Ui["1d"]);
Ui["20"]["ZIndex"] = 2;
Ui["20"]["BorderSizePixel"] = 0;
Ui["20"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46);
Ui["20"]["Size"] = UDim2.new(0.19305, 0, 0.08029, 0);
Ui["20"]["Position"] = UDim2.new(0.40295, 0, 0.62535, 0);
Ui["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["20"]["Name"] = [[buttons]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Failed.BottomBar.buttons.UIListLayout
Ui["21"] = Instance.new("UIListLayout", Ui["20"]);
Ui["21"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
Ui["21"]["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceAround;
Ui["21"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
Ui["21"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
Ui["21"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed
Ui["22"] = Instance.new("Folder", Ui["b"]);
Ui["22"]["Name"] = [[Passed]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.passed
Ui["23"] = Instance.new("TextLabel", Ui["22"]);
Ui["23"]["TextWrapped"] = true;
Ui["23"]["BorderSizePixel"] = 0;
Ui["23"]["TextScaled"] = true;
Ui["23"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["23"]["TextSize"] = 14;
Ui["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["23"]["Size"] = UDim2.new(0.2864, 0, 0.05493, 0);
Ui["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["23"]["Text"] = [[Passed: ...]];
Ui["23"]["Name"] = [[passed]];
Ui["23"]["Position"] = UDim2.new(0.68063, 0, 0.10532, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.passedFrame
Ui["24"] = Instance.new("ScrollingFrame", Ui["22"]);
Ui["24"]["Active"] = true;
Ui["24"]["ZIndex"] = 3;
Ui["24"]["BorderSizePixel"] = 0;
Ui["24"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
Ui["24"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["24"]["Name"] = [[passedFrame]];
Ui["24"]["AnchorPoint"] = Vector2.new(0.5, 0);
Ui["24"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
Ui["24"]["Size"] = UDim2.new(0.287, 0, 0.464, 0);
Ui["24"]["Position"] = UDim2.new(0.824, 0, 0.16251, 0);
Ui["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.passedFrame.UIListLayout
Ui["25"] = Instance.new("UIListLayout", Ui["24"]);
Ui["25"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
Ui["25"]["Padding"] = UDim.new(0, 5);
Ui["25"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.BottomBar
Ui["26"] = Instance.new("Folder", Ui["22"]);
Ui["26"]["Name"] = [[BottomBar]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.BottomBar.Circle2
Ui["27"] = Instance.new("ImageLabel", Ui["26"]);
Ui["27"]["BorderSizePixel"] = 0;
Ui["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["27"]["ImageColor3"] = Color3.fromRGB(46, 46, 46);
Ui["27"]["Image"] = [[http://www.roblox.com/asset/?id=9208578430]];
Ui["27"]["Size"] = UDim2.new(0.08702, 0, 0.15463, 0);
Ui["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["27"]["BackgroundTransparency"] = 1;
Ui["27"]["Name"] = [[Circle2]];
Ui["27"]["Position"] = UDim2.new(0.87952, 0, 0.5509, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.BottomBar.Circle1
Ui["28"] = Instance.new("ImageLabel", Ui["26"]);
Ui["28"]["BorderSizePixel"] = 0;
Ui["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["28"]["ImageColor3"] = Color3.fromRGB(46, 46, 46);
Ui["28"]["Image"] = [[http://www.roblox.com/asset/?id=9208578430]];
Ui["28"]["Size"] = UDim2.new(0.08702, 0, 0.15463, 0);
Ui["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["28"]["BackgroundTransparency"] = 1;
Ui["28"]["Name"] = [[Circle1]];
Ui["28"]["Position"] = UDim2.new(0.68056, 0, 0.5509, 0);


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.BottomBar.buttons
Ui["29"] = Instance.new("CanvasGroup", Ui["26"]);
Ui["29"]["ZIndex"] = 2;
Ui["29"]["BorderSizePixel"] = 0;
Ui["29"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46);
Ui["29"]["Size"] = UDim2.new(0.19305, 0, 0.08029, 0);
Ui["29"]["Position"] = UDim2.new(0.72655, 0, 0.62535, 0);
Ui["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["29"]["Name"] = [[buttons]];


-- FakeSUNC.Canvas.Main.scrollingFrames.Passed.BottomBar.buttons.UIListLayout
Ui["2a"] = Instance.new("UIListLayout", Ui["29"]);
Ui["2a"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
Ui["2a"]["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceAround;
Ui["2a"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
Ui["2a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
Ui["2a"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- FakeSUNC.Canvas.Main.info
Ui["2b"] = Instance.new("TextLabel", Ui["3"]);
Ui["2b"]["TextWrapped"] = true;
Ui["2b"]["BorderSizePixel"] = 0;
Ui["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["2b"]["TextScaled"] = true;
Ui["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
Ui["2b"]["TextSize"] = 14;
Ui["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["2b"]["BackgroundTransparency"] = 1;
Ui["2b"]["Size"] = UDim2.new(0.52075, 0, 0.07098, 0);
Ui["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["2b"]["Text"] = [[Tap on a functions ❌ or ✅ to switch between pass or fail]];
Ui["2b"]["Name"] = [[info]];
Ui["2b"]["Position"] = UDim2.new(0.03176, 0, 0.70656, 0);


-- FakeSUNC.Canvas.Main.configs
Ui["2c"] = Instance.new("Folder", Ui["3"]);
Ui["2c"]["Name"] = [[configs]];


-- FakeSUNC.Canvas.Main.configs.exMarkMoji
Ui["2d"] = Instance.new("TextLabel", Ui["2c"]);
Ui["2d"]["TextWrapped"] = true;
Ui["2d"]["BorderSizePixel"] = 0;
Ui["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["2d"]["TextScaled"] = true;
Ui["2d"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["2d"]["TextSize"] = 14;
Ui["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["2d"]["BackgroundTransparency"] = 1;
Ui["2d"]["Size"] = UDim2.new(0.15581, 0, 0.05663, 0);
Ui["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["2d"]["Text"] = [[Exclamation:]];
Ui["2d"]["Name"] = [[exMarkMoji]];
Ui["2d"]["Position"] = UDim2.new(0.23008, 0, 0.87995, 0);


-- FakeSUNC.Canvas.Main.configs.exMarkMoji.TextBox
Ui["2e"] = Instance.new("TextBox", Ui["2d"]);
Ui["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["2e"]["BorderSizePixel"] = 0;
Ui["2e"]["TextWrapped"] = true;
Ui["2e"]["TextSize"] = 34;
Ui["2e"]["TextScaled"] = true;
Ui["2e"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["2e"]["Size"] = UDim2.new(0.173, 0, 0.85, 0);
Ui["2e"]["Position"] = UDim2.new(1, 0, 0.12427, 0);
Ui["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["2e"]["Text"] = [[❗]];


-- FakeSUNC.Canvas.Main.configs.exMarkMoji.TextBox.UICorner
Ui["2f"] = Instance.new("UICorner", Ui["2e"]);



-- FakeSUNC.Canvas.Main.configs.passMoji
Ui["30"] = Instance.new("TextLabel", Ui["2c"]);
Ui["30"]["TextWrapped"] = true;
Ui["30"]["BorderSizePixel"] = 0;
Ui["30"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["30"]["TextScaled"] = true;
Ui["30"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["30"]["TextSize"] = 14;
Ui["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["30"]["BackgroundTransparency"] = 1;
Ui["30"]["Size"] = UDim2.new(0.08865, 0, 0.05663, 0);
Ui["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["30"]["Text"] = [[Pass:]];
Ui["30"]["Name"] = [[passMoji]];
Ui["30"]["Position"] = UDim2.new(0.125, 0, 0.87995, 0);


-- FakeSUNC.Canvas.Main.configs.passMoji.TextBox
Ui["31"] = Instance.new("TextBox", Ui["30"]);
Ui["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["31"]["BorderSizePixel"] = 0;
Ui["31"]["TextWrapped"] = true;
Ui["31"]["TextSize"] = 34;
Ui["31"]["TextScaled"] = true;
Ui["31"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["31"]["Size"] = UDim2.new(0.3, 0, 0.85, 0);
Ui["31"]["Position"] = UDim2.new(0.73769, 0, 0.12427, 0);
Ui["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["31"]["Text"] = [[✅]];


-- FakeSUNC.Canvas.Main.configs.passMoji.TextBox.UICorner
Ui["32"] = Instance.new("UICorner", Ui["31"]);



-- FakeSUNC.Canvas.Main.configs.failMoji
Ui["33"] = Instance.new("TextLabel", Ui["2c"]);
Ui["33"]["TextWrapped"] = true;
Ui["33"]["BorderSizePixel"] = 0;
Ui["33"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["33"]["TextScaled"] = true;
Ui["33"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["33"]["TextSize"] = 14;
Ui["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["33"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["33"]["BackgroundTransparency"] = 1;
Ui["33"]["Size"] = UDim2.new(0.08865, 0, 0.05663, 0);
Ui["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["33"]["Text"] = [[Fail:]];
Ui["33"]["Name"] = [[failMoji]];
Ui["33"]["Position"] = UDim2.new(0.03228, 0, 0.87769, 0);


-- FakeSUNC.Canvas.Main.configs.failMoji.TextBox
Ui["34"] = Instance.new("TextBox", Ui["33"]);
Ui["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["34"]["BorderSizePixel"] = 0;
Ui["34"]["TextWrapped"] = true;
Ui["34"]["TextSize"] = 34;
Ui["34"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
Ui["34"]["TextScaled"] = true;
Ui["34"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["34"]["Size"] = UDim2.new(0.3, 0, 0.85, 0);
Ui["34"]["Position"] = UDim2.new(0.63261, 0, 0.12427, 0);
Ui["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["34"]["Text"] = [[❌]];


-- FakeSUNC.Canvas.Main.configs.failMoji.TextBox.UICorner
Ui["35"] = Instance.new("UICorner", Ui["34"]);



-- FakeSUNC.Canvas.Main.configs.smirkMoji
Ui["36"] = Instance.new("TextLabel", Ui["2c"]);
Ui["36"]["TextWrapped"] = true;
Ui["36"]["BorderSizePixel"] = 0;
Ui["36"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["36"]["TextScaled"] = true;
Ui["36"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["36"]["TextSize"] = 14;
Ui["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["36"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["36"]["BackgroundTransparency"] = 1;
Ui["36"]["Size"] = UDim2.new(0.15581, 0, 0.05663, 0);
Ui["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["36"]["Text"] = [[Smirk:]];
Ui["36"]["Name"] = [[smirkMoji]];
Ui["36"]["Position"] = UDim2.new(0.60714, 0, 0.87995, 0);


-- FakeSUNC.Canvas.Main.configs.smirkMoji.TextBox
Ui["37"] = Instance.new("TextBox", Ui["36"]);
Ui["37"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["37"]["BorderSizePixel"] = 0;
Ui["37"]["TextWrapped"] = true;
Ui["37"]["TextSize"] = 34;
Ui["37"]["TextScaled"] = true;
Ui["37"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["37"]["Size"] = UDim2.new(0.173, 0, 0.85, 0);
Ui["37"]["Position"] = UDim2.new(0.54849, 0, 0.12427, 0);
Ui["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["37"]["Text"] = [[😏]];


-- FakeSUNC.Canvas.Main.configs.smirkMoji.TextBox.UICorner
Ui["38"] = Instance.new("UICorner", Ui["37"]);



-- FakeSUNC.Canvas.Main.configs.coolMoji
Ui["39"] = Instance.new("TextLabel", Ui["2c"]);
Ui["39"]["TextWrapped"] = true;
Ui["39"]["BorderSizePixel"] = 0;
Ui["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["39"]["TextScaled"] = true;
Ui["39"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["39"]["TextSize"] = 14;
Ui["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["39"]["BackgroundTransparency"] = 1;
Ui["39"]["Size"] = UDim2.new(0.15581, 0, 0.05663, 0);
Ui["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["39"]["Text"] = [[Sunglasses:]];
Ui["39"]["Name"] = [[coolMoji]];
Ui["39"]["Position"] = UDim2.new(0.4217, 0, 0.87995, 0);


-- FakeSUNC.Canvas.Main.configs.coolMoji.TextBox
Ui["3a"] = Instance.new("TextBox", Ui["39"]);
Ui["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["3a"]["BorderSizePixel"] = 0;
Ui["3a"]["TextWrapped"] = true;
Ui["3a"]["TextSize"] = 34;
Ui["3a"]["TextScaled"] = true;
Ui["3a"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["3a"]["Size"] = UDim2.new(0.173, 0, 0.85, 0);
Ui["3a"]["Position"] = UDim2.new(0.9571, 0, 0.12427, 0);
Ui["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["3a"]["Text"] = [[😎]];


-- FakeSUNC.Canvas.Main.configs.coolMoji.TextBox.UICorner
Ui["3b"] = Instance.new("UICorner", Ui["3a"]);



-- FakeSUNC.Canvas.Main.configs.SucText
Ui["3c"] = Instance.new("TextLabel", Ui["2c"]);
Ui["3c"]["TextWrapped"] = true;
Ui["3c"]["BorderSizePixel"] = 0;
Ui["3c"]["TextScaled"] = true;
Ui["3c"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["3c"]["TextSize"] = 14;
Ui["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["3c"]["BackgroundTransparency"] = 1;
Ui["3c"]["Size"] = UDim2.new(0.13736, 0, 0.05663, 0);
Ui["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["3c"]["Text"] = [[Success Text:]];
Ui["3c"]["Name"] = [[SucText]];
Ui["3c"]["Position"] = UDim2.new(0.03228, 0, 0.82673, 0);


-- FakeSUNC.Canvas.Main.configs.SucText.TextBox
Ui["3d"] = Instance.new("TextBox", Ui["3c"]);
Ui["3d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["3d"]["BorderSizePixel"] = 0;
Ui["3d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["3d"]["TextWrapped"] = true;
Ui["3d"]["TextSize"] = 14;
Ui["3d"]["TextScaled"] = true;
Ui["3d"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["3d"]["PlaceholderText"] = [[Put success text up to the success rate here.]];
Ui["3d"]["Size"] = UDim2.new(1.46653, 0, 0.86, 0);
Ui["3d"]["Position"] = UDim2.new(1.04, 0, 0.10427, 0);
Ui["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["3d"]["Text"] = [[Passed the test with]];


-- FakeSUNC.Canvas.Main.configs.SucText.TextBox.UICorner
Ui["3e"] = Instance.new("UICorner", Ui["3d"]);



-- FakeSUNC.Canvas.Main.configs.SucText.SucText
Ui["3f"] = Instance.new("TextLabel", Ui["3c"]);
Ui["3f"]["TextWrapped"] = true;
Ui["3f"]["BorderSizePixel"] = 0;
Ui["3f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["3f"]["TextScaled"] = true;
Ui["3f"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["3f"]["TextSize"] = 14;
Ui["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["3f"]["BackgroundTransparency"] = 1;
Ui["3f"]["Size"] = UDim2.new(2.09614, 0, 0.97112, 0);
Ui["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["3f"]["Text"] = [[_% success rate (_ out of _)]];
Ui["3f"]["Name"] = [[SucText]];
Ui["3f"]["Position"] = UDim2.new(2.5342, 0, 0.019, 0);


-- FakeSUNC.Canvas.Main.configs.Contribs
Ui["40"] = Instance.new("TextLabel", Ui["2c"]);
Ui["40"]["TextWrapped"] = true;
Ui["40"]["BorderSizePixel"] = 0;
Ui["40"]["TextScaled"] = true;
Ui["40"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["40"]["TextSize"] = 14;
Ui["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["40"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["40"]["BackgroundTransparency"] = 1;
Ui["40"]["Size"] = UDim2.new(0.13736, 0, 0.05663, 0);
Ui["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["40"]["Text"] = [[Contributors:]];
Ui["40"]["Name"] = [[Contribs]];
Ui["40"]["Position"] = UDim2.new(0.03228, 0, 0.77123, 0);


-- FakeSUNC.Canvas.Main.configs.Contribs.TextBox
Ui["41"] = Instance.new("TextBox", Ui["40"]);
Ui["41"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["41"]["BorderSizePixel"] = 0;
Ui["41"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["41"]["TextWrapped"] = true;
Ui["41"]["TextSize"] = 14;
Ui["41"]["TextScaled"] = true;
Ui["41"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["41"]["PlaceholderText"] = [[Put contributors here! (ex. skintalker, sens, etc..)]];
Ui["41"]["Size"] = UDim2.new(3.92, 0, 0.86, 0);
Ui["41"]["Position"] = UDim2.new(1.045, 0, 0.12427, 0);
Ui["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["41"]["Text"] = defaultInfo.Contribs;


-- FakeSUNC.Canvas.Main.configs.Contribs.TextBox.UICorner
Ui["42"] = Instance.new("UICorner", Ui["41"]);



-- FakeSUNC.Canvas.Main.configs.Ver
Ui["43"] = Instance.new("TextLabel", Ui["2c"]);
Ui["43"]["TextWrapped"] = true;
Ui["43"]["BorderSizePixel"] = 0;
Ui["43"]["TextScaled"] = true;
Ui["43"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["43"]["TextSize"] = 14;
Ui["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["43"]["BackgroundTransparency"] = 1;
Ui["43"]["Size"] = UDim2.new(0.08865, 0, 0.05663, 0);
Ui["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["43"]["Text"] = [[Version:]];
Ui["43"]["Name"] = [[Ver]];
Ui["43"]["Position"] = UDim2.new(0.72115, 0, 0.77123, 0);


-- FakeSUNC.Canvas.Main.configs.Ver.TextBox
Ui["44"] = Instance.new("TextBox", Ui["43"]);
Ui["44"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["44"]["BorderSizePixel"] = 0;
Ui["44"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["44"]["TextWrapped"] = true;
Ui["44"]["TextSize"] = 14;
Ui["44"]["TextScaled"] = true;
Ui["44"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["44"]["PlaceholderText"] = [[Put version here!]];
Ui["44"]["Size"] = UDim2.new(1.7286, 0, 0.86, 0);
Ui["44"]["Position"] = UDim2.new(1.045, 0, 0.12427, 0);
Ui["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["44"]["Text"] = defaultInfo.Ver;


-- FakeSUNC.Canvas.Main.configs.Ver.TextBox.UICorner
Ui["45"] = Instance.new("UICorner", Ui["44"]);



-- FakeSUNC.Canvas.Main.configs.DiscText
Ui["46"] = Instance.new("TextLabel", Ui["2c"]);
Ui["46"]["TextWrapped"] = true;
Ui["46"]["BorderSizePixel"] = 0;
Ui["46"]["TextScaled"] = true;
Ui["46"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["46"]["TextSize"] = 14;
Ui["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
Ui["46"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["46"]["BackgroundTransparency"] = 1;
Ui["46"]["Size"] = UDim2.new(0.09076, 0, 0.05663, 0);
Ui["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["46"]["Text"] = [[Discord:]];
Ui["46"]["Name"] = [[DiscText]];
Ui["46"]["Position"] = UDim2.new(0.6722, 0, 0.824, 0);


-- FakeSUNC.Canvas.Main.configs.DiscText.TextBox
Ui["47"] = Instance.new("TextBox", Ui["46"]);
Ui["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
Ui["47"]["BorderSizePixel"] = 0;
Ui["47"]["TextXAlignment"] = Enum.TextXAlignment.Left;
Ui["47"]["TextWrapped"] = true;
Ui["47"]["TextSize"] = 14;
Ui["47"]["TextScaled"] = true;
Ui["47"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
Ui["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
Ui["47"]["PlaceholderText"] = [[discord.gg/rx4nbdQPx6]];
Ui["47"]["Size"] = UDim2.new(1.82365, 0, 0.86, 0);
Ui["47"]["Position"] = UDim2.new(1.04, 0, 0.10427, 0);
Ui["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["47"]["Text"] = defaultInfo.Discord;


-- FakeSUNC.Canvas.Main.configs.DiscText.TextBox.UICorner
Ui["48"] = Instance.new("UICorner", Ui["47"]);



-- FakeSUNC.Canvas.Main.Close
Ui["49"] = Instance.new("TextButton", Ui["3"]);
Ui["49"]["TextWrapped"] = true;
Ui["49"]["BorderSizePixel"] = 0;
Ui["49"]["TextSize"] = 14;
Ui["49"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
Ui["49"]["TextScaled"] = true;
Ui["49"]["BackgroundColor3"] = Color3.fromRGB(34, 34, 34);
Ui["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
Ui["49"]["Size"] = UDim2.new(0.03258, 0, 0.05771, 0);
Ui["49"]["Name"] = [[Close]];
Ui["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
Ui["49"]["Text"] = [[❌]];
Ui["49"]["Position"] = UDim2.new(0.95961, 0, 0.01246, 0);


-- FakeSUNC.Canvas.Main.Close.UIStroke
Ui["4a"] = Instance.new("UIStroke", Ui["49"]);
Ui["4a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
Ui["4a"]["Thickness"] = 3;
Ui["4a"]["Color"] = Color3.fromRGB(34, 34, 34);


-- FakeSUNC.Canvas.Main.LocalScript
Ui["4b"] = Instance.new("Part", Ui["3"]);
Ui["4b"]["Name"] = "FakeScript"
local script = Ui["4b"];

-- big bunch of ui crap coming up

local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local closeButton = script.Parent.Close

local closeTweenInfo = TweenInfo.new(
	1.5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0.1

)
local closeProp = {
	["Position"] = UDim2.new(0, 0, -1, 0)
}

local closeTween = tweenService:Create(script.Parent, closeTweenInfo, closeProp)

local openTweenInfo = TweenInfo.new(
	1.5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0.1

)
local openProp = {
	["Position"] = UDim2.new(0, 0, 0, 0)
}

local openTween = tweenService:Create(script.Parent, openTweenInfo, openProp)
local gone = false

closeButton.Activated:Connect(function()
	closeTween:Play()
	wait(0.75)
	closeTween.Changed:Wait()
	if closeTween.PlaybackState == Enum.PlaybackState.Completed then
		script.Parent.Parent.Parent:Destroy()
		gone = true
	end
end)


uis.InputBegan:Connect(function(input, gameprocessed)
	if not gameprocessed then
		if not gone then
			if input.KeyCode == Enum.KeyCode.K then
				if script.Parent.Position == UDim2.new(0, 0, -1, 0) then
					openTween:Play();
				else
					closeTween:Play();
				end;
			elseif input.KeyCode == Enum.KeyCode.Q then
				Execute()
			end
		end
	end
end)

local function refreshLists(select)
	if select == nil then select = false end
	for i,v in script.Parent.scrollingFrames:GetDescendants() do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
	for i,v in pairs(functionsToTest) do
		if table.find(failed_tests, v) then
			if v == selected_test and select == true then
				newFunction(v, false, "failed") 
				newFunction(v, false, "total", true)
			else
				newFunction(v, false, "failed") 
				newFunction(v, false, "total")
			end
		elseif table.find(succeeded_tests, v) then
			if v == selected_test and select == true then
				newFunction(v, true, "passed") 
				newFunction(v, true, "total", true)
			else
				newFunction(v, true, "passed") 
				newFunction(v, true, "total")
			end
		elseif table.find(functionsToTest, v) then
			if v == selected_test and select == true then
				newFunction(v, true, "total", true)
			else
				newFunction(v, true, "total")
			end
		end
	end
end

local function tableFunctions(func, item, name, ogName, direction, list)
	if func == "rename" then
		local index = table.find(succeeded_tests, ogName)
		if index then succeeded_tests[index] = name end
		local index2 = table.find(failed_tests, ogName)
		if index2 then failed_tests[index2] = name end
		functionsToTest[item] = name
	elseif func == "add" then
		local listObj = list == "total" and script.Parent.scrollingFrames.Total or list == "passed" and script.Parent.scrollingFrames.Passed or list == "failed" and script.Parent.scrollingFrames.Failed
		local listFrame = listObj[list.."Frame"]
		local listTable = list == "passed" and succeeded_tests or list == "failed" and failed_tests or list == nil and succeeded_tests or list == "total" and succeeded_tests
		table.insert(functionsToTest, name)
		table.insert(listTable, name)
		refreshLists()
		updateText()
		listFrame.CanvasPosition = Vector2.new(0, 99999999)
	elseif func == "remove" then
		local index = table.find(functionsToTest, name)
		if index then table.remove(functionsToTest, index) end
		local index2 = table.find(failed_tests, name)
		if index2 then table.remove(failed_tests, index2) end
		local index3 = table.find(succeeded_tests, name)
		if index3 then table.remove(succeeded_tests, index3) end
		selected_list = ""
		selected_test = ""
		selected = false
		refreshLists()
		updateText()
	elseif func == "move" then
		local index = table.find(functionsToTest, selected_test)
		if index then
			local newIndex = direction == "down" and index + 1 or direction == "up" and index - 1
			if newIndex > #functionsToTest or newIndex < 1 then return end
			table.remove(functionsToTest, index)
			table.insert(functionsToTest, newIndex, selected_test)
			selected_test = name
			refreshLists(true)
			updateText()
		end
	end
end

local buttons = {
	["Total"] = script.Parent.scrollingFrames.Total.BottomBar.buttons,
	["Failed"] = script.Parent.scrollingFrames.Failed.BottomBar.buttons,
	["Passed"] = script.Parent.scrollingFrames.Passed.BottomBar.buttons
}

for _, button in buttons.Total:GetChildren() do
	if button:IsA("ImageButton") then
		button.Activated:Connect(function()
			if selected_test == "" then 
				if button.Name == "New" then
					tableFunctions("add", nil, "", nil, nil, "total")
				end
			else
				if button.Name == "Delete" then
					if selected_list == "total" then
						tableFunctions("remove", nil, selected_test, nil, nil, nil)
					end
				elseif button.Name == "Up" then
					if selected_list == "total" then
						tableFunctions("move", nil, selected_test, nil, "up", nil)
					end
				elseif button.Name == "Down" then
					if selected_list == "total" then
						tableFunctions("move", nil, selected_test, nil, "down", nil)
					end
				elseif button.Name == "New" then	
					tableFunctions("add", nil, "", nil, nil, "total")
				end
			end
		end)
	end
end

selected = false
selected_test, selected_list = "", ""
local count = 0
function newFunction(name, value, list, select)
	if name == nil then name = "" end
	if value == nil then value = true end
	if list == nil then list = "total" end
	if select == nil then select = selected end

	if select == true then selected_test = name selected_list = list end

	local listObj = list == "total" and script.Parent.scrollingFrames.Total or list == "passed" and script.Parent.scrollingFrames.Passed or list == "failed" and script.Parent.scrollingFrames.Failed
	local listFrame = listObj[list.."Frame"]

	local functionBox = Instance.new("Frame")
	functionBox.Name = "functionBox"
	functionBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	functionBox.Size = UDim2.new(0.95, 0, 0.135, 0)
	functionBox.BorderSizePixel = 0
	functionBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	functionBox.Parent = listFrame

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0.2, 0)
	UICorner.Parent = functionBox

	local toggle = Instance.new("TextButton")
	toggle.TextWrapped = true
	toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.Text = value and "✅" or "❌"
	toggle.BorderSizePixel = 0
	toggle.Size = UDim2.new(0.094, 0, 0.683, 0)
	toggle.TextSize = 14
	toggle.Name = "toggle"
	toggle.Position = UDim2.new(0.025, 0, 0.146, 0)
	toggle.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	toggle.TextScaled = true
	toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	toggle.Parent = functionBox

	local UIStroke_2 = Instance.new("UIStroke")
	UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke_2.Color = Color3.fromRGB(33, 33, 33)
	UIStroke_2.Thickness = 3
	UIStroke_2.Parent = toggle

	local TextBox = Instance.new("TextBox")
	TextBox.TextWrapped = true
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.Text = name
	TextBox.TextSize = 14
	TextBox.Size = list ~= "total" and UDim2.new(0.833, 0, 0.708, 0) or list == "total" and UDim2.new(0.737, 0, 0.708, 0) 
	TextBox.Position = UDim2.new(0.144, 0, 0.124, 0)
	TextBox.BorderSizePixel = 0
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	TextBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	TextBox.PlaceholderText = "Function name here!"
	TextBox.TextScaled = true
	TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TextBox.Parent = functionBox


	local UICorner_1 = Instance.new("UICorner")
	UICorner_1.Parent = TextBox

	local checkbox
	if list == "total" then
		checkbox = Instance.new("TextButton")

		local AspectRatio = Instance.new("UIAspectRatioConstraint")
		AspectRatio.Parent = checkbox
		AspectRatio.AspectRatio = 1
		AspectRatio.AspectType = Enum.AspectType.FitWithinMaxSize
		AspectRatio.DominantAxis = Enum.DominantAxis.Width

		checkbox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		checkbox.TextColor3 = Color3.fromRGB(0, 0, 0)
		checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		checkbox.Text = ""
		checkbox.Name = "checkbox"
		checkbox.Position = UDim2.new(0.9, 0, 0.25, 0)
		checkbox.Size = UDim2.new(0.071, 0, 0.506, 0)
		checkbox.BorderSizePixel = 0
		checkbox.TextSize = 14
		checkbox.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
		checkbox.Parent = functionBox

		local UICorner_2 = Instance.new("UICorner")
		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = checkbox

		local UIStroke_3 = Instance.new("UIStroke")
		UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke_3.Color = Color3.fromRGB(76, 76, 76)
		UIStroke_3.Thickness = 4
		UIStroke_3.Parent = checkbox
	end

	toggle.Activated:Connect(function()
		if value == true then value = false elseif value == false then value = true end
		local index = table.find(succeeded_tests, TextBox.Text)
		local index2 = table.find(failed_tests, TextBox.Text)

		if index then table.remove(succeeded_tests, index) else table.insert(succeeded_tests, TextBox.Text) end
		if index2 then table.remove(failed_tests, index2) else table.insert(failed_tests, TextBox.Text) end
		task.wait()
		updateText()
		refreshLists()
	end)
	TextBox.FocusLost:Connect(function()
		local text = TextBox.Text
		if table.find(functionsToTest, TextBox.Text) then 
			if TextBox.Text ~= "" then
				count += 1
				text = text.."_"..count
			end
		end
		local index = table.find(functionsToTest, name)
		if index then tableFunctions("rename", index, text, name) end
		updateText()
		selected_test = ""
		selected_list = ""
		selected = false
		refreshLists()
	end)

	if list == "total" then
		checkbox.Activated:Connect(function()
			if select then 
				if selected_test ~= TextBox.Text then
					return
				end
				if selected_list ~= list then
					return
				end
				select = not select
				selected_test = ""
				selected_list = ""
				checkbox.BackgroundColor3 = select and Color3.fromRGB(255,255,255) or Color3.fromRGB(76,76,76)
			elseif not select then
				if selected_test == "" and selected_list == "" then
					select = not select
					selected_test = TextBox.Text
					selected_list = list
					checkbox.BackgroundColor3 = select and Color3.fromRGB(255,255,255) or Color3.fromRGB(76,76,76)
				end
			end
		end)

		checkbox.BackgroundColor3 = select and Color3.fromRGB(255,255,255) or Color3.fromRGB(76,76,76)
	end
end

function updateText()
	script.Parent.scrollingFrames.Total.total.Text = "Total: "..#functionsToTest
	script.Parent.scrollingFrames.Failed.failed.Text = "Failed: "..#failed_tests
	script.Parent.scrollingFrames.Passed.passed.Text = "Passed: "..#succeeded_tests
end

for i,v in pairs(functionsToTest) do
	table.insert(succeeded_tests, v)
end

script.Parent.ExecuteButton.Activated:Connect(function()
	Execute()
end)

refreshLists()
updateText()

-- Ok wow that is the end of all the ui functionality crap.

function Execute()
	local getgenv = _G
	local debugMode = getgenv.DebugMode
	local configs = script.Parent.configs

	local cool = configs.coolMoji.TextBox.Text
	local x = configs.failMoji.TextBox.Text
	local tick = configs.passMoji.TextBox.Text
	local exmark = configs.exMarkMoji.TextBox.Text
	local smirk = configs.smirkMoji.TextBox.Text

	local discord = configs.DiscText.TextBox.Text -- discord
	local version = configs.Ver.TextBox.Text
	local contributors = configs.Contribs.TextBox.Text

	local good_tests = #succeeded_tests

	local start_time = os.clock() -- start the count

	local max_tests = #functionsToTest

	local successText = configs.SucText.TextBox.Text.." "..tostring(math.round(good_tests / max_tests * 100)) .. "% succеss rate (" .. tostring(good_tests) .. " out of " .. tostring(max_tests) .. ")" -- success text, pretty cool


	-- Don't change beyond this point unless you know how to code.
	local randstring = ""

	for i = 1, math.random(18,30) do -- epic random string generation
		randstring = randstring..string.char(math.random(33, math.random(140,150)))
	end

	-- Let's get this started!

	local function startText()
		if debugMode then
			print("Loading... [Debug mode activated.]") -- for the lies
		else
			print("Loading..")
		end
		task.wait(0.1)
		print("Grabbing executor name...")
		task.wait(0.05)
		print("STARTING sUNC test. Join our Discord server if you want :) [" .. discord .. "]")
		task.wait(math.random(2, 4)) -- random number
	end

	local function endText(a)
		print(cool.." "..successText) -- prints the success rate text
		print(x.." Total tests failed: "..#failed_tests) -- self explanatory
		if debugMode then
			print(smirk.." This test was made by skintalker, i spent an hour or probably longer coding this.")
		else
			print(smirk.." This test was made by senS (fuck all the inco pastes/unc fakers)")
		end
		print("Finished the test in " .. a .. " seconds") -- number with one decimal place
		print("\n")
		if debugMode then
			print("sUNC, Debug Mode: True, VERSION " .. version .. " ".. randstring) -- gamer
		else
			print("sUNC, VERSION " .. version .. " ".. randstring) -- gamer
		end
		print("Contributors: "..contributors) -- contributions :D
	end

	local function loadstringTest() -- You should be able to read this.
		print(exmark .. " Starting basic loadstring testing")
		task.wait(0.03)
		print(tick .. " Passed the basic loadstring test.")
		task.wait(0.03)
		print(exmark .. " Finished basic loadstring testing")
		task.wait(0.03)
		print(exmark .. " Starting simple loadstring URL testing...")
		task.wait(0.03)
		print(tick .. " Passed the simple loadstring URL test. Short obfuscated scripts can be executed.")
		task.wait(0.03)
		print(exmark .. " Finished simple loadstring testing")
		task.wait(0.03)
		print(exmark .. " Starting complicated loadstring URL testing...")
		task.wait(3)
		print(exmark .. " Finished complicated loadstring testing")
		task.wait(0.03)
		print("loadstring[complicated] true")
		task.wait(0.03)
		print("loadstring[simple] true")
		task.wait(0.03)
		print("loadstring[basic] true")
		wait(1)
		print("Interesting")
		print("\n") -- new line
	end

	local count1 = 1
	local count2 = 1

	local function test(a)
		local random = Random.new()
		task.wait(math.round(random:NextNumber(0, 0.1)*100)/100) -- Random wait time.
		if #failed_tests == max_tests then -- If 0% UNC then
			print(x.." "..a)
		else
			if table.find(failed_tests, a) then -- if it finds a failed function then fail it.
				if debugMode then
					print(x.." "..a.." -- "..count1.." Fails")
				else
					print(x.." "..a) -- ❌ functionhere
				end
				count1 += 1
			else
				if debugMode then
					print(tick.." "..a.." -- "..count2.." Passes")
				else
					print(tick.." "..a) -- ✅ functionhere
				end 
				count2 += 1
			end
		end
	end

	local function functions()
		loadstringTest() -- Does loadstring test
		task.wait(0.05)
		for i,v in pairs(functionsToTest) do
			test(v) -- For every function there is, it tests it.
		end
		print("\n") -- new line
	end

	local function Init()
		startText() -- Runs start text
		task.wait(2)
		functions() -- Starts doing the functions
		endText(math.floor((os.clock() - start_time)*10)/10) -- Shows the end text after functions
	end

	Init()
end

openTween:Play()

return Ui["1"], require;
