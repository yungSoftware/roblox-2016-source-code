# Microsoft Developer Studio Generated NMAKE File, Based on wwwinit.dsp
!IF "$(CFG)" == ""
CFG=wwwinit - Win32 Debug
!MESSAGE No configuration specified. Defaulting to wwwinit - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "wwwinit - Win32 Release" && "$(CFG)" != "wwwinit - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwinit.mak" CFG="wwwinit - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwinit - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwinit - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwinit - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwinit\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwinit.dll"

!ELSE 

ALL : "wwwwais - Win32 Release" "wwwzip - Win32 Release" "wwwxml - Win32 Release" "wwwhtml - Win32 Release" "wwwdir - Win32 Release" "wwwtrans - Win32 Release" "wwwtelnt - Win32 Release" "wwwstream - Win32 Release" "wwwnews - Win32 Release" "wwwcache - Win32 Release" "wwwhttp - Win32 Release" "wwwgophe - Win32 Release" "wwwftp - Win32 Release" "wwwfile - Win32 Release" "wwwmime - Win32 Release" "wwwutils - Win32 Release" "wwwapp - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwinit.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwapp - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwmime - Win32 ReleaseCLEAN" "wwwfile - Win32 ReleaseCLEAN" "wwwftp - Win32 ReleaseCLEAN" "wwwgophe - Win32 ReleaseCLEAN" "wwwhttp - Win32 ReleaseCLEAN" "wwwcache - Win32 ReleaseCLEAN" "wwwnews - Win32 ReleaseCLEAN" "wwwstream - Win32 ReleaseCLEAN" "wwwtelnt - Win32 ReleaseCLEAN" "wwwtrans - Win32 ReleaseCLEAN" "wwwdir - Win32 ReleaseCLEAN" "wwwhtml - Win32 ReleaseCLEAN" "wwwxml - Win32 ReleaseCLEAN" "wwwzip - Win32 ReleaseCLEAN" "wwwwais - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTInit.obj"
	-@erase "$(INTDIR)\HTProfil.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwinit.dll"
	-@erase "$(OUTDIR)\wwwinit.exp"
	-@erase "$(OUTDIR)\wwwinit.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\modules\expat\xmlparse" /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwinit.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwinit.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwinit.pdb" /machine:I386 /def:".\wwwinit.def" /out:"$(OUTDIR)\Release\wwwinit.dll" /implib:"$(OUTDIR)\wwwinit.lib" 
DEF_FILE= \
	".\wwwinit.def"
LINK32_OBJS= \
	"$(INTDIR)\HTInit.obj" \
	"$(INTDIR)\HTProfil.obj" \
	"$(INTDIR)\windll.obj" \
	"..\..\External\xmlparse.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwapp.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwmime.lib" \
	"$(OUTDIR)\wwwfile.lib" \
	"$(OUTDIR)\wwwftp.lib" \
	"$(OUTDIR)\wwwgophe.lib" \
	"$(OUTDIR)\wwwhttp.lib" \
	"$(OUTDIR)\wwwcache.lib" \
	"$(OUTDIR)\wwwnews.lib" \
	"$(OUTDIR)\wwwstream.lib" \
	"$(OUTDIR)\wwwtelnt.lib" \
	"$(OUTDIR)\wwwtrans.lib" \
	"$(OUTDIR)\wwwdir.lib" \
	"$(OUTDIR)\wwwhtml.lib" \
	"$(OUTDIR)\wwwxml.lib" \
	"$(OUTDIR)\wwwzip.lib" \
	"$(OUTDIR)\wwwwais.lib"

"$(OUTDIR)\Release\wwwinit.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwinit\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwinit.dll"

!ELSE 

ALL : "wwwwais - Win32 Debug" "wwwzip - Win32 Debug" "wwwxml - Win32 Debug" "wwwhtml - Win32 Debug" "wwwdir - Win32 Debug" "wwwtrans - Win32 Debug" "wwwtelnt - Win32 Debug" "wwwstream - Win32 Debug" "wwwnews - Win32 Debug" "wwwcache - Win32 Debug" "wwwhttp - Win32 Debug" "wwwgophe - Win32 Debug" "wwwftp - Win32 Debug" "wwwfile - Win32 Debug" "wwwmime - Win32 Debug" "wwwutils - Win32 Debug" "wwwapp - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwinit.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwapp - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwmime - Win32 DebugCLEAN" "wwwfile - Win32 DebugCLEAN" "wwwftp - Win32 DebugCLEAN" "wwwgophe - Win32 DebugCLEAN" "wwwhttp - Win32 DebugCLEAN" "wwwcache - Win32 DebugCLEAN" "wwwnews - Win32 DebugCLEAN" "wwwstream - Win32 DebugCLEAN" "wwwtelnt - Win32 DebugCLEAN" "wwwtrans - Win32 DebugCLEAN" "wwwdir - Win32 DebugCLEAN" "wwwhtml - Win32 DebugCLEAN" "wwwxml - Win32 DebugCLEAN" "wwwzip - Win32 DebugCLEAN" "wwwwais - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTInit.obj"
	-@erase "$(INTDIR)\HTProfil.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwinit.dll"
	-@erase "$(OUTDIR)\Debug\wwwinit.ilk"
	-@erase "$(OUTDIR)\wwwinit.exp"
	-@erase "$(OUTDIR)\wwwinit.lib"
	-@erase "$(OUTDIR)\wwwinit.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\modules\expat\xmlparse" /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwinit.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwinit.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwinit.pdb" /debug /machine:I386 /def:".\wwwinit.def" /out:"$(OUTDIR)\Debug\wwwinit.dll" /implib:"$(OUTDIR)\wwwinit.lib" 
