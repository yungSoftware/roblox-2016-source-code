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
10. Change the solution configuration to **ReleaseStudio**
   * **ReleaseRCC** if you want to build **RCCService**
   * **Release** if you want to build **WindowsClient**
11. Open the **Build** Tab at the top and Press **Clean the Solution** to create a fresh build
12. Before building anything, you should build **boost.static**, **zlib** and **qtnribbon** first
13. Open **setfolders.bat** and choose which folder you want to get prepared.
14. Right click to project and press **Build**
15. Thats it, you have been builded from the source!

The guide is straight forward so there should be no issues on your side<br>
Since I've already configured everything, you won't have to do much.
