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

 1. Open the solution: `C:\Trunk2016\Contribs\windows\x86\curl\curl-7.43.0\projects\Windows\VC11\curl-all.sln`
 2. Change **Solution Configurations** to **LIB Release - LIB OpenSSL**
 3. And just build.
 
 # OpenSSL 1.0.0c
 1. Install [Strawberry Perl](https://strawberryperl.com/)
 2. Open **Developer Command Prompt for VS2012**
 3. Change Directory to: `C:\Trunk2016\Contribs\openssl`
 4. Type `perl Configure VC-WIN32`
 5. And then type this to the command prompt: `ms\32all.bat`.
 
 # SDL 2.0.4
 1. Enter to this project: `"C:\Trunk2016\Contribs\SDL2\VisualC\SDL.sln"`
 2. Change **Solution Configuration** to **Release** and change the **Solution Platform** to **Win32/x86**
 3. And just build.
 - For **.lib** file change the **Target Extension** from **.dll** to **.lib**

 **That's it, you've compiled all the libraries yourself!**
