# Qt
### Qt
1. Open **VS2012 x86 Native Tools Command Prompt**
2. Change Directory to: `C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012`
3. Run the following command:
```sh
$ ./configure -make nmake -platform win32-msvc2012 -prefix C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
4. When the configuration complete, type **nmake** and take a long breath.

# Boost
1. Run `bootstrap.bat` in `Contribs/boost_1_56_0/`.
2. After the command done, Run `build_boost.bat`.

# Curl
1. Open the solution: `"C:\Trunk2016\Contribs\curl-7.50.2\projects\Windows\VC11\curl-all.sln"`
2. And just build.

# OpenSSL
1. Install [Strawberry Perl](https://strawberryperl.com/)
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: `C:\Trunk2016\Contribs\openssl`
4. Type this to the command prompt: `ms\32all.bat`.

# SDL2
1. Enter to this project: `"C:\Trunk2016\Contribs\SDL2\VisualC\SDL.sln"`
2. And just build.

**That's it, you've compiled all the libraries yourself!**
