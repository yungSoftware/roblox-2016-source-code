# Read This Before You Start

- `"<your path>"` is where your source is located (e.g., `C:\`)  
- `"<your folder name>"` is the name of your source folder (e.g., `Trunk2016`)  

⚠️ *Please note:* Technical knowledge is required. We cannot assist with every individual problem you encounter.

---

## Qt

1. Download [Qt.7z](https://drive.google.com/file/d/10zhRv421d2DUdF7eV-dqR4cIDTZAhiDL/view?usp=drive_link), Extract it into **Contribs** Folder
   * You can skip the other steps if you dont want to build it, its already prebuilt.
2. Open **2012 x86 Native Tools Command Prompt**
3. Navigate (`cd`) to:  
   `<your path>\<your folder name>\Contribs\Qt\4.8.5\win_VS2012`
4. Run the following command:
   ```sh
   configure -make nmake -platform win32-msvc2012 -prefix <your path>\<your folder name>\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
   ```
5. Type `nmake confclean` to make sure we're starting clean.
6. When everything completes, run `nmake` and take a deep breath — this step takes **a lot** of time.

---

## Boost

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

## OpenSSL

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

## SDL2

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

## libcurl

1. Locate the libcurl project under:  
   `3rd Party > libcurl`
2. Right-click the project and select **Build**

To build libcurl as a `.LIB`:
- Go to **Properties**
- Change:
  - **Target Extension** → `.lib`
  - **Configuration Type** → `Static Library (.lib)`
- Build the project.

To build as a `.DLL`, no changes are needed — just build it as is.
