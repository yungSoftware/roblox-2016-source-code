# Cookbook:
 
 1. First of all, Open a Command Prompt and clone the repository with [Git](https://git-scm.com/) like this:
 ```
 cd C:\ && git clone https://github.com/P0L3NARUBA/roblox-2016-source-code
 ```
 2. You need to use [Visual Studio 2012](https://files.dog/MSDN/Visual%20Studio%202012/en_visual_studio_ultimate_2012_x86_dvd_2262106.iso), [Visual Studio 2012 Update 5](https://files.dog/MSDN/Visual%20Studio%202012%20Update%205/mu_visual_studio_2012_update_5_x86_dvd_6967467.iso) and [Visual Studio 2022](https://visualstudio.microsoft.com/tr/vs/) for viewing the solution, pretty self-explanatory right?
    - Uncheck all optional components in the Visual Studio 2012 installer except **"Microsoft Foundation Classes for C++"** to save space due to none of them are needed
 3. Rename the folder to **Trunk2016**
 4. Create an environment variable in system variables named **CONTRIB_PATH** and set the path to: ``C:\Trunk2016\Contribs``
 5. Now you need to build libraries, to do so head over to : [BUILDING_CONTRIBS.md](/BUILDING_CONTRIBS.md)
 6. Enter the **Client_2016.sln** Solution inside Trunk2016 Folder with **Visual Studio 2022**
 7. Change the Solution Configurations to **ReleaseStudio**
     - **ReleaseRCC** if you want to build **RCCService**
     - **Release** if you want to build **WindowsClient**
     - Did'nt tested out the Debug, DebugRCC and DebugStudio yet since i dont interested in them.
 8. Change the **Solution Platform** to **Win32**
 9. Open the **Build** Tab at the top and Press **Clean the Solution** to create a fresh build
 10. Before building anything, you should build **boost.static**, **zlib**, **curl**, **SDL2**, **qtnribbon** and **ShaderCompiler** first
 11. Right click to project and press **Build**
 12. Thats it, you successfully builded from the source!
 
 ## Common Error(s):
  - Error: warning treated as error - no 'object' file generated
     - Fix: Enter the Properties of Project that gives error and head over to **C/C++ > General > Treat Warnings As Errors** and set it to **No (/WX-)**
  - Error: 'C:\Trunk2016\a\a.vcxproj.filters' Access Denied in path
     - Fix: Right Click to the project and press **Open the Folder in File Explorer** and go into properties of **a.vcxproj.filters**, untick **Read-only** and Press **OK**.
 
  - Error: cannot open LUAGENCSNEW.INL - No such file or folder
     - Fix: Go to: `C:\Trunk2016\App\script` and rename the `LuaGenCSNEW - Copy.inl` to `LuaGenCSNEW.inl`

 The guide is straight forward so there should be no issues on your side<br>
 Since I've already configured everything, you won't have to do much.