DEF_FILE= \
	".\wwwinit.def"
LINK32_OBJS= \
	"$(INTDIR)\HTInit.obj" \
	"$(INTDIR)\HTProfil.obj" \
	"$(INTDIR)\windll.obj" \
	"..\..\External\xmlparse.lib" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwapp.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwmime.lib" \
	"$(OUTDIR)\wwwfile.lib" \
	"$(OUTDIR)\wwwftp.lib" \
	"$(OUTDIR)\wwwgophe.lib" \
	"$(OUTDIR)\wwwhttp.lib" \
	"$(OUTDIR)\wwwcache.lib" \
	"$(OUTDIR)\wwwnews.lib" \
	"$(OUTDIR)\wwwstream.lib" \
	"$(OUTDIR)\wwwtelnt.lib" \
	"$(OUTDIR)\wwwtrans.lib" \
	"$(OUTDIR)\wwwdir.lib" \
	"$(OUTDIR)\wwwhtml.lib" \
	"$(OUTDIR)\wwwxml.lib" \
	"$(OUTDIR)\wwwzip.lib" \
	"$(OUTDIR)\wwwwais.lib"

"$(OUTDIR)\Debug\wwwinit.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwinit.dep")
!INCLUDE "wwwinit.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwinit.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwinit - Win32 Release" || "$(CFG)" == "wwwinit - Win32 Debug"
SOURCE=..\HTInit.c

"$(INTDIR)\HTInit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTProfil.c

"$(INTDIR)\HTProfil.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwapp - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Release" 
   cd "."

"wwwapp - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwapp - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Debug" 
   cd "."

"wwwapp - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwapp.mak" CFG="wwwapp - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwmime - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Release" 
   cd "."

"wwwmime - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwmime - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Debug" 
   cd "."

"wwwmime - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwmime.mak" CFG="wwwmime - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwfile - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" 
   cd "."

"wwwfile - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwfile - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" 
   cd "."

"wwwfile - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwftp - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwftp.mak" CFG="wwwftp - Win32 Release" 
   cd "."

"wwwftp - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwftp.mak" CFG="wwwftp - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwftp - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwftp.mak" CFG="wwwftp - Win32 Debug" 
   cd "."

"wwwftp - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwftp.mak" CFG="wwwftp - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwgophe - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwgophe.mak" CFG="wwwgophe - Win32 Release" 
   cd "."

"wwwgophe - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwgophe.mak" CFG="wwwgophe - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwgophe - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwgophe.mak" CFG="wwwgophe - Win32 Debug" 
   cd "."

"wwwgophe - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwgophe.mak" CFG="wwwgophe - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwhttp - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Release" 
   cd "."

"wwwhttp - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwhttp - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Debug" 
   cd "."

"wwwhttp - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwcache - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcache.mak" CFG="wwwcache - Win32 Release" 
   cd "."

"wwwcache - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcache.mak" CFG="wwwcache - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwcache - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcache.mak" CFG="wwwcache - Win32 Debug" 
   cd "."

"wwwcache - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcache.mak" CFG="wwwcache - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwnews - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwnews.mak" CFG="wwwnews - Win32 Release" 
   cd "."

"wwwnews - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwnews.mak" CFG="wwwnews - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwnews - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwnews.mak" CFG="wwwnews - Win32 Debug" 
   cd "."

"wwwnews - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwnews.mak" CFG="wwwnews - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwstream - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" 
   cd "."

"wwwstream - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwstream - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" 
   cd "."

"wwwstream - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwstream.mak" CFG="wwwstream - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwtelnt - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtelnt.mak" CFG="wwwtelnt - Win32 Release" 
   cd "."

"wwwtelnt - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtelnt.mak" CFG="wwwtelnt - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwtelnt - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtelnt.mak" CFG="wwwtelnt - Win32 Debug" 
   cd "."

"wwwtelnt - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtelnt.mak" CFG="wwwtelnt - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwtrans - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Release" 
   cd "."

"wwwtrans - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwtrans - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Debug" 
   cd "."

"wwwtrans - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwtrans.mak" CFG="wwwtrans - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwdir - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Release" 
   cd "."

"wwwdir - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwdir - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Debug" 
   cd "."

"wwwdir - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdir.mak" CFG="wwwdir - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwhtml - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" 
   cd "."

"wwwhtml - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwhtml - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" 
   cd "."

"wwwhtml - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhtml.mak" CFG="wwwhtml - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwxml - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Release" 
   cd "."

"wwwxml - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwxml - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Debug" 
   cd "."

"wwwxml - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwzip - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwzip.mak" CFG="wwwzip - Win32 Release" 
   cd "."

"wwwzip - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwzip.mak" CFG="wwwzip - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwzip - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwzip.mak" CFG="wwwzip - Win32 Debug" 
   cd "."

"wwwzip - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwzip.mak" CFG="wwwzip - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwinit - Win32 Release"

"wwwwais - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwwais.mak" CFG="wwwwais - Win32 Release" 
   cd "."

"wwwwais - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwwais.mak" CFG="wwwwais - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwinit - Win32 Debug"

"wwwwais - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwwais.mak" CFG="wwwwais - Win32 Debug" 
   cd "."

"wwwwais - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwwais.mak" CFG="wwwwais - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

