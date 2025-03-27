# Microsoft Developer Studio Generated NMAKE File, Based on WinCom.dsp
!IF "$(CFG)" == ""
CFG=WinCom - Win32 Debug
!MESSAGE No configuration specified. Defaulting to WinCom - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "WinCom - Win32 Release" && "$(CFG)" != "WinCom - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "WinCom.mak" CFG="WinCom - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "WinCom - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "WinCom - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "WinCom - Win32 Release"

OUTDIR=.\..\Bin\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\Bin\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\WinCom.exe" ".\Release\WinCom.pch"

!ELSE 

ALL : "wwwinit - Win32 Release" "$(OUTDIR)\WinCom.exe" ".\Release\WinCom.pch"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CacheSetup.obj"
	-@erase "$(INTDIR)\Delete.obj"
	-@erase "$(INTDIR)\EntityInfo.obj"
	-@erase "$(INTDIR)\Links.obj"
	-@erase "$(INTDIR)\LinkView.obj"
	-@erase "$(INTDIR)\Listvwex.obj"
	-@erase "$(INTDIR)\Load.obj"
	-@erase "$(INTDIR)\Location.obj"
	-@erase "$(INTDIR)\MainFrm.obj"
	-@erase "$(INTDIR)\Password.obj"
	-@erase "$(INTDIR)\Progress.obj"
	-@erase "$(INTDIR)\ProxySetup.obj"
	-@erase "$(INTDIR)\Request.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\TabsView.obj"
	-@erase "$(INTDIR)\UserParameters.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VersionConflict.obj"
	-@erase "$(INTDIR)\WinCom.obj"
	-@erase "$(INTDIR)\WinCom.pch"
	-@erase "$(INTDIR)\WinComDoc.obj"
	-@erase "$(OUTDIR)\WinCom.exe"
	-@erase "..\Bin\Release\WinCom.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\Library\src" /I "..\Library\External" /I "..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WWW_WIN_ASYNC" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC_PROJ=/l 0x409 /fo"..\Bin\Release\WinCom.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\WinCom.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\WinCom.pdb" /machine:I386 /out:"$(OUTDIR)\WinCom.exe" 
LINK32_OBJS= \
	"$(INTDIR)\CacheSetup.obj" \
	"$(INTDIR)\Delete.obj" \
	"$(INTDIR)\EntityInfo.obj" \
	"$(INTDIR)\Links.obj" \
	"$(INTDIR)\LinkView.obj" \
	"$(INTDIR)\Listvwex.obj" \
	"$(INTDIR)\Load.obj" \
	"$(INTDIR)\Location.obj" \
	"$(INTDIR)\MainFrm.obj" \
	"$(INTDIR)\Password.obj" \
	"$(INTDIR)\Progress.obj" \
	"$(INTDIR)\ProxySetup.obj" \
	"$(INTDIR)\Request.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\TabsView.obj" \
	"$(INTDIR)\UserParameters.obj" \
	"$(INTDIR)\VersionConflict.obj" \
	"$(INTDIR)\WinCom.obj" \
	"$(INTDIR)\WinComDoc.obj" \
	"..\Bin\Release\WinCom.res" \
	"..\Bin\wwwapp.lib" \
	"..\Bin\wwwcache.lib" \
	"..\Bin\wwwcore.lib" \
	"..\Bin\wwwdir.lib" \
	"..\Bin\wwwfile.lib" \
	"..\Bin\wwwftp.lib" \
	"..\Bin\wwwgophe.lib" \
	"..\Bin\wwwhtml.lib" \
	"..\Bin\wwwhttp.lib" \
	"..\Bin\wwwmime.lib" \
	"..\Bin\wwwnews.lib" \
	"..\Bin\wwwstream.lib" \
	"..\Bin\wwwtelnt.lib" \
	"..\Bin\wwwtrans.lib" \
	"..\Bin\wwwutils.lib" \
	"..\Bin\wwwzip.lib" \
	"..\Bin\wwwinit.lib"

"$(OUTDIR)\WinCom.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "WinCom - Win32 Debug"

OUTDIR=.\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\WinCom.exe" ".\Debug\WinCom.pch"

!ELSE 

