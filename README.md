![My *handmade* Roblox Logo](https://github.com/user-attachments/assets/ced623cd-6692-4759-8e46-e9453f5454fc)

<p align="center">
<img alt="GitHub Repo Size" src="https://img.shields.io/github/repo-size/P0L3NARUBA/roblox-2016-source-code">
<img alt="GitHub Release" src="https://img.shields.io/github/v/release/P0L3NARUBA/roblox-2016-source-code?color=violet">
<img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/P0L3NARUBA/roblox-2016-source-code/master">
</p>

# Roblox 2016 Source Code

This source originates from **[robloxsrc.zip](https://mega.nz/file/mrxkSRRK#n5YmV1iPUPZCfiI6IDWkT3eDq9k3-yA7rl_hURked8Y)**, which was circulating some time ago but has become hard to find.<br>
After a long effort, this repository has been brought to GitHub with many improvements!<br>

**To build from the source, refer to [BUILDING.md](/BUILDING.md)**<br>
- Make sure to read it thoroughly to avoid any issues.

**Experiencing problems? You can get help via [our Discord server](https://www.discord.gg/rVrYHdrbsp) or the [Issues](https://github.com/P0L3NARUBA/roblox-2016-source-code/issues) section.**<br>

**Want to play the game immediately? Check out the [Releases](https://github.com/P0L3NARUBA/roblox-2016-source-code/releases)**<br>
**NOTE:** You may need **[Rocknet](https://github.com/P0L3NARUBA/Rocknet/tree/main)** to launch the game.

The **[pixel-lighting](https://github.com/P0L3NARUBA/roblox-2016-source-code/tree/pixel-lighting)** branch is not maintained by me and may be outdated compared to the current branch.

# Table of Contents
1. [🪨 Features / Additions](#-features--additions)
2. [📚 Libraries Used](#-libraries-used)
3. [🔨 Tools Used](#-tools-used)
4. [❤️ Contributors / Credits](#%EF%B8%8F-contributors--credits)
5. [🎯 Current Goals](#-current-goals)
6. [⚠️ Current Issues](#%EF%B8%8F-current-issues)

---

## 🪨 Features / Additions
- Numerous new features have been added and we're still improving!
- Compilation-breaking issues have been fixed to ensure all projects work as intended.
- The entire source has been cleaned up for clarity and ease of use.
- Splash Screen and Copyright Dates updated.
- Reverse-engineered several C# libraries and executables using **[ILSpy](https://github.com/icsharpcode/ILSpy/releases)** to make the source accessible.
- Introducing **[Rocknet](https://github.com/P0L3NARUBA/Rocknet/tree/main)** — a server built specifically for this source.

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
- [RakNet](/Network/raknet) = 5 
- [Mesa](/RCCService/Mesa-7.8.1) = 7.8.1
- [TBB](/TBB_4_1) = 4.1

## 🔨 Tools Used
- [HxD](https://mh-nexus.de/en/downloads.php?product=HxD20)
- [ILSpy](https://github.com/icsharpcode/ILSpy/releases)
- [rbxsigner](/Tools/rbxsigner) = *unknown*

## ❤️ Contributors / Credits
See **[CONTRIBUTORS.md](/CONTRIBUTORS.md)**

**Every contribution moves the project forward — we're always open to new helpers!**

## 🎯 Current Goals
- Backporting/Implementing **[Hitius](https://mega.nz/file/DnxUTAgI#52pYMEJyRFMMXVMAU71GboVWYxaTCv25eWB4QHFma6M)**, **[Graphictoria](https://mega.nz/file/e2RU0YbT#tGVrpYqR4fv6z7a4QQcdqT0nbmgdssGm3wGFd9jCiHA)** and **[Economy Simulator](https://mega.nz/file/76AyxJzC#fuKcKHTK6YI5S8zLyelsB7PIt0fVVTsWu9KTrgvXk2E)** Features
- [x] Color3uint8  
  - [x] Color3.fromRGB()  
  - [ ] R15 character support  
- [x] :Connect() and :Wait()  
- [ ] Fix keyboard shortcuts 
  - [ ] Reset character keybind  
  - [ ] Chat keybind  
  - [ ] Windows key on WindowsClient
- [x] New fonts
- [ ] Add Cyrillic and non-Latin language support  
  - [ ] UTF/Unicode compatibility  
  - [ ] Improve profanity and swear word filter  
- [ ] Add or port new Lua version  
- [ ] Fix Sysstats (needs proper implementation, not insecure patching)  
- [x] Support newer mesh formats  
- [ ] Add dark theme for Studio  
- [ ] Fix in-game recording issues  
- [x] Move unrelated files out of the **content\fonts** folder  
- [ ] Prevent bootstrappers from overwriting original Roblox files and registries  
  - When this is resolved, future versions will only require bootstrappers; updating Rocknet will be enough to upgrade  
- [ ] Compile Android client  
  - Requires correct SDKs and additional setup  
- [ ] Add 64-bit support for all listed projects at the bottom
- Building all the projects within the latest Visual Studio Version **[34/68]** 
  - **FYI:** Most of them are never tried so expect some misinformations. 
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
  #### 3rd Party / Contribs
  - [ ] boost.static
  - [ ] Boost
    - Needs a newer Boost version.
  - [ ] cpp-netlib
  - [x] DSBaseClasses
  - [ ] Curl
     - OpenSSL libraries spits unresolved external symbols so these should get updated too.
  - [ ] Qt
  - [ ] Openssl  
  - [ ] SDL2
    - Windows SDK throws "negative subscript" errors.
  - [x] zlib
  - [ ] w3c-libwww
  - [x] mesa
     - [x] osmesa 
     - [x] gdi
     - [x] glu
     - [x] glut
     - [x] glsl_apps_compile 
     - [x] gears
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
  - [x] PrepAllForUpload
  - [x] BootstrapperClient.PrepForUpload
  - [x] BootstrapperRccService.PrepForUpload
  - [x] BootstrapperQTStudio.PrepForUpload
  - [x] RobloxProxy.PrepForUpload
  #### Other
  - [x] IncludeChecker
  - [x] RbxTestHooks
  - [x] ScriptSigner
  - [x] Emcaster
  - [x] EmcasterTest
  - [x] EmReciever
  - [x] Roblox.Common
  - [x] Roblox.Common.Web
  - [x] Roblox.Configuration
  - [x] Roblox.Diagnostics
  - [x] Roblox.Grid.Arbiter.Common
  - [x] Roblox.Grid.Client
  - [x] Roblox.Grid.Common
  - [x] Roblox.Ssh
  - [x] Roblox.System
  - [x] Roblox.WebsiteSettings
  - [x] Roblox.RccServiceArbiter

## ⚠️ Current Issues
- Undo/Redo does not handle `Color3` properties accurately; they often revert to the nearest `BrickColor` value.
  - This can lead to inconsistencies, especially with `BodyColors`.

---
