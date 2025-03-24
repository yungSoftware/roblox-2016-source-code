# Cookbook:
1. First of all, Download this repository by pressing **<> Code --> Download ZIP**, Or just clone the repository
2. You need to install [Visual Studio 2012](https://files.dog/MSDN/Visual%20Studio%202012/en_visual_studio_ultimate_2012_x86_dvd_2262106.iso), [Visual Studio 2012 Update 5](https://files.dog/MSDN/Visual%20Studio%202012%20Update%205/mu_visual_studio_2012_update_5_x86_dvd_6967467.iso) and [Visual Studio 2022](https://visualstudio.microsoft.com/tr/vs/) for viewing the solution. pretty self-explanatory right?
   - Uncheck all optional components in the Visual Studio 2012 installer **except "Microsoft Foundation Classes for C++"** to save space due to none of them are needed
3. Extract **roblox-2016-source-code-master.zip** to your C: drive, If you cloned the repo just move the folder to C:\
4. Rename the folder to **Trunk2016**
5. Create a environment variable in system variables named **CONTRIB_PATH** and set the path to: C:\Trunk2016\Contribs
6. Now you need Contribs(Libraries), You can get them from my discord server, just ask about it and we'll give you the access
   * After you get the **Dependencies.7z** file, do these steps:
      1. Create a new folder named **Contribs** inside **Trunk2016**
      2. Extract the **Dependencies.7z** contents to that new folder
      3. Open **setfolders.bat** and choose which project you want to get set the files
7. Enter the **Client_2016.sln** Solution inside Trunk2016 Folder with **Visual Studio 2022**
8. Change the solution configuration to **ReleaseStudio**
   * **ReleaseRCC** if you want to build **RCCService**
   * **Release** if you want to build **WindowsClient**
9. Open the **Build** Tab at the top and Press **Clean the Solution** to create a fresh build
10. Before building anything, you should build **boost.static** and **zlib** first
11. Right click to project and press **Build**
12. Thats it, you have been builded from the source!

## Common Errors:
- Error: error C2220: warning treated as error - no 'object' file generated
   - Fix: Enter the Properties of Project that gives error and head over to **C/C++ > General > Treat Warnings As Errors** and set it to **No (/WX-)**
- Error: 'C:\Trunk2016\blabla\blabla.vcxproj.filters' Access Denied in path.
   - Fix: Right Click to the project and press **Open the Folder in File Explorer** and go into properties of **blabla.vcxproj.filters**, untick **Read-only** and Press **OK**.
- Error: The build tools for v140 (Platform Toolset = 'v140') cannot be found.
   - Fix: Enter the Properties of the project and change the **Platform Toolset** to **Visual Studio 2012 - Windows XP (v110_xp)** or **Visual Studio 2012 (v110)** depending on which are needed.


The guide is straight forward so there should be no issues on your side<br>
Since I've already configured everything, you won't have to do much.
