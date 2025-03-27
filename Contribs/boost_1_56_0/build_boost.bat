@echo off

b2 stage ^
-a ^
--reconfigure ^
--toolset=msvc-11.0 ^
--variant=release ^
-s ZLIB_SOURCE=C:\Trunk2012\Contribs\windows\x86\zlib\zlib-1.2.8 ^
-s ZLIB_BINARY=C:\Trunk2012\Contribs\windows\x86\zlib\zlib-1.2.8\lib\release ^
--prefix=C:\Trunk2012\Contribs\boost_1_56_0 ^
--libdir=C:\Trunk2012\Contribs\boost_1_56_0\lib ^
--includedir=C:\Trunk2012\Contribs\boost_1_56_0\include

PAUSE