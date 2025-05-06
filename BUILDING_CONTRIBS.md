# Qt (Optional to build)
1. Install **[Qt.7z](https://drive.google.com/file/d/10zhRv421d2DUdF7eV-dqR4cIDTZAhiDL/view?usp=sharing)** and extract it into **C:\Trunk2016\Contribs**
   - I needed to exclude Qt because GitHub freaks out the whole library
2. Open **VS2012 x86 Native Tools Command Prompt**
3. Change Directory (cd) to: `C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012`
4. Type `nmake confclean` and wait
5. Run the following command:
```sh
configure -make nmake -platform win32-msvc2012 -prefix C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
6. When the configuration completes, type **nmake** and take a long breath.
 
# Boost
1. Run `C:\Trunk2016\Contribs\boost_1_56_0\bootstrap.bat`
   - Small note: _If it just returns errors and stop: Try double-clicking the .bat file._
2. After the command is done, run `C:\Trunk2016\Contribs\boost_1_56_0\build_boost.bat`.
- If you get any errors about Python, do not worry, this will not affect the compilation.

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
7. When the build process completes, go inside `Contribs\openssl\out32dll`, and copy these 2 files to **C:\Trunk2016\openssl**: `ssleay32.dll, libeay32.dll`.

# SDL2
- You can just build it.

To build SDL2 as a .DLL file, just change the **Target Extension** to **.dll** and **Configuration Type** to **Dynamic Library (.dll)**, remove the **HAVE_LIBC** preprocessor from the properties and build it!

# libcurl
- You can also build that its straight forward.

If you also need to build libcurl as a .LIB file, Just change the **Target Extention** to **.lib** and **Configuration Type** to **Static Library (.lib)** and Build it!

# Mesa (Optional to build)
- Open this solution: "C:\Trunk2016\RCCService\Mesa-7.8.1\lib\windows\VC8\mesa\mesa.sln"
- Build it
- And when its done, open this solution: "C:\Trunk2016\RCCService\Mesa-7.8.1\lib\windows\VC8\progs\progs.sln"
- And build this too.
- Copy everything from RCCService\Mesa-7.8.1\lib\windows\VC8\mesa\Release folder to RCCService\Mesa-7.8.1\lib\release

**That's it, you've compiled the libraries!**

**Also, you may want to change or add the library files in the source with yours.**
