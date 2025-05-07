![My Roblox Logo](https://github.com/user-attachments/assets/dad023be-4fb9-4ad5-b7a3-2c66b7d45d71)

<p align="center">
<img alt="GitHub Repo Size" src="https://img.shields.io/github/repo-size/P0L3NARUBA/roblox-2016-source-code">
<img alt="GitHub Release" src="https://img.shields.io/github/v/release/P0L3NARUBA/roblox-2016-source-code">
</p>

# Roblox 2016 Source Code

This source originates from robloxsrc.zip that was spinning around but its rare to find these days.<br>
After a long effort, this repository has been brought to you on github with handful of changes!<br>

**To see how you can build from the source, refer to [BUILDING.md](/BUILDING.md)**<br>
**Having any problems? you can get help at [our discord server](https://www.discord.gg/rVrYHdrbsp)**<br>

**Want to play the game in no time? Check out [Releases](https://github.com/P0L3NARUBA/roblox-2016-source-code/releases/)**

# Table of Contents
1. [🪨 Features / Additions](#-features--additions)
2. [📚 Libraries Used](#-libraries-used)
3. [🔨 Tools Used](#-tools-used)
4. [❤️ Contributors](#%EF%B8%8F-contributors)
5. [🎯 Current Goals](#-current-goals)
6. [⚠️ Current Issues](#%EF%B8%8F-current-issues)

---

## 🪨 Features / Additions
- Added some new features
- Fixed a lot of issues that breaks the compilation and the codebase
  - I messed with a lot of things to fix all the projects though, i should get props for that.
- Introducing You [Rocknet](https://github.com/P0L3NARUBA/Rocknet-rblx/tree/local)! A backend made for this particular source
  - You need this if you want to make the game work as intended.
- Changed Splash Screen and Copyright Date(s)
- Reverse Engineered some libraries and executables to make them editable
- Cleaned up the whole source to make things easier and not complicated
- All the necessary libraries are included in the repository.
   - Except **Qt**, [see here to download it](/BUILDING_CONTRIBS.md)

## 📚 Libraries Used
- [Boost](/Contribs/boost_1_56_0) = 1.56.0
- [cpp-netlib](/Contribs/cpp-netlib-0.11.0-final) = 0.11.0-final
- [DSBaseClasses](/Contribs/DSBaseClasses) = *unknown*
- [OpenSSL](/Contribs/openssl) = 1.0.0c
- [Qt](/Contribs/Qt/4.8.5/win_VS2012/) = 4.8.5
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
- [Mesa](RCCService/Mesa-7.8.1/lib) = 7.8.1

## 🔨 Tools Used
- [cecho](/Tools/cecho) = *unknown*
- [HxD](/Tools/HxD) = 2.5.0.0
- [ILSpy](/Tools/ILSpy) = 9.1
- [rbxsigner](/Tools/rbxsigner) = *unknown*

---

## ❤️ Contributors
[@xspyy](https://github.com/xspyy)
* fromHSV and fromHex
* Trustcheck Fixes

[@eprominecraft](https://github.com/eprominecraft)
* AnchorPoint
* Post Effects
* :Connect() and :Wait()

[@cetcat](https://github.com/cetcat)
* Helped Compilation of Bootstrappers

Be a contributor by doing a helpful of changes to the source code!

---

## 🎯 Current Goals
- Backport Hitius, Graphictoria and Economy Simulator Features
   - [ ] Color3uint8
   - [ ] R15
- 64-bit Support (💀)
- Make it able to build all the projects with the latest Visual Studio Version **[10/40]** (💀💀) 
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
    - Needs a new Boost version.
  - [x] DSBaseClasses
  - [ ] libcurl
    - OpenSSL libraries gives unresolved external symbols so these should get updated.
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
  #### Libraries
  - [ ] Qt
  - [ ] Boost 
  - [ ] OpenSSL
  - [x] Mesa
- Able to build in these platforms **[1/6]** (💀💀)
  - [x] Windows
  - [ ] Android 
  - [ ] Linux
  - [ ] MacOS
  - [ ] iOS
  - [ ] Xbox

## ⚠️ Current Issues
- The Roblox in-game Video Recorder is being awful
- When importing some models or opening places all parts are colored as gray
   - This is due to the source doesn't have Color3uint8 support
   - Not happens with everything but it happens commonly.
