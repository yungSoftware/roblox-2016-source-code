# Cookbook for the Contribs

## Read This Before Reading the Cookbook
``<your path>`` is where your source is, ex. C:\Trunk2016<br>
``<your folder name>`` is your source folder name, ex. Trunk2016<br>

## Qt

**TIP:** You can install [Qt.7z](https://drive.google.com/file/d/10zhRv421d2DUdF7eV-dqR4cIDTZAhiDL/view?usp=drive_link) and extract it into your `<your path>\<your folder name>\Contribs` folder if you dont want to compile it.

1.2012 x86 Native Tools Command Prompt**
2. Change Directory (cd) to: `<your path>\<your folder name>\Contribs\Qt\4.8.5\win_VS2012` 
3. Run the following command:
```sh
configure -make nmake -platform win32-msvc2012 -prefix <your path>\<your folder name>\Contribs\Qt\4.8.5\win_VS2012 -opensource -confirm-license -opengl desktop -nomake examples -nomake tests -webkit -xmlpatterns
```
4. Type **nmake confclean** to make sure we're on the right track!
5. When everything completes, type **nmake** and take a long breath since it will take **a lot** of time.
 
## Boost
1. Go into **`<your path>\<your folder name>\Contribs\boost_1_56_0\`**
2. Run the **bootstrap.bat**
3. After the command is done, run **build_boost.bat** and it will start compiling.

**IMPORTANT:** You may have to change the paths inside **build_boost.bat**.

- If you get any errors about Python, **do not worry** because its normal and they will not affect the compilation.

You should greeted with these lines after compilation finishes:

```
...failed updating 56 targets...
...skipped 8 targets...
...updated 1095 targets...
```

## OpenSSL
1. Install [Strawberry Perl](https://strawberryperl.com/) to continue for the process
2. Open **Developer Command Prompt for VS2012**
3. Change Directory to: **`<your path>\<your folder name>\Contribs\openssl`**
4. Type **`perl Configure VC-WIN32`**
5. And then type this to the command prompt: **`ms\32all.bat`**
6. Create a new folder named **openssl** inside **<your folder name>**
7. When the build process completes, go inside **`<your path>\<your folder name>\Contribs\openssl\out32dll`**, and copy these 2 files to **`<your path>\<your folder name>\openssl`**: **`ssleay32.dll, libeay32.dll`**.

**IMPORTANT:** Now you have to be in **Client_2016.sln** for these 2 dependencies at the bottom.

## SDL2
Locate the SDL2 Project at **3rd Party > SDL2**<br>
To build SDL2 as a .DLL file, Go into **Properties** and just change the **Target Extension** to **.dll** and **Configuration Type** to **Dynamic Library (.dll)**, remove the **HAVE_LIBC** preprocessor from the properties and build it!<br>
However if you want to build as .LIB, then you dont have to change anything just build it.

## libcurl
Locate the SDL2 Project at **3rd Party > libcurl**<br>
If you also need to build libcurl as a .LIB file, Go into **Properties** and Just change the **Target Extention** to **.lib** and **Configuration Type** to **Static Library (.lib)** and Build it!
However if you want to build as .DLL, then also you dont have to change anything just build it.

**That's it, you've compiled the libraries!**<br>
**Also, you may want to change the library files in the source with yours.**