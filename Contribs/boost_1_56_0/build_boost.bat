@echo off

b2 stage ^
-a ^
--reconfigure ^
--toolset=msvc-11.0 ^
--variant=release ^
-s ZLIB_SOURCE=%CONTRIB_PATH%\windows\x86\zlib\zlib-1.2.8 ^
-s ZLIB_BINARY=%CONTRIB_PATH%\windows\x86\zlib\zlib-1.2.8\lib\release ^
--prefix=%CONTRIB_PATH%\boost_1_56_0 ^
--libdir=%CONTRIB_PATH%\boost_1_56_0\lib ^
--includedir=%CONTRIB_PATH%\boost_1_56_0\include

PAUSE
