# Microsoft Developer Studio Generated NMAKE File, Based on wwwstream.dsp
!IF "$(CFG)" == ""
CFG=wwwstream - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwstream - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwstream - Win32 Release" && "$(CFG)" != "wwwstream - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwstream.mak" CFG="wwwstream - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwstream - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwstream - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwstream - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwstream\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwstream.dll"

!ELSE 

ALL : "wwwfile - Win32 Release" "wwwutils - Win32 Release" "wwwdll - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwstream.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwfile - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTConLen.obj"
	-@erase "$(INTDIR)\HTEPtoCl.obj"
	-@erase "$(INTDIR)\HTFSave.obj"
	-@erase "$(INTDIR)\HTFWrite.obj"
	-@erase "$(INTDIR)\HTGuess.obj"
	-@erase "$(INTDIR)\HTMerge.obj"
	-@erase "$(INTDIR)\HTNetTxt.obj"
	-@erase "$(INTDIR)\HTSChunk.obj"
	-@erase "$(INTDIR)\HTTee.obj"
	-@erase "$(INTDIR)\HTXParse.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwstream.dll"
	-@erase "$(OUTDIR)\wwwstream.exp"
	-@erase "$(OUTDIR)\wwwstream.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwstream.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwstream.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwstream.pdb" /machine:I386 /def:".\wwwstream.def" /out:"$(OUTDIR)\Release\wwwstream.dll" /implib:"$(OUTDIR)\wwwstream.lib" 
DEF_FILE= \
	".\wwwstream.def"
LINK32_OBJS= \
	"$(INTDIR)\HTConLen.obj" \
	"$(INTDIR)\HTEPtoCl.obj" \
	"$(INTDIR)\HTFSave.obj" \
	"$(INTDIR)\HTFWrite.obj" \
	"$(INTDIR)\HTGuess.obj" \
	"$(INTDIR)\HTMerge.obj" \
	"$(INTDIR)\HTNetTxt.obj" \
	"$(INTDIR)\HTSChunk.obj" \
	"$(INTDIR)\HTTee.obj" \
	"$(INTDIR)\HTXParse.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwfile.lib"

"$(OUTDIR)\Release\wwwstream.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwstream - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwstream\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwstream.dll"

!ELSE 

ALL : "wwwfile - Win32 Debug" "wwwutils - Win32 Debug" "wwwdll - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwstream.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwfile - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTConLen.obj"
	-@erase "$(INTDIR)\HTEPtoCl.obj"
	-@erase "$(INTDIR)\HTFSave.obj"
	-@erase "$(INTDIR)\HTFWrite.obj"
	-@erase "$(INTDIR)\HTGuess.obj"
	-@erase "$(INTDIR)\HTMerge.obj"
	-@erase "$(INTDIR)\HTNetTxt.obj"
	-@erase "$(INTDIR)\HTSChunk.obj"
	-@erase "$(INTDIR)\HTTee.obj"
	-@erase "$(INTDIR)\HTXParse.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwstream.dll"
	-@erase "$(OUTDIR)\Debug\wwwstream.ilk"
	-@erase "$(OUTDIR)\wwwstream.exp"
	-@erase "$(OUTDIR)\wwwstream.lib"
	-@erase "$(OUTDIR)\wwwstream.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwstream.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwstream.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwstream.pdb" /debug /machine:I386 /def:".\wwwstream.def" /out:"$(OUTDIR)\Debug\wwwstream.dll" /implib:"$(OUTDIR)\wwwstream.lib" 
DEF_FILE= \
	".\wwwstream.def"
LINK32_OBJS= \
	"$(INTDIR)\HTConLen.obj" \
	"$(INTDIR)\HTEPtoCl.obj" \
	"$(INTDIR)\HTFSave.obj" \
	"$(INTDIR)\HTFWrite.obj" \
	"$(INTDIR)\HTGuess.obj" \
	"$(INTDIR)\HTMerge.obj" \
	"$(INTDIR)\HTNetTxt.obj" \
	"$(INTDIR)\HTSChunk.obj" \
	"$(INTDIR)\HTTee.obj" \
	"$(INTDIR)\HTXParse.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwdll.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwfile.lib"

"$(OUTDIR)\Debug\wwwstream.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwstream.dep")
!INCLUDE "wwwstream.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwstream.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwstream - Win32 Release" || "$(CFG)" == "wwwstream - Win32 Debug"
SOURCE=..\HTConLen.c

"$(INTDIR)\HTConLen.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTEPtoCl.c

"$(INTDIR)\HTEPtoCl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTFSave.c

"$(INTDIR)\HTFSave.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTFWrite.c

"$(INTDIR)\HTFWrite.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTGuess.c

"$(INTDIR)\HTGuess.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMerge.c

"$(INTDIR)\HTMerge.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTNetTxt.c

"$(INTDIR)\HTNetTxt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTSChunk.c

"$(INTDIR)\HTSChunk.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTee.c

"$(INTDIR)\HTTee.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTXParse.c

"$(INTDIR)\HTXParse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwstream - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwstream - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwstream - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwstream - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwstream - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwstream - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwstream - Win32 Release"

"wwwfile - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" 
   cd "."

"wwwfile - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwstream - Win32 Debug"

"wwwfile - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" 
   cd "."

"wwwfile - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwfile.mak" CFG="wwwfile - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

