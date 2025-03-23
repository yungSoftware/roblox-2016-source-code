# Cookbook:
1. First of all, Download this repository as .zip
2. You need to install [Visual Studio 2012](https://files.dog/MSDN/Visual%20Studio%202012/en_visual_studio_ultimate_2012_x86_dvd_2262106.iso), [Visual Studio 2012 Update 5](https://files.dog/MSDN/Visual%20Studio%202012%20Update%205/mu_visual_studio_2012_update_5_x86_dvd_6967467.iso) and [Visual Studio 2022](https://visualstudio.microsoft.com/tr/vs/) for viewing the solution. pretty self-explanatory right?
3. Extract **roblox-2016-source-code-main.zip** to your C: drive
4. Rename the folder to **Truck2016**
5. Create a environment variable in system variables named **CONTRIB_PATH** and set the path to: C:\Trunk2016\Contribs
6. Enter the **Client_2012.sln** Solution inside Trunk2016 Folder
7. Change the solution configuration to **ReleaseStudio**
   * **ReleaseRCC** if you want to build **RCCService**
   * **Release** if you want to build **WindowsClient**
8.  Open the **Build** Tab at the top and Press **Clean the Solution** to create a fresh build
9. Before Building the Studio, RCCService or anything, you should build **boost.static** and **zlib** first
10. Right click to "RobloxStudio" project and press **Build**
11. Hoping that everything is fine, the compilation should complete.

# Common Errors:
- Error: error C2220: warning treated as error - no 'object' file generated
   - Fix: Enter the Properties of Project that gives error and head over to **C/C++ > General > Treat Warnings As Errors** and set it to **No (/WX-)**
- Error: 'C:\Trunk2016\blabla\blabla.vcxproj.filters' Access Denied in path.
   - Fix: Right Click to the project and press **Open the Folder in File Explorer** and go into properties of **blabla.vcxproj.filters**, untick **Read-only** and Press **OK**.
- Error: The build tools for v140 (Platform Toolset = 'v140') cannot be found.
   - Fix: Enter the Properties of the project and change the **Platform Toolset** to **Visual Studio 2012 - Windows XP (v110_xp)** or **Visual Studio 2012 (v110)** depending on which are needed.
- Error: **LNK1136** invalid or corrupt file (thanks to @_rdtsc for reporting the issue)
   - Fix: Its most likely your symlinks are broken, however theres a way fix it:
     1. Copy all the files inside: **C:\Trunk2016\Contribs\boost_1_56_0\stage\lib**
     2. Copy the **zlib.lib** file inside: **C:\Trunk2016\zlib\win\bin\Release**
     3. Copy the **VMProtectSDK32.lib** file inside: **C:\Trunk2016\Contribs\VMProtectWin_2.13\lib**
     4. Copy **libcurl_a** file inside: **C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\build\Win32\VC11\DLL Release - DLL OpenSSL**
     5. Paste all of them to the project folder you having problems with, it can be **RobloxStudio**, **RCCService**, **WindowsClient** or vice versa.

The guide is straight forward so there should be no issues on your side<br>
Since I've already configured everything, you won't have to do much<br>
I'm not covered how to build the libraries manually so figure out yourself.
