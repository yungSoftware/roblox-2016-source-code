# 🍳 Cookbook for the Contribs

## 📌 Read This Before You Start

- `"<your path>"` is where your source is located (e.g., `C:\Trunk2016`)  
- `"<your folder name>"` is the name of your source folder (e.g., `Trunk2016`)  
- ⚠️ *Please note:* Technical knowledge is required. We cannot assist with every individual problem you encounter.

---

### 🧱 Qt

**TIP:** You can install the precompiled version [Qt.7z](https://drive.google.com/file/d/10zhRv421d2DUdF7eV-dqR4cIDTZAhiDL/view?usp=drive_link). Simply remove your existing **Qt** folder and extract it into `<your path>\<your folder name>\Contribs` to skip compilation process.

1. Open **2012 x86 Native Tools Command Prompt**
2. Navigate (`cd`) to:  
   `<your path>\<your folder name>\Contribs\Qt\4.8.5\win_VS2012`
3. Run the following command:
   ```sh
   configure -make nmake -platform win32-msvc2012 -prefix <your path>\<your folder name>\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
   ```
4. Type `nmake confclean` to make sure we're starting clean.
5. When everything completes, run `nmake` and take a deep breath — this step takes **a lot** of time.

---

### 🚀 Boost

1. Go to:  
   `<your path>\<your folder name>\Contribs\boost_1_56_0\`
2. Run:  
   `bootstrap.bat`
3. When it's done, run:  
   `build_boost.bat` — this will start compiling the Boost library.

- If you get errors related to Python, **don’t worry** — they’re harmless and won’t affect compilation.

Once it finishes, you should see something like:

```
...failed updating 56 targets...
...skipped 8 targets...
...updated 1095 targets...
```

---

### 🔐 OpenSSL

1. Install [Strawberry Perl](https://strawberryperl.com/) to proceed with the build.
2. Open **Developer Command Prompt for VS2012**
3. Navigate (`cd`) to:  
   `<your path>\<your folder name>\Contribs\openssl`
4. Run:  
   `perl Configure VC-WIN32`
   - If you get an error like `'perl' is not recognized...`, make sure Strawberry Perl was installed correctly.
5. Next, run:
   ```
   ms\32all.bat
   ```
6. Create a folder named `openssl` inside `<your folder name>`
7. When the build completes, go to:  
   `<your path>\<your folder name>\Contribs\openssl\out32dll`  
   and copy these two files(`ssleay32.dll` `libeay32.dll`) to:  
   `<your path>\<your folder name>\openssl`

---

### 🎮 SDL2

1. Locate the SDL2 project under:  
   `3rd Party > SDL2`
2. Right-click the project and select **Build**

To build SDL2 as a `.DLL`:
- Go to **Properties**
- Change:
  - **Target Extension** → `.dll`
  - **Configuration Type** → `Dynamic Library (.dll)`
- Remove `HAVE_LIBC;` from:  
  `C/C++ > Preprocessor > Preprocessor Definitions`
- Build the project.

To build as a `.LIB`, you don’t need to change anything — just build it as is.

---

### 🌐 libcurl

1. Locate the libcurl project under:  
   `3rd Party > libcurl`
2. Right-click the project and select **Build**

To build libcurl as a `.LIB`:
- Go to **Properties**
- Change:
  - **Target Extension** → `.lib`
  - **Configuration Type** → `Static Library (.lib)`
- Build the project.

To build as a `.DLL`, no changes are needed — just build it.

---

### 🌄 Mesa

1. Go into ``<your path>\<your folder name>\RCCService\Mesa-7.8.1\lib\windows\VC\mesa``
3. Open **mesa.sln** and build all the projects.
4. Then go into ``<your path>\<your folder name>\RCCService\Mesa-7.8.1\lib\windows\VC\progs``
5. Open **progs.sln** and build all the projects.
6. Copy all the files from ``<your path>\<your folder name>\RCCService\Mesa-7.8.1\lib\windows\VC\mesa\Release`` to ``<your path>\<your folder name>\RCCService\Mesa-7.8.1\lib\release``
7. Copy everything inside ``<your path>\<your folder name>\RCCService\Mesa-7.8.1\lib\windows\VC\progs\Release`` to ``<your path>\<your folder name>\RCCService\Mesa-7.8.1\lib\release``

---

✅ **That's it — you've compiled the contrib libraries!**  

💡 You might also want to replace the library or DLL files in your source directory with the versions you’ve just built.
