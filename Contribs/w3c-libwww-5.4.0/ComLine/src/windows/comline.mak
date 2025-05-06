# Microsoft Developer Studio Generated NMAKE File, Based on comline.dsp
!IF "$(CFG)" == ""
CFG=comline - Win32 Release
!MESSAGE No configuration specified. Defaulting to comline - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "comline - Win32 Release" && "$(CFG)" != "comline - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "comline.mak" CFG="comline - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "comline - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "comline - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "comline - Win32 Release"

OUTDIR=.\..\..\..\Bin\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\comline.exe"

!ELSE 

ALL : "wwwinit - Win32 Release" "$(OUTDIR)\comline.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTLine.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\comline.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\Library\src" /I "..\..\..\Library\External" /I "..\..\..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\comline.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\comline.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\comline.pdb" /machine:I386 /out:"$(OUTDIR)\comline.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HTLine.obj" \
	"..\..\..\Bin\wwwapp.lib" \
	"..\..\..\Bin\wwwcache.lib" \
	"..\..\..\Bin\wwwcore.lib" \
	"..\..\..\Bin\wwwdir.lib" \
	"..\..\..\Bin\wwwdll.lib" \
	"..\..\..\Bin\wwwfile.lib" \
	"..\..\..\Bin\wwwftp.lib" \
	"..\..\..\Bin\wwwgophe.lib" \
	"..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\Bin\wwwhttp.lib" \
	"..\..\..\Bin\wwwmime.lib" \
	"..\..\..\Bin\wwwnews.lib" \
	"..\..\..\Bin\wwwstream.lib" \
	"..\..\..\Bin\wwwtelnt.lib" \
	"..\..\..\Bin\wwwtrans.lib" \
	"..\..\..\Bin\wwwutils.lib" \
	"..\..\..\Bin\wwwwais.lib" \
	"..\..\..\Bin\wwwzip.lib" \
	"..\..\..\Bin\wwwinit.lib"

"$(OUTDIR)\comline.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

OUTDIR=.\..\..\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\comline.exe" "$(OUTDIR)\comline.bsc"

!ELSE 

ALL : "wwwinit - Win32 Debug" "$(OUTDIR)\comline.exe" "$(OUTDIR)\comline.bsc"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTLine.obj"
	-@erase "$(INTDIR)\HTLine.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\comline.bsc"
	-@erase "$(OUTDIR)\comline.exe"
	-@erase "$(OUTDIR)\comline.ilk"
	-@erase "$(OUTDIR)\comline.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\Library\src" /I "..\..\..\Library\External" /I "..\..\..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\comline.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\comline.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\HTLine.sbr"

"$(OUTDIR)\comline.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\comline.pdb" /debug /machine:I386 /out:"$(OUTDIR)\comline.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HTLine.obj" \
	"..\..\..\Bin\wwwapp.lib" \
	"..\..\..\Bin\wwwcache.lib" \
	"..\..\..\Bin\wwwcore.lib" \
	"..\..\..\Bin\wwwdir.lib" \
	"..\..\..\Bin\wwwdll.lib" \
	"..\..\..\Bin\wwwfile.lib" \
	"..\..\..\Bin\wwwftp.lib" \
	"..\..\..\Bin\wwwgophe.lib" \
	"..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\Bin\wwwhttp.lib" \
	"..\..\..\Bin\wwwmime.lib" \
	"..\..\..\Bin\wwwnews.lib" \
	"..\..\..\Bin\wwwstream.lib" \
	"..\..\..\Bin\wwwtelnt.lib" \
	"..\..\..\Bin\wwwtrans.lib" \
	"..\..\..\Bin\wwwutils.lib" \
	"..\..\..\Bin\wwwwais.lib" \
	"..\..\..\Bin\wwwzip.lib" \
	"..\..\..\Bin\wwwinit.lib"

"$(OUTDIR)\comline.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("comline.dep")
!INCLUDE "comline.dep"
!ELSE 
!MESSAGE Warning: cannot find "comline.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "comline - Win32 Release" || "$(CFG)" == "comline - Win32 Debug"
SOURCE=..\HTLine.c

!IF  "$(CFG)" == "comline - Win32 Release"


"$(INTDIR)\HTLine.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "comline - Win32 Debug"


"$(INTDIR)\HTLine.obj"	"$(INTDIR)\HTLine.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

!IF  "$(CFG)" == "comline - Win32 Release"

"wwwinit - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" 
   cd "..\..\..\ComLine\src\windows"

"wwwinit - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\ComLine\src\windows"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

"wwwinit - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" 
   cd "..\..\..\ComLine\src\windows"

"wwwinit - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\ComLine\src\windows"

!ENDIF 


!ENDIF 

