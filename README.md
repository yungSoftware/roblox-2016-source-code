# Cookbook:

1. First of all, clone the repository with [Git](https://git-scm.com/) to stay up-to-date
2. You need to use [Visual Studio 2012](https://files.dog/MSDN/Visual%20Studio%202012/en_visual_studio_ultimate_2012_x86_dvd_2262106.iso), [Visual Studio 2012 Update 5](https://files.dog/MSDN/Visual%20Studio%202012%20Update%205/mu_visual_studio_2012_update_5_x86_dvd_6967467.iso) and [Visual Studio 2022](https://visualstudio.microsoft.com/tr/vs/) for viewing the solution. pretty self-explanatory right?
   - Uncheck all optional components in the Visual Studio 2012 installer except **"Microsoft Foundation Classes for C++"** to save space due to none of them are needed
3. Extract **roblox-2016-source-code-master.zip** to your C: drive, If you cloned the repo just move the folder to C:\
4. Rename the folder to **Trunk2016**
5. Create an environment variable in system variables named **CONTRIB_PATH** and set the path to: ``C:\Trunk2016\Contribs``
6. Now you need **Libraries aka. Contribs**, You can borrow it from my [Discord Server](discord.gg/rVrYHdrbsp)
   * You should ask to any admin in the server for the access since the file link is private,
   * the **Contribs** should be in a channel named: #roblox-2016-source-code
8. After you get the **Dependencies.7z** file, do these steps:
   1. Create a new folder named **Contribs** inside **Trunk2016**
   2. Extract the **Dependencies.7z** contents to that new folder
9. Enter the **Client_2016.sln** Solution inside Trunk2016 Folder with **Visual Studio 2022**
11. Change the Solution Configurations to **ReleaseStudio**
   * **ReleaseRCC** if you want to build **RCCService**
   * **Release** if you want to build **WindowsClient**
12. Change the Solution Platforms to **Win32**
13. Open the **Build** Tab at the top and Press **Clean the Solution** to create a fresh build
14. Before building anything, you should build **boost.static**, **zlib** and **qtnribbon** first
15. Open **setfolders.bat** and choose which folder you want to get prepared.
16. Right click to project and press **Build**
17. Ignore all the warnings since it doesn't affect the compilation
18. Thats it, you have been builded from the source!

## Common Error(s):
 - Error: warning treated as error - no 'object' file generated
    - Fix: Enter the Properties of Project that gives error and head over to **C/C++ > General > Treat Warnings As Errors** and set it to **No (/WX-)**
 - Error: 'C:\Trunk2016\a\a.vcxproj.filters' Access Denied in path
    - Fix: Right Click to the project and press **Open the Folder in File Explorer** and go into properties of **a.vcxproj.filters**, untick **Read-only** and Press **OK**.
 - Error: The build tools for v140 (Platform Toolset = 'v140') cannot be found
    - Fix: Enter the Properties of the project and change the **Platform Toolset** to **Visual Studio 2012 - Windows XP (v110_xp)** or **Visual Studio 2012 (v110)** depending on which are needed.

The guide is straight forward so there should be no issues on your side<br>
Since I've already configured everything, you won't have to do much.
