![My *handmade* Roblox Logo](https://github.com/user-attachments/assets/ced623cd-6692-4759-8e46-e9453f5454fc)

<p align="center">
<img alt="GitHub Repo Size" src="https://img.shields.io/github/repo-size/P0L3NARUBA/roblox-2016-source-code">
<img alt="GitHub Release" src="https://img.shields.io/github/v/release/P0L3NARUBA/roblox-2016-source-code">
</p>

# Roblox 2016 Source Code
This source originates from **robloxsrc.zip** that was spinning around but its hard to find these days.<br>
After a long effort, this repository has been brought to you on github with lots of changes!<br>

**To build from the source, refer to [BUILDING.md](/BUILDING.md)**<br>
   - Make sure to read them properly so you wont face with any issues.

**Having any problems? you can get help at [our discord server](https://www.discord.gg/rVrYHdrbsp) or at the [Issues](https://github.com/P0L3NARUBA/roblox-2016-source-code/issues)**<br>

**Want to play the game in no time? Check out [Releases](https://github.com/P0L3NARUBA/roblox-2016-source-code/releases/)**<br>
**NOTE:** You may need [Rocknet](https://github.com/P0L3NARUBA/Rocknet/tree/main) to launch the game.

# Table of Contents
1. [🪨 Features / Additions](#-features--additions)
2. [📚 Libraries Used](#-libraries-used)
3. [🔨 Tools Used](#-tools-used)
4. [❤️ Contributors](#%EF%B8%8F-contributors)
5. [🎯 Current Goals](#-current-goals)
6. [⚠️ Current Issues](#%EF%B8%8F-current-issues)

---

## 🪨 Features / Additions
- Added a lot of new features, we're continuing to improve it!
- Fixed issues that breaks the compilation to make every project works like intended.
- Cleaned up the whole source to make things easier and not complicated.
- Changed Splash Screen and Copyright Date(s) just for the sake of it.
- Reverse Engineered some C# libraries and executables using **[ILSpy](/Tools/ILSpy)** to make their source accessible.
- Introducing You [Rocknet](https://github.com/P0L3NARUBA/Rocknet/tree/main)! A server made for this particular source.

## 📚 Libraries Used
- [Boost](/Contribs/boost_1_56_0) = 1.56.0
- [cpp-netlib](/Contribs/cpp-netlib-0.11.0-final) = 0.11.0-final
- [DSBaseClasses](/Contribs/DSBaseClasses) = *unknown*
- [OpenSSL](/Contribs/openssl) = 1.0.0c
- [Qt](/BUILDING_CONTRIBS.md) = 4.8.5
- [Roblox SDK](/Contribs/SDK) = *unknown*
- [SDL2](/Contribs/SDL2) = 2.0.4
- [VMProtectWin](/Contribs/VMProtectWin_2.13) = 2.13
- [w3c-libwww](/Contribs/w3c-libwww-5.4.0) = 5.4.0
- [curl](/Contribs/windows/x86/curl/curl-7.43.0) = 7.43.0
- [zlib](/Contribs/windows/x86/zlib/zlib-1.2.8) = 1.2.8
- [glsl-optimizer](/Rendering/ShaderCompiler/glsl-optimizer) = *unknown*
- [hlsl2glslfork](/Rendering/ShaderCompiler/hlsl2glslfork) = *unknown*
- [mojoshader](/Rendering/ShaderCompiler/mojoshader) = *unknown*
- [gSOAP](/RCCService/gSOAP/gsoap-2.7) = 2.7.10

## 🔨 Tools Used
- [HxD](/Tools/HxD) = 2.5.0.0
- [ILSpy](/Tools/ILSpy) = 9.1

---

## ❤️ Contributors
[@xspyy](https://github.com/xspyy)
* fromHSV and fromHex
* Trustcheck Fixes

[@eprominecraft](https://github.com/eprominecraft)
* AnchorPoint
* Post Effects
* Made Bootstrappers Work

[@watrabi](https://github.com/watrabi)
* Proper Sysstats Patch

[@cetcat](https://github.com/cetcat)
* Helped Compilation of Bootstrappers

**Want to be in the list and help us?**<br>
Be a contributor by doing a helpful of changes/commits to the repository!

---

## 🎯 Current Goals
- Backporting/Implementing **Hitius**, **Graphictoria** and **Economy Simulator** Features
   - [ ] Color3uint8
        - Potential fix to [this issue](https://github.com/P0L3NARUBA/roblox-2016-source-code/blob/db5a53d3a156f30cbde469b801b84b55d65412c6/README.md?plain=1#L156)
     - [ ] Color3.fromRGB()
       - We already added this but it's not working properly for the parts since we don't have the feature at the top.
   - [ ] R15
   - [x] :Connect() and :Wait()
   - [ ] Keyboard Shortcuts
      - [ ] Reset Character Keybind
      - [ ] Chat Keybind
      - [ ] Windows Key on WindowsClient
- [ ] Adding Cyrillic & Non-Latin Languages Support
   - [ ] Improving Profanity/Swear Filter
- [ ] Making Bootstrappers functional as intended
- [ ] [Fixing in-game Recorder behaving goofy](https://github.com/P0L3NARUBA/roblox-2016-source-code/blob/db5a53d3a156f30cbde469b801b84b55d65412c6/README.md?plain=1#L154)
- [ ] 64-bit Support
- Building all the projects with the latest Visual Studio Version **[10/37]** 
  - [ ] App
  - [ ] App.BulletPhysics
  - [ ] Base
  - [ ] CoreScriptConverter2
  - [ ] CSG
  - [ ] Log
  - [ ] Network
  - [ ] qtnribbon
    - It gives "Designtime build failed for project" error, seems like it has an easy fix though.
  - [ ] RCCService
  - [ ] RobloxStudio
  - [ ] sgCore
  - [ ] WindowsClient
  #### 3rd Party
  - [ ] boost.static
    - Needs a newer Boost version.
  - [x] DSBaseClasses
  - [ ] libcurl
    - OpenSSL libraries gives unresolved external symbols so these should get updated too.
  - [ ] SDL2
    - Windows SDK throws "negative subscript" errors.
  - [x] zlib
  #### gSOAP
  - [x] soapcpp2
  - [x] wsdl2h
  #### Rendering
  - [ ] AppDraw
  - [ ] GfxBase
  - [ ] GfxCore
  - [ ] GfxRender
  - [ ] graphics3D
  - [ ] LibOVR
  - [ ] RbxG3D
  #### Shaders
  - [ ] ShaderCompiler
  #### Installer
  - [ ] Bootstrapper
  - [ ] BootstrapperClient
  - [ ] BootstrapperQTStudio
  - [ ] RobloxProxy
  #### Other
  - [x] IncludeChecker
  - [x] RbxTestHooks
  - [x] ScriptSigner
- Be able to build on listed platforms/compilers **[1/7]**
  - [x] Windows
  - [ ] Android
  - [ ] Linux
  - [ ] MacOS / Unix
  - [ ] iOS
  - [ ] Xbox / Durango
  - [ ] CMake

## ⚠️ Current Issues
- The Roblox in-game Video Recorder is being awful, pixelated and no sound (just some cracking noises)
   - The audio can be fixed by Turning on the Compatibility Mode to Windows 8 or 7. <br>(for now. it'll be fixed soon.)
- When importing some models or opening places all parts are colored as gray
   - This is due to the source doesn't have Color3uint8 support for the Parts, doesn't happen frequently but however [we will fix it.](https://github.com/P0L3NARUBA/roblox-2016-source-code/blob/db5a53d3a156f30cbde469b801b84b55d65412c6/README.md?plain=1#L84)

---
