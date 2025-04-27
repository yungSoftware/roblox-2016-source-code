# Microsoft Developer Studio Generated NMAKE File, Based on wwwhtml.dsp
!IF "$(CFG)" == ""
CFG=wwwhtml - Win32 Release
!MESSAGE No configuration specified. Defaulting to wwwhtml - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "wwwhtml - Win32 Release" && "$(CFG)" != "wwwhtml - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wwwhtml.mak" CFG="wwwhtml - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wwwhtml - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wwwhtml - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wwwhtml - Win32 Release"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwhtml\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Release\wwwhtml.dll"

!ELSE 

ALL : "wwwdll - Win32 Release" "wwwutils - Win32 Release" "wwwcore - Win32 Release" "$(OUTDIR)\Release\wwwhtml.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 ReleaseCLEAN" "wwwutils - Win32 ReleaseCLEAN" "wwwdll - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HText.obj"
	-@erase "$(INTDIR)\HTHInit.obj"
	-@erase "$(INTDIR)\HTML.obj"
	-@erase "$(INTDIR)\HTMLGen.obj"
	-@erase "$(INTDIR)\HTMLPDTD.obj"
	-@erase "$(INTDIR)\HTPlain.obj"
	-@erase "$(INTDIR)\HTStyle.obj"
	-@erase "$(INTDIR)\HTTeXGen.obj"
	-@erase "$(INTDIR)\SGML.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Release\wwwhtml.dll"
	-@erase "$(OUTDIR)\wwwhtml.exp"
	-@erase "$(OUTDIR)\wwwhtml.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\External" /D "NDEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwhtml.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwhtml.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wwwhtml.pdb" /machine:I386 /def:".\wwwhtml.def" /out:"$(OUTDIR)\Release\wwwhtml.dll" /implib:"$(OUTDIR)\wwwhtml.lib" 
DEF_FILE= \
	".\wwwhtml.def"
LINK32_OBJS= \
	"$(INTDIR)\HText.obj" \
	"$(INTDIR)\HTHInit.obj" \
	"$(INTDIR)\HTML.obj" \
	"$(INTDIR)\HTMLGen.obj" \
	"$(INTDIR)\HTMLPDTD.obj" \
	"$(INTDIR)\HTPlain.obj" \
	"$(INTDIR)\HTStyle.obj" \
	"$(INTDIR)\HTTeXGen.obj" \
	"$(INTDIR)\SGML.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwdll.lib"

"$(OUTDIR)\Release\wwwhtml.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wwwhtml - Win32 Debug"

OUTDIR=.\..\..\..\Bin
INTDIR=.\wwwhtml\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Debug\wwwhtml.dll"

!ELSE 

ALL : "wwwdll - Win32 Debug" "wwwutils - Win32 Debug" "wwwcore - Win32 Debug" "$(OUTDIR)\Debug\wwwhtml.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwcore - Win32 DebugCLEAN" "wwwutils - Win32 DebugCLEAN" "wwwdll - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HText.obj"
	-@erase "$(INTDIR)\HTHInit.obj"
	-@erase "$(INTDIR)\HTML.obj"
	-@erase "$(INTDIR)\HTMLGen.obj"
	-@erase "$(INTDIR)\HTMLPDTD.obj"
	-@erase "$(INTDIR)\HTPlain.obj"
	-@erase "$(INTDIR)\HTStyle.obj"
	-@erase "$(INTDIR)\HTTeXGen.obj"
	-@erase "$(INTDIR)\SGML.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windll.obj"
	-@erase "$(OUTDIR)\Debug\wwwhtml.dll"
	-@erase "$(OUTDIR)\Debug\wwwhtml.ilk"
	-@erase "$(OUTDIR)\wwwhtml.exp"
	-@erase "$(OUTDIR)\wwwhtml.lib"
	-@erase "$(OUTDIR)\wwwhtml.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\External" /D "_DEBUG" /D "WWW_WIN_DLL" /D "WWW_WIN_ASYNC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\wwwhtml.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\wwwhtml.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib WSock32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wwwhtml.pdb" /debug /machine:I386 /def:".\wwwhtml.def" /out:"$(OUTDIR)\Debug\wwwhtml.dll" /implib:"$(OUTDIR)\wwwhtml.lib" 
DEF_FILE= \
	".\wwwhtml.def"
LINK32_OBJS= \
	"$(INTDIR)\HText.obj" \
	"$(INTDIR)\HTHInit.obj" \
	"$(INTDIR)\HTML.obj" \
	"$(INTDIR)\HTMLGen.obj" \
	"$(INTDIR)\HTMLPDTD.obj" \
	"$(INTDIR)\HTPlain.obj" \
	"$(INTDIR)\HTStyle.obj" \
	"$(INTDIR)\HTTeXGen.obj" \
	"$(INTDIR)\SGML.obj" \
	"$(INTDIR)\windll.obj" \
	"$(OUTDIR)\wwwcore.lib" \
	"$(OUTDIR)\wwwutils.lib" \
	"$(OUTDIR)\wwwdll.lib"

"$(OUTDIR)\Debug\wwwhtml.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("wwwhtml.dep")
!INCLUDE "wwwhtml.dep"
!ELSE 
!MESSAGE Warning: cannot find "wwwhtml.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wwwhtml - Win32 Release" || "$(CFG)" == "wwwhtml - Win32 Debug"
SOURCE=..\HText.c

"$(INTDIR)\HText.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTHInit.c

"$(INTDIR)\HTHInit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTML.c

"$(INTDIR)\HTML.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMLGen.c

"$(INTDIR)\HTMLGen.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTMLPDTD.c

"$(INTDIR)\HTMLPDTD.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTPlain.c

"$(INTDIR)\HTPlain.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTStyle.c

"$(INTDIR)\HTStyle.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\HTTeXGen.c

"$(INTDIR)\HTTeXGen.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\SGML.c

"$(INTDIR)\SGML.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\windll.c

"$(INTDIR)\windll.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "wwwhtml - Win32 Release"

"wwwcore - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" 
   cd "."

"wwwcore - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhtml - Win32 Debug"

"wwwcore - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" 
   cd "."

"wwwcore - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwcore.mak" CFG="wwwcore - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwhtml - Win32 Release"

"wwwutils - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" 
   cd "."

"wwwutils - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhtml - Win32 Debug"

"wwwutils - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" 
   cd "."

"wwwutils - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwutils.mak" CFG="wwwutils - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

!IF  "$(CFG)" == "wwwhtml - Win32 Release"

"wwwdll - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" 
   cd "."

"wwwdll - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwdll.mak" CFG="wwwdll - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "wwwhtml - Win32 Debug"

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