ALL : "wwwinit - Win32 Debug" "$(OUTDIR)\WinCom.exe" ".\Debug\WinCom.pch"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CacheSetup.obj"
	-@erase "$(INTDIR)\Delete.obj"
	-@erase "$(INTDIR)\EntityInfo.obj"
	-@erase "$(INTDIR)\Links.obj"
	-@erase "$(INTDIR)\LinkView.obj"
	-@erase "$(INTDIR)\Listvwex.obj"
	-@erase "$(INTDIR)\Load.obj"
	-@erase "$(INTDIR)\Location.obj"
	-@erase "$(INTDIR)\MainFrm.obj"
	-@erase "$(INTDIR)\Password.obj"
	-@erase "$(INTDIR)\Progress.obj"
	-@erase "$(INTDIR)\ProxySetup.obj"
	-@erase "$(INTDIR)\Request.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\TabsView.obj"
	-@erase "$(INTDIR)\UserParameters.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VersionConflict.obj"
	-@erase "$(INTDIR)\WinCom.obj"
	-@erase "$(INTDIR)\WinCom.pch"
	-@erase "$(INTDIR)\WinComDoc.obj"
	-@erase "$(OUTDIR)\WinCom.exe"
	-@erase "$(OUTDIR)\WinCom.ilk"
	-@erase "$(OUTDIR)\WinCom.pdb"
	-@erase "..\Bin\Debug\WinCom.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\Library\src" /I "..\Library\External" /I "..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WWW_WIN_ASYNC" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC_PROJ=/l 0x409 /fo"..\Bin\Debug\WinCom.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\WinCom.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\WinCom.pdb" /debug /machine:I386 /out:"$(OUTDIR)\WinCom.exe" /pdbtype:sept /libpath:"..\Library\External" /libpath:"..\..\Library\External" 
LINK32_OBJS= \
	"$(INTDIR)\CacheSetup.obj" \
	"$(INTDIR)\Delete.obj" \
	"$(INTDIR)\EntityInfo.obj" \
	"$(INTDIR)\Links.obj" \
	"$(INTDIR)\LinkView.obj" \
	"$(INTDIR)\Listvwex.obj" \
	"$(INTDIR)\Load.obj" \
	"$(INTDIR)\Location.obj" \
	"$(INTDIR)\MainFrm.obj" \
	"$(INTDIR)\Password.obj" \
	"$(INTDIR)\Progress.obj" \
	"$(INTDIR)\ProxySetup.obj" \
	"$(INTDIR)\Request.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\TabsView.obj" \
	"$(INTDIR)\UserParameters.obj" \
	"$(INTDIR)\VersionConflict.obj" \
	"$(INTDIR)\WinCom.obj" \
	"$(INTDIR)\WinComDoc.obj" \
	"..\Bin\Debug\WinCom.res" \
	"..\Bin\wwwapp.lib" \
	"..\Bin\wwwcache.lib" \
	"..\Bin\wwwcore.lib" \
	"..\Bin\wwwdir.lib" \
	"..\Bin\wwwfile.lib" \
	"..\Bin\wwwftp.lib" \
	"..\Bin\wwwgophe.lib" \
	"..\Bin\wwwhtml.lib" \
	"..\Bin\wwwhttp.lib" \
	"..\Bin\wwwmime.lib" \
	"..\Bin\wwwnews.lib" \
	"..\Bin\wwwstream.lib" \
	"..\Bin\wwwtelnt.lib" \
	"..\Bin\wwwtrans.lib" \
	"..\Bin\wwwutils.lib" \
	"..\Bin\wwwzip.lib" \
	"..\Bin\wwwinit.lib"

"$(OUTDIR)\WinCom.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("WinCom.dep")
!INCLUDE "WinCom.dep"
!ELSE 
!MESSAGE Warning: cannot find "WinCom.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "WinCom - Win32 Release" || "$(CFG)" == "WinCom - Win32 Debug"
SOURCE=.\CacheSetup.cpp

"$(INTDIR)\CacheSetup.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Delete.cpp

"$(INTDIR)\Delete.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\EntityInfo.cpp

"$(INTDIR)\EntityInfo.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Links.cpp

"$(INTDIR)\Links.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\LinkView.cpp

"$(INTDIR)\LinkView.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Listvwex.cpp

"$(INTDIR)\Listvwex.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Load.cpp

"$(INTDIR)\Load.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Location.cpp

"$(INTDIR)\Location.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\MainFrm.cpp

"$(INTDIR)\MainFrm.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Password.cpp

"$(INTDIR)\Password.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Progress.cpp

"$(INTDIR)\Progress.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ProxySetup.cpp

"$(INTDIR)\ProxySetup.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Request.cpp

"$(INTDIR)\Request.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "WinCom - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\Library\src" /I "..\Library\External" /I "..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\WinCom.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\WinCom.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "WinCom - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\Library\src" /I "..\Library\External" /I "..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\WinCom.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\WinCom.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TabsView.cpp

"$(INTDIR)\TabsView.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\UserParameters.cpp

"$(INTDIR)\UserParameters.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\VersionConflict.cpp

"$(INTDIR)\VersionConflict.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\WinCom.cpp

"$(INTDIR)\WinCom.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\hlp\WinCom.hpj
SOURCE=.\WinCom.rc

!IF  "$(CFG)" == "WinCom - Win32 Release"


"..\Bin\Release\WinCom.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "WinCom - Win32 Debug"


"..\Bin\Debug\WinCom.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\WinComDoc.cpp

"$(INTDIR)\WinComDoc.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "WinCom - Win32 Release"

"wwwinit - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" 
   cd "..\..\..\WinCom"

"wwwinit - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\WinCom"

!ELSEIF  "$(CFG)" == "WinCom - Win32 Debug"

"wwwinit - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" 
   cd "..\..\..\WinCom"

"wwwinit - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\WinCom"

!ENDIF 


!ENDIF 

