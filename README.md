# Fake sens UNC Test Documentation

![image](https://github.com/user-attachments/assets/d9d57649-58df-46b5-ba2c-30581e7c80a6)

Thanks for stopping by, this is the documentation for my (@skintalker) fake sUNC test. It has taken me ages to make it so I hope anyone who gets this, enjoys it.

This is still a work in progress, so this readme / documentation will be updated as changes are made. Feel free to read through this.

## What is sUNC Test?

sUNC Test stands for sens Unified Naming Convention Test. If you don't know already, there is something called the Unified Naming Convention, basically a bunch of non luau, custom functions that most executors have because they choose to have it. There is a UNC Test where it tests each UNC function seperately and checks if they pass or fail the test. All of the tests are combined to a percent like 39% UNC or 100% UNC. UNC Test can be easily faked because it is open source and shows what each test needs to have to succeed. The sUNC test however, tests functions more thoroughly and is almost obfuscated so people wouldn't know what to do to make it succeed. I hope this summarizes it for you as I don't know how to explain any further.

## How to run it
You can use this script or you can go into Loader.lua and copy it there.
```luau
--[[
     ________  ___  ___  ________   ________     
    |\   ____\|\  \|\  \|\   ___  \|\   ____\    
    \ \  \___|\ \  \\\  \ \  \\ \  \ \  \___|    
     \ \_____  \ \  \\\  \ \  \\ \  \ \  \       
      \|____|\  \ \  \\\  \ \  \\ \  \ \  \____  
        ____\_\  \ \_______\ \__\\ \__\ \_______\
       |\_________\|_______|\|__| \|__|\|_______|
       \|_________|                                                                                                                                                                                             

	Fake sUNC test made by @skintalker on Discord!
	UI converted to Lua using @uniquadev gui2lua plugin.
	If you skid, I will know.
]]
-- Config
getgenv().DebugMode = false -- Set this to true to see how many passes and fails at the end of each function and maybe more features in the future.

loadstring(game:HttpGet("https://github.com/skintalker/Fake-sUNC/raw/refs/heads/main/Source/Fake-sUNC-Main.lua"))()
```
I really only used DebugMode when my code sucked.

## How to use it
It is pretty cluttered, sorry about that, as I don't really know how to fix the clutter without having to learn even more coding. Anyway, onto the actual help.

- You can press K to toggle the UI on and off, and pressing the X at the top right permanently closes it (Removes it). To get the UI back after pressing the X, you just have to re-execute the script, but your changes won't be saved.

- To execute, press the "Execute" button in the bottom right, or you can press K if you hid your UI.

- Near the bottom is all the configurable text things like the success text, emojis, the discord text, contributors, and so on. By default the text in the boxes are the original sUNC test texts, however you can change it to whatever you want.

- In the list boxes / scrolling frames saying "Total", "Passed", and "Failed", you can see all the functions. Click on the function name textbox and change it to edit the function's name, and press the ✅ or ❌ emoji on the left of it to toggle between passing and failing. 

- To select functions and use the functions on the bottom bar of the total frame, you can press the grey circle on the right of a function and it should turn white, meaning 'Selected'. You can only select one function at a time, but with that one function you can either delete it or move it. The add button works without needing to have one selected.

**Once you are finished, you can execute and press F9 or type in /console to view the roblox console, where the fake test will be of course.**

## To-do

- Add a non-manual mode (Randomly choose bad tests / good tests instead of manually.)
- Make less cluttered somehow, pls give ideas.

## Help
I hope you learnt how to use it from reading this, but if you don't find the information or help you are looking for, message me on Discord, my username is @skintalker and I will try my best to respond quickly and help, if you do reach out.

## Credits
I would like to thank @uniquadev for their Gui2Lua converter, and a few other people who have helped with a line or two of code which I couldn't figure out because my brain was half awake or I was too dumb.
