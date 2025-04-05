# Qt
1. Open **VS2012 x86 Native Tools Command Prompt**
2. Change Directory to: `C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012`
3. Run the following command:
```sh
configure -make nmake -platform win32-msvc2012 -prefix C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
4. When the configuration complete, type **nmake** and take a long breath.
 
# Boost
1. Run `C:\Trunk2016\Contribs\boost_1_56_0\bootstrap.bat`
2. After the command done, Run `C:\Trunk2016\Contribs\boost_1_56_0\build_boost.bat`.

# OpenSSL
1. Install [Strawberry Perl](https://strawberryperl.com/)
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: `C:\Trunk2016\Contribs\openssl`
4. Type `perl Configure VC-WIN32`
5. And then type this to the command prompt: `ms\32all.bat`.
6. When the build process done, go inside this folder: `out32dll` and copy these 2 files to **C:\Trunk2016\openssl**: `ssleay32.dll, libeay32.dll`

# libcurl and SDL2
- You can just go straight up and build it
- Project Properties may needed to change depending which output file you want.

**That's it, you've compiled the libraries!**
**Also You may want to change the library files in the source with yours.**
