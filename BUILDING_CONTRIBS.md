# Cookbook for CONTRIBS:

## Qt
1. Open **VS2012 x86 Native Tools Command Prompt**
2. Change Directory (cd) to: `Trunk2016\Contribs\Qt\4.8.5\win_VS2012`
3. Type `nmake confclean` and wait
4. Run the following command:
```sh
configure -make nmake -platform win32-msvc2012 -prefix C:\Trunk2016\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
5. When the configuration completes, type **nmake** and take a long breath since it will take a lot of time.
 
## Boost
1. Run the **bootstrap.bat**
2. After the command is done, run **build_boost.bat** and it will start compiling.

- If you get any errors about Python, do not worry, this will not affect the compilation.

You should greeted with these lines:

```
...failed updating 56 targets...
...skipped 8 targets...
...updated 1095 targets...
```

## OpenSSL
1. Install [Strawberry Perl](https://strawberryperl.com/)
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: **`Trunk2016\Contribs\openssl`**
4. Type **`perl Configure VC-WIN32`**
5. And then type this to the command prompt: **`ms\32all.bat`**
6. Create a new folder named **openssl** inside **Trunk2016**
7. When the build process completes, go inside **`Contribs\openssl\out32dll`**, and copy these 2 files to **Trunk2016\openssl**: **`ssleay32.dll, libeay32.dll`**.

## SDL2
To build SDL2 as a .DLL file, just change the **Target Extension** to **.dll** and **Configuration Type** to **Dynamic Library (.dll)**, remove the **HAVE_LIBC** preprocessor from the properties and build it!<br>
However if you want to build as .LIB, then you dont have to change anything just build it.

## libcurl
If you also need to build libcurl as a .LIB file, Just change the **Target Extention** to **.lib** and **Configuration Type** to **Static Library (.lib)** and Build it!
However if you want to build as .DLL, then also you dont have to change anything just build it.

**That's it, you've compiled the libraries!**<br>
**Also, you may want to change or add the library files in the source with yours.**
