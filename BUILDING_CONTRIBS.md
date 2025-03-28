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
2. After the command done, Run `C:\Trunk2016\Contribs\boost_1_56_0\build_boost.bat`.
 
# Curl 7.43.0
1. Its already included in **Client_2016** Solution, so build it.
- For **libcurl.dll** file change the **Target Name** from **libcurl_a** to **libcurl**
- And change the **Target Extension** from **.lib** to **.dll**

# OpenSSL 1.0.0c
1. Install [Strawberry Perl](https://strawberryperl.com/)
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: `C:\Trunk2016\Contribs\openssl`
4. Type `perl Configure VC-WIN32`
5. And then type this to the command prompt: `ms\32all.bat`.
6. When the build process done, go inside this folder: `out32dll` and copy these 2 files to **C:\Trunk2016\openssl**: `ssleay32.dll, libeay32.dll`
 
# SDL 2.0.4
1. Its already included in **Client_2016** Solution, so build it.
- For **.lib** file change the **Target Extension** from **.dll** to **.lib**

# DSBaseClasses
1. Its already included in **Client_2016** Solution, so build it.

**That's it, you've compiled all the libraries yourself!**