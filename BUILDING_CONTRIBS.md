# Qt 4.8.5
1. Open **VS2012 x86 Native Tools Command Prompt**
2. Change Directory to: `C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012`
3. Run the following command:
```sh
$ ./configure -make nmake -platform win32-msvc2012 -prefix C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
4. When the configuration complete, type **nmake** and take a long breath.

# Boost 1.56.0
1. Run `C:\Trunk2016\Contribs\boost_1_56_0\bootstrap.bat`
2. After the command done, Run `C:\Trunk2016\Contribs\boost_1_56_0\build_boost.bat`
3. When the build done, Run these commands: `b2 --toolset=msvc-11.0 variant=release link=static runtime-link=static threading=multi`

# Curl 7.43.0
1. Compile the **libcurl** Project for **libcurl.dll**
2. Compile the **libcurl_a** Project for **libcurl_a.lib**

# OpenSSL 1.0.0c
1. Install [Strawberry Perl](https://strawberryperl.com/)
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: `C:\Trunk2016\Contribs\openssl`
4. Type `perl Configure VC-WIN32`
5. When the configuration completed, Type this to the command prompt: `ms\32all.bat`.

# SDL 2.0.4
1. Build **SDL2** to get **SDL2.lib**
- To get the Dll file, you must go into properties of **SDL2** and Change **Target Extension** to .dll
- Change the **Platform Toolset** **Visual Studio 2010** to **Visual Studio 2012** if it didn't set that automatically.

**That's it, you've compiled all the libraries yourself!**
