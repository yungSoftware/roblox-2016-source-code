# Cookbook for the Source

1. First of all, Open a Command Prompt with Administrator Rights and clone the repository with **[Git](https://git-scm.com/)** like this:
```
git config --system core.longpaths true && cd <your path> && git clone https://github.com/P0L3NARUBA/roblox-2016-source-code
```
  - Do this if you dont want to download the source code over and over again. **(Recommended)**
2. You need to use **[Visual Studio 2012](https://drive.google.com/file/d/1XoA5Av_6OedTwGi_ebTb_XsQ7-RmEKSd/view?usp=sharing)**, **[Visual Studio 2012 Update 5](https://drive.google.com/file/d/1_rrwnITjCl-kcqEKTQWUDJgEegAcKAM6/view?usp=sharing)** and **[Visual Studio 2022 (OPTIONAL)](https://visualstudio.microsoft.com/tr/vs/)** for viewing the solution, pretty self-explanatory right?
    - Uncheck all optional components in the Visual Studio 2012 installer except **"Microsoft Foundation Classes for C++"** to save space due to none of them are needed.
3. Create an environment variable as system variable called **CONTRIB_PATH** and set the path to: **``<your path>\<your folder name>\Contribs``**
4. Now you need to build libraries, to do so head over to: **[BUILDING_CONTRIBS.md](/BUILDING_CONTRIBS.md)**
5. Enter the **Client_2016.sln** Solution inside Trunk2016 Folder with **Visual Studio 2022**
   - Press **Cancel** if you've prompted with **Review Solution Actions** window.
6. Change the Solution Configuration to **ReleaseStudio**
  - **ReleaseRCC** if you want to build **RCCService**
  - **Release** if you want to build **WindowsClient**
7. Before building the **RCCService**, **RobloxStudio** and **WindowsClient** you should build these projects first:
  - 3rd Party > **boost.static** 
  - 3rd Party > **zlib** 
  - 3rd Party > **libcurl** 
  - 3rd Party > **SDL2** 
  - gSOAP > **soapcpp2**
  - gSOAP > **wsdl2h**
  - Shaders > **ShaderCompiler**
     - You should also build this as x64 too. 
  - Rendering > **LibOVR**
  - **qtnribbon** 
  - **sgCore**
  - **CoreScriptConverter2** (Only if you're in Release/Debug Configuration)
8. Right click to project and press **Build**
 
**Thats it, you successfully built from the source!**
