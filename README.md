![My *handmade* Roblox Logo](https://github.com/user-attachments/assets/b8aaca4b-a412-4ad2-a721-8030ccd0259c)

<p align="center">
<img alt="GitHub Repo Size" src="https://img.shields.io/github/repo-size/P0L3NARUBA/roblox-2016-source-code">
<img alt="GitHub Release" src="https://img.shields.io/github/v/release/P0L3NARUBA/roblox-2016-source-code">
</p>

# Roblox 2016 Source Code
This source originates from robloxsrc.zip that was spinning around but its rare to find these days.<br>
After a long effort, this repository has been brought to you on github with handful of changes!<br>

**To see how you can build from the source, refer to [BUILDING.md](/BUILDING.md)**<br>
**Having any problems? you can get help at [our discord server](https://www.discord.gg/rVrYHdrbsp)**<br>

**Want to play the game in no time? Check out [Releases](https://github.com/P0L3NARUBA/roblox-2016-source-code/releases/)**<br>
**NOTE:** You may need [Rocknet](https://github.com/P0L3NARUBA/Rocknet-rblx/tree/local) to launch the game.

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
- Reverse Engineered some C# libraries and executables using **[ILSpy](/Tools/ILSpy)** to make them open-source.
- Introducing You [Rocknet](https://github.com/P0L3NARUBA/Rocknet-rblx/tree/local)! A backend made for this particular source.

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
- [cecho](/Tools/cecho) = *unknown*
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

[@watrabi](https://github.com/watrabi)
* Sysstats Patch

[@cetcat](https://github.com/cetcat)
* Helped Compilation of Bootstrappers

Be a contributor by doing a helpful of changes to the source code!

---

## 🎯 Current Goals
- Backporting/Implementing **Hitius**, **Graphictoria** and **Economy Simulator** Features
   - [ ] Color3uint8
   - [ ] R15
   - [x] :Connect() and :Wait()
- 64-bit Support
- Making it able to build all the projects with the latest Visual Studio Version **[10/40]** 
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
  - [ ] BootstrapperRCCService
  - [ ] RobloxProxy
  #### Other
  - [x] IncludeChecker
  - [x] RbxTestHooks
  - [x] ScriptSigner
  - [x] RegressionTestSuite
    - [x] RobloxLib
- Make it possible to build on listed platforms **[1/7]**
  - [x] Windows
  - [ ] Android
  - [ ] Linux
  - [ ] MacOS / Unix
  - [ ] iOS
  - [ ] Xbox / Durango
  - [ ] CMake 

## ⚠️ Current Issues
- The Roblox in-game Video Recorder is being awful, pixelated and no sound (just some cracking noises
   - The audio can be fixed by Turning on the Compatibility Mode to Windows 8 or 7.
- When importing some models or opening places all parts are colored as gray
   - This is due to the source doesn't have Color3uint8 support, however we'll add it ASAP.
