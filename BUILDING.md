# Cookbook for the Source

### Read This Before Reading the Cookbook
``<your path>`` is where your source is, ex. C:\Trunk2016<br>
``<your folder name>`` is your source folder name, ex. Trunk2016<br>
Please remember that you must have technical knowledge, we cannot help you with every problem you have.

---

1. First of all, Open a Command Prompt with Administrator Rights and clone the repository with **[Git](https://git-scm.com/)** like this:
```
git config --system core.longpaths true && cd <your path> && git clone https://github.com/P0L3NARUBA/roblox-2016-source-code
```
  - Do this if you dont want to download the source code over and over again. **(Recommended)**
2. You need to use (download if needed) **[Visual Studio 2012](https://drive.google.com/file/d/1XoA5Av_6OedTwGi_ebTb_XsQ7-RmEKSd/view?usp=sharing)**, **[Visual Studio 2012 Update 5](https://drive.google.com/file/d/1_rrwnITjCl-kcqEKTQWUDJgEegAcKAM6/view?usp=sharing)** for compiling and maybe **[Visual Studio 2022 (OPTIONAL)](https://visualstudio.microsoft.com/tr/vs/)** for viewing the solution (You can also use VS2012 to view the solution it doesn't matter)
    - Uncheck all optional components in the Visual Studio 2012 installer except **"Microsoft Foundation Classes for C++"** to save space due to none of them are needed.
3. Create an environment variable as system variable called **CONTRIB_PATH** and set the path to: **`<your path>\<your folder name>\Contribs`**
4. Now you need to build libraries, to do so head over to: **[BUILDING_CONTRIBS.md](/BUILDING_CONTRIBS.md)**
5. When you all set, Enter the **Client_2016.sln** Solution inside **<your folder name>** Folder with **Visual Studio 2022** or with **Visual Studio 2012**
   - Press **Cancel** if you've prompted with **Review Solution Actions** window.
6. Change the Solution Configuration from the top to **ReleaseStudio**
  - **ReleaseRCC** if you want to build **RCCService** to build **RobloxStudio**
  - **Release** if you want to build **WindowsClient**
  - You can use Other Configurations like: **Debug**, **DebugRCC** or **DebugStudio**
7. Before building the **RCCService**, **RobloxStudio** and **WindowsClient** you should build these projects first:
  - 3rd Party > **boost.static** 
  - 3rd Party > **zlib** 
  - 3rd Party > **libcurl** 
     - Follow the **BUILDING_CONTRIBS.md**, You can skip if you already compiled.
  - 3rd Party > **SDL2**
     - Follow the **BUILDING_CONTRIBS.md**, You can skip if you already compiled.
  - gSOAP > **soapcpp2**
  - gSOAP > **wsdl2h**
  - Shaders > **ShaderCompiler**
  - Rendering > **LibOVR**
  - **qtnribbon** 
  - **sgCore**
  - **CoreScriptConverter2** (Only if you're in Release/Debug Configuration and building WindowsClient)
8. Right click to the project u want to build **(RCCService, RobloxStudio or either WindowsClient)** and press **Build**
 
**Thats it, you successfully built from the source!**
