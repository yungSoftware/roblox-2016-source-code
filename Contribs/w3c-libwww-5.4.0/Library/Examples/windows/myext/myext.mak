# Microsoft Developer Studio Generated NMAKE File, Based on myext.dsp
!IF "$(CFG)" == ""
CFG=myext - Win32 Debug
!MESSAGE No configuration specified. Defaulting to myext - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "myext - Win32 Release" && "$(CFG)" != "myext - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "myext.mak" CFG="myext - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "myext - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "myext - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "myext - Win32 Release"

OUTDIR=.\..\..\..\..\Bin\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\..\..\..\Bin\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\myext.exe"

!ELSE 

ALL : "wwwhttp - Win32 Release" "wwwxml - Win32 Release" "wwwinit - Win32 Release" "$(OUTDIR)\myext.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 ReleaseCLEAN" "wwwxml - Win32 ReleaseCLEAN" "wwwhttp - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\myext.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\myext.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\src" /I "..\..\..\External" /I "..\..\..\..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\myext.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\myext.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\myext.pdb" /machine:I386 /out:"$(OUTDIR)\myext.exe" 
LINK32_OBJS= \
	"$(INTDIR)\myext.obj" \
	"..\..\..\..\Bin\wwwstream.lib" \
	"..\..\..\..\Bin\wwwcore.lib" \
	"..\..\..\..\Bin\wwwutils.lib" \
	"..\..\..\..\Bin\wwwapp.lib" \
	"..\..\..\External\xmlparse.lib" \
	"..\..\..\..\Bin\wwwinit.lib" \
	"..\..\..\..\Bin\wwwxml.lib" \
	"..\..\..\..\Bin\wwwhttp.lib"

"$(OUTDIR)\myext.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "myext - Win32 Debug"

OUTDIR=.\..\..\..\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\..\..\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\myext.exe"

!ELSE 

ALL : "wwwhttp - Win32 Debug" "wwwxml - Win32 Debug" "wwwinit - Win32 Debug" "$(OUTDIR)\myext.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 DebugCLEAN" "wwwxml - Win32 DebugCLEAN" "wwwhttp - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\myext.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\myext.exe"
	-@erase "$(OUTDIR)\myext.ilk"
	-@erase "$(OUTDIR)\myext.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\src" /I "..\..\..\External" /I "..\..\..\..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\myext.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\myext.pdb" /debug /machine:I386 /out:"$(OUTDIR)\myext.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\myext.obj" \
	"..\..\..\..\Bin\wwwstream.lib" \
	"..\..\..\..\Bin\wwwcore.lib" \
	"..\..\..\..\Bin\wwwutils.lib" \
	"..\..\..\..\Bin\wwwapp.lib" \
	"..\..\..\External\xmlparse.lib" \
	"..\..\..\..\Bin\wwwinit.lib" \
	"..\..\..\..\Bin\wwwxml.lib" \
	"..\..\..\..\Bin\wwwhttp.lib"

"$(OUTDIR)\myext.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("myext.dep")
!INCLUDE "myext.dep"
!ELSE 
!MESSAGE Warning: cannot find "myext.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "myext - Win32 Release" || "$(CFG)" == "myext - Win32 Debug"
SOURCE=..\..\myext.c

"$(INTDIR)\myext.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!IF  "$(CFG)" == "myext - Win32 Release"

"wwwinit - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" 
   cd "..\..\Examples\windows\myext"

"wwwinit - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\myext"

!ELSEIF  "$(CFG)" == "myext - Win32 Debug"

"wwwinit - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" 
   cd "..\..\Examples\windows\myext"

"wwwinit - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\myext"

!ENDIF 

!IF  "$(CFG)" == "myext - Win32 Release"

"wwwxml - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Release" 
   cd "..\..\Examples\windows\myext"

"wwwxml - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\myext"

!ELSEIF  "$(CFG)" == "myext - Win32 Debug"

"wwwxml - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Debug" 
   cd "..\..\Examples\windows\myext"

"wwwxml - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwxml.mak" CFG="wwwxml - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\myext"

!ENDIF 

!IF  "$(CFG)" == "myext - Win32 Release"

"wwwhttp - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Release" 
   cd "..\..\Examples\windows\myext"

"wwwhttp - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\myext"

!ELSEIF  "$(CFG)" == "myext - Win32 Debug"

"wwwhttp - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Debug" 
   cd "..\..\Examples\windows\myext"

"wwwhttp - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwhttp.mak" CFG="wwwhttp - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\Examples\windows\myext"

!ENDIF 


!ENDIF 

