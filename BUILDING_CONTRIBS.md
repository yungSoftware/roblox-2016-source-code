# Qt
1. Install **[Qt.7z](https://drive.google.com/file/d/10zhRv421d2DUdF7eV-dqR4cIDTZAhiDL/view?usp=sharing)** and Extract it into **Contribs** folder
- I needed to exclude the Qt because github freaks out the whole library.
2. Open **VS2012 x86 Native Tools Command Prompt**
3. Change Directory to: `C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012`
4. Type `nmake confclean` and wait
5. Run the following command:
```sh
configure -make nmake -platform win32-msvc2012 -prefix C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
6. When the configuration complete, type **nmake** and take a long breath.
 
# Boost
1. Run `C:\Trunk2016\Contribs\boost_1_56_0\bootstrap.bat`
2. After the command done, Run `C:\Trunk2016\Contribs\boost_1_56_0\build_boost.bat`.
- If you get any errors about Python do not worry, this will not affect the compilation.
You should greeted with these:
```
...failed updating 56 targets...
...skipped 8 targets...
...updated 1095 targets...
```

# OpenSSL
1. Install [Strawberry Perl](https://strawberryperl.com/)
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: `C:\Trunk2016\Contribs\openssl`
4. Type `perl Configure VC-WIN32`
5. And then type this to the command prompt: `ms\32all.bat`
6. Create a new folder named **openssl** inside **Trunk2016**
7. When the build process done, go inside this folder: `Contribs\openssl\out32dll` and copy these 2 files to **C:\Trunk2016\openssl**: `ssleay32.dll, libeay32.dll`.

# SDL2
- You can just go straight up and build it
To build SDL2 as a .DLL file, Just change the **Target Extention** to **.dll** and **Configuration Type** to **Dynamic Library (.dll)** and Build it!

# libcurl
- You can also build that its straight forward.
If you wanna build libcurl.dll, Just change the **Target Name** to **$(ProjectName)** and Build it!<br>
If you also need to build libcurl as a .LIB file, Just change the **Target Extention** to **.lib** and **Configuration Type** to **Static Library (.lib)** and Build it!

**That's it, you've compiled the libraries!**
**Also You may want to change or add the library files in the source with yours.**

# Errors you may get

- cannot open input file 'C:\Trunk2016\Contribs\SDL2\VisualC\Win32\Release\SDL2.lib'
  - Copy the SDL2.lib from 'C:\Trunk2016\SDL2\Win\2.0.4' to 'C:\Trunk2016\Contribs\SDL2\VisualC\SDL\Win32\Release'
  - Also create the Win32 & Release folders if you dont have them.