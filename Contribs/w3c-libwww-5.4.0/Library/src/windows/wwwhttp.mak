# Microsoft Developer Studio Generated NMAKE File, Based on wwwhttp.dsp
!IF "$(CFG)" == ""
CFG=wwwhttp - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwhttp - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwhttp - Win32 Release" && "$(CFG)" != "wwwhttp - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwhttp.mak" CFG="wwwhttp - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwhttp - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwhttp - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "wwwhttp - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwhttp\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwhttp.dll"

!ELSE 

ALL : "wwwstream - Win32 Release" "wwwutils - Win32 Release" "wwwmime - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwhttp.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwmime - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwstream - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTAABrow.obj"
	-@erase "$(INTDIR)\HTAAUtil.obj"
	-@erase "$(INTDIR)\HTCookie.obj"
	-@erase "$(INTDIR)\HTDigest.obj"
	-@erase "$(INTDIR)\HTPEP.obj"
	-@erase "$(INTDIR)\HTTChunk.obj"
	-@erase "$(INTDIR)\HTTP.obj"
	-@erase "$(INTDIR)\HTTPGen.obj"
	-@erase "$(INTDIR)\HTTPReq.obj"
	-@erase "$(INTDIR)\HTTPRes.obj"
	-@erase "$(INTDIR)\HTTPServ.obj"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwhttp.dll"
	-@erase "$(OUTDIR)\wwwhttp.exp"
	-@erase "$(OUTDIR)\wwwhttp.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /I "..\..\..\modules\md5" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwhttp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwhttp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwhttp.pdb" /machine:I386 /def:".\wwwhttp.def" /out:"$(OUTDIR)\Release\wwwhttp.dll" /implib:"$(OUTDIR)\wwwhttp.lib" 
DEF_FILE= \
	".\wwwhttp.def"
LINK32_OBJS= \
	"$(INTDIR)\HTAABrow.obj" \
	"$(INTDIR)\HTAAUtil.obj" \
	"$(INTDIR)\HTCookie.obj" \
	"$(INTDIR)\HTDigest.obj" \
	"$(INTDIR)\HTPEP.obj" \
	"$(INTDIR)\HTTChunk.obj" \
	"$(INTDIR)\HTTP.obj" \
	"$(INTDIR)\HTTPGen.obj" \
	"$(INTDIR)\HTTPReq.obj" \
	"$(INTDIR)\HTTPRes.obj" \
	"$(INTDIR)\HTTPServ.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwmime.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwstream.lib"

"$(OUTDIR)\Release\wwwhttp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwhttp - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwhttp\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwhttp.dll"

!ELSE 

ALL : "wwwstream - Win32 Debug" "wwwutils - Win32 Debug" "wwwmime - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwhttp.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwmime - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwstream - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTAABrow.obj"
	-@erase "$(INTDIR)\HTAAUtil.obj"
	-@erase "$(INTDIR)\HTCookie.obj"
	-@erase "$(INTDIR)\HTDigest.obj"
	-@erase "$(INTDIR)\HTPEP.obj"
	-@erase "$(INTDIR)\HTTChunk.obj"
	-@erase "$(INTDIR)\HTTP.obj"
	-@erase "$(INTDIR)\HTTPGen.obj"
	-@erase "$(INTDIR)\HTTPReq.obj"
	-@erase "$(INTDIR)\HTTPRes.obj"
	-@erase "$(INTDIR)\HTTPServ.obj"
	-@erase "$(INTDIR)\md5.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwhttp.dll"
	-@erase "$(OUTDIR)\Debug\wwwhttp.ilk"
	-@erase "$(OUTDIR)\wwwhttp.exp"
	-@erase "$(OUTDIR)\wwwhttp.lib"
	-@erase "$(OUTDIR)\wwwhttp.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /I "..\..\..\modules\md5" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwhttp.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwhttp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwhttp.pdb" /debug /machine:I386 /def:".\wwwhttp.def" /out:"$(OUTDIR)\Debug\wwwhttp.dll" /implib:"$(OUTDIR)\wwwhttp.lib" 
DEF_FILE= \
	".\wwwhttp.def"
LINK32_OBJS= \
	"$(INTDIR)\HTAABrow.obj" \
	"$(INTDIR)\HTAAUtil.obj" \
	"$(INTDIR)\HTCookie.obj" \
	"$(INTDIR)\HTDigest.obj" \
	"$(INTDIR)\HTPEP.obj" \
	"$(INTDIR)\HTTChunk.obj" \
	"$(INTDIR)\HTTP.obj" \
	"$(INTDIR)\HTTPGen.obj" \
	"$(INTDIR)\HTTPReq.obj" \
	"$(INTDIR)\HTTPRes.obj" \
	"$(INTDIR)\HTTPServ.obj" \
	"$(INTDIR)\md5.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwmime.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwstream.lib"

"$(OUTDIR)\Debug\wwwhttp.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("wwwhttp.dep")
!INCLUDE "wwwhttp.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwhttp.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwhttp - Win32 Release" || "$(CFG)" == "wwwhttp - Win32 Debug"
SOURCE=..\HTAABrow.c

"$(INTDIR)\HTAABrow.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTAAUtil.c

"$(INTDIR)\HTAAUtil.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTCookie.c

"$(INTDIR)\HTCookie.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTDigest.c

"$(INTDIR)\HTDigest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTPEP.c

"$(INTDIR)\HTPEP.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTChunk.c

"$(INTDIR)\HTTChunk.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTP.c

"$(INTDIR)\HTTP.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTPGen.c

"$(INTDIR)\HTTPGen.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTPReq.c

"$(INTDIR)\HTTPReq.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTPRes.c

"$(INTDIR)\HTTPRes.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTPServ.c

"$(INTDIR)\HTTPServ.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\..\modules\md5\md5.c

"$(INTDIR)\md5.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwhttp - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhttp - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwhttp - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhttp - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwhttp - Win32 Release"

"wwwmime - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Release" 
   cd "."

"wwwmime - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhttp - Win32 Debug"

"wwwmime - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Debug" 
   cd "."

"wwwmime - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwhttp - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhttp - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwhttp - Win32 Release"

"wwwstream - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" 
   cd "."

"wwwstream - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhttp - Win32 Debug"

"wwwstream - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" 
   cd "."

"wwwstream - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

