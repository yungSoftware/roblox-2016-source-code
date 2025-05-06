# Cookbook:
 
1. First of all, Open a Command Prompt and clone the repository with [Git](https://git-scm.com/) like this:
```
cd C:\ && git clone https://github.com/P0L3NARUBA/roblox-2016-source-code
```
  - Do this if you dont want to download the source code over and over again. **(Recommended)**
2. You need to use [Visual Studio 2012](https://drive.google.com/file/d/1XoA5Av_6OedTwGi_ebTb_XsQ7-RmEKSd/view?usp=sharing), [Visual Studio 2012 Update 5](https://drive.google.com/file/d/1_rrwnITjCl-kcqEKTQWUDJgEegAcKAM6/view?usp=sharing) and [Visual Studio 2022](https://visualstudio.microsoft.com/tr/vs/) for viewing the solution, pretty self-explanatory right?
    - Uncheck all optional components in the Visual Studio 2012 installer except **"Microsoft Foundation Classes for C++"** to save space due to none of them are needed
3. Rename the folder to **Trunk2016**
4. Create an environment variable in system variables named **CONTRIB_PATH** and set the path to: ``C:\Trunk2016\Contribs``
5. Now you need to build libraries, to do so head over to : [BUILDING_CONTRIBS.md](/BUILDING_CONTRIBS.md)
6. Enter the **Client_2016.sln** Solution inside Trunk2016 Folder with **Visual Studio 2022**
7. Change the Solution Configurations to **ReleaseStudio**
  - **ReleaseRCC** if you want to build **RCCService**
  - **Release** if you want to build **WindowsClient**
8. Open the **Build** Tab at the top and Press **Clean the Solution** to create a fresh build
9. Before building anything, you should build these first:
  - 3rd Party > **boost.static** 
  - 3rd Party > **zlib** 
  - 3rd Party > **libcurl** 
  - 3rd Party > **SDL2** 
  - gSOAP > **soapcpp2**
  - gSOAP > **wsdl2h**
  - Shaders > **ShaderCompiler**
  - Rendering > **LibOVR**
  - **qtnribbon** 
  - **sgCore**
  - **CoreScriptConverter2**
10. Right click to project and press **Build**
11. Thats it, you successfully builded from the source!

 The guide is straight forward so there should be no issues on your side<br>
 Most of the errors you may get while launching the game is because you have to copy the required file(s) to the game location.<br>
 Since I've already configured everything, you won't have to do much.
