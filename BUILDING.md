# Read This Before You Start

- `"<your path>"` refers to the location where your source code resides (e.g., `C:\`)
- `"<your folder name>"` refers to the name of the folder containing the source code (e.g., `Trunk2016`)

⚠️ *Please note:* Technical knowledge is required. We cannot assist with every individual problem you encounter.

---

## Setup Instructions for Windows

1. **Open a Command Prompt with Administrator privileges** and clone the repository using [Git](https://git-scm.com/) like this:
   ```bash
   git config --system core.longpaths true && cd <your path> && git clone https://github.com/yungSoftware/roblox-2016-source-code
   ```
   - This method ensures you won’t need to redownload the source code repeatedly. **(Recommended)**

2. **Download and install these tools:**
   - [Visual Studio 2012](https://drive.google.com/file/d/1XoA5Av_6OedTwGi_ebTb_XsQ7-RmEKSd/view?usp=sharing)
   - [Visual Studio 2012 Update 5](https://drive.google.com/file/d/1_rrwnITjCl-kcqEKTQWUDJgEegAcKAM6/view?usp=sharing)
   - *(Optional)* [Visual Studio 2022](https://visualstudio.microsoft.com/tr/vs/) for a more modern IDE experience.
     > You can use either VS2012 or VS2022 to view the solution — both work fine.
   - During installation, uncheck all optional components **except** _“Microsoft Foundation Classes for C++”_ to save disk space.

3. **Set up an environment variable:**
   - Name: `CONTRIB_PATH`
   - Value: `<your path>\<your folder name>\Contribs`

4. **Build the required libraries:**
   - Refer to **[BUILDING_CONTRIBS.md](/BUILDING_CONTRIBS.md)** for instructions.

5. **Open the solution file:**
   - Launch **Client_2016.sln** inside your `<your folder name>` directory using Visual Studio 2012 or 2022.
   - If prompted with the “Review Solution Actions” window, press **Cancel**.

6. **Set the Solution Configuration:**
   - Choose **ReleaseStudio** to build **RobloxStudio**
   - Choose **ReleaseRCC** to build **RCCService**
   - Choose **Release** to build **WindowsClient**
   - Other available configurations: **Debug**, **DebugRCC**, **DebugStudio**

7. **Pre-build dependencies (required before building RCCService, RobloxStudio, or WindowsClient):**
   - 3rd Party:
     - `boost.static`
     - `zlib`
     - `libcurl` — follow **BUILDING_CONTRIBS.md** (skip if already compiled)
     - `SDL2` — follow **BUILDING_CONTRIBS.md** (skip if already compiled)
   - gSOAP:
     - `soapcpp2`
     - `wsdl2h`
   - Shaders:
     - `ShaderCompiler`
   - Rendering:
     - `LibOVR`
   - Core Components:
     - `qtnribbon`
     - `sgCore`
     - `CoreScriptConverter2` (only needed for **Release/Debug** when building **WindowsClient**)

8. **Build your desired project:**
   - Right-click on **RCCService**, **RobloxStudio**, or **WindowsClient** in Solution Explorer
   - Select **Build**
