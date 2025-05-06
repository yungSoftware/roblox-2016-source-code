# Microsoft Developer Studio Generated NMAKE File, Based on wwwutils.dsp
!IF "$(CFG)" == ""
CFG=wwwutils - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwutils - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwutils - Win32 Release" && "$(CFG)" != "wwwutils - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwutils.mak" CFG="wwwutils - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwutils - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwutils - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwutils - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwutils\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwutils.dll"

!ELSE 

ALL : "wwwdll - Win32 Release" "$(OUTDIR)\Release\wwwutils.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwdll - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTArray.obj"
	-@erase "$(INTDIR)\HTAssoc.obj"
	-@erase "$(INTDIR)\HTAtom.obj"
	-@erase "$(INTDIR)\HTBTree.obj"
	-@erase "$(INTDIR)\HTChunk.obj"
	-@erase "$(INTDIR)\HTHash.obj"
	-@erase "$(INTDIR)\HTList.obj"
	-@erase "$(INTDIR)\HTMemory.obj"
	-@erase "$(INTDIR)\HTString.obj"
	-@erase "$(INTDIR)\HTTrace.obj"
	-@erase "$(INTDIR)\HTUU.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwutils.dll"
	-@erase "$(OUTDIR)\wwwutils.exp"
	-@erase "$(OUTDIR)\wwwutils.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwutils.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwutils.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwutils.pdb" /machine:I386 /def:".\wwwutils.def" /out:"$(OUTDIR)\Release\wwwutils.dll" /implib:"$(OUTDIR)\wwwutils.lib" 
DEF_FILE= \
	".\wwwutils.def"
LINK32_OBJS= \
	"$(INTDIR)\HTArray.obj" \
	"$(INTDIR)\HTAssoc.obj" \
	"$(INTDIR)\HTAtom.obj" \
	"$(INTDIR)\HTBTree.obj" \
	"$(INTDIR)\HTChunk.obj" \
	"$(INTDIR)\HTHash.obj" \
	"$(INTDIR)\HTList.obj" \
	"$(INTDIR)\HTMemory.obj" \
	"$(INTDIR)\HTString.obj" \
	"$(INTDIR)\HTTrace.obj" \
	"$(INTDIR)\HTUU.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwdll.lib"

"$(OUTDIR)\Release\wwwutils.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwutils - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwutils\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwutils.dll"

!ELSE 

ALL : "wwwdll - Win32 Debug" "$(OUTDIR)\Debug\wwwutils.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwdll - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTArray.obj"
	-@erase "$(INTDIR)\HTAssoc.obj"
	-@erase "$(INTDIR)\HTAtom.obj"
	-@erase "$(INTDIR)\HTBTree.obj"
	-@erase "$(INTDIR)\HTChunk.obj"
	-@erase "$(INTDIR)\HTHash.obj"
	-@erase "$(INTDIR)\HTList.obj"
	-@erase "$(INTDIR)\HTMemory.obj"
	-@erase "$(INTDIR)\HTString.obj"
	-@erase "$(INTDIR)\HTTrace.obj"
	-@erase "$(INTDIR)\HTUU.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwutils.dll"
	-@erase "$(OUTDIR)\Debug\wwwutils.ilk"
	-@erase "$(OUTDIR)\wwwutils.exp"
	-@erase "$(OUTDIR)\wwwutils.lib"
	-@erase "$(OUTDIR)\wwwutils.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwutils.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwutils.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwutils.pdb" /debug /machine:I386 /def:".\wwwutils.def" /out:"$(OUTDIR)\Debug\wwwutils.dll" /implib:"$(OUTDIR)\wwwutils.lib" 
DEF_FILE= \
	".\wwwutils.def"
LINK32_OBJS= \
	"$(INTDIR)\HTArray.obj" \
	"$(INTDIR)\HTAssoc.obj" \
	"$(INTDIR)\HTAtom.obj" \
	"$(INTDIR)\HTBTree.obj" \
	"$(INTDIR)\HTChunk.obj" \
	"$(INTDIR)\HTHash.obj" \
	"$(INTDIR)\HTList.obj" \
	"$(INTDIR)\HTMemory.obj" \
	"$(INTDIR)\HTString.obj" \
	"$(INTDIR)\HTTrace.obj" \
	"$(INTDIR)\HTUU.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwdll.lib"

"$(OUTDIR)\Debug\wwwutils.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwutils.dep")
!INCLUDE "wwwutils.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwutils.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwutils - Win32 Release" || "$(CFG)" == "wwwutils - Win32 Debug"
SOURCE=..\HTArray.c

"$(INTDIR)\HTArray.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTAssoc.c

"$(INTDIR)\HTAssoc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTAtom.c

"$(INTDIR)\HTAtom.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTBTree.c

"$(INTDIR)\HTBTree.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTChunk.c

"$(INTDIR)\HTChunk.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTHash.c

"$(INTDIR)\HTHash.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTList.c

"$(INTDIR)\HTList.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMemory.c

"$(INTDIR)\HTMemory.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTString.c

"$(INTDIR)\HTString.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTrace.c

"$(INTDIR)\HTTrace.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTUU.c

"$(INTDIR)\HTUU.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwutils - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwutils - Win32 Debug"

"wwwdll - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" 
   cd "."

"wwwdll - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 


!ENDIF 

