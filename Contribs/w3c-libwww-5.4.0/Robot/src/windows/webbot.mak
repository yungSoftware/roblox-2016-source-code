# Microsoft Developer Studio Generated NMAKE File, Based on webbot.dsp
!IF "$(CFG)" == ""
CFG=webbot - Win32 Release
!MESSAGE No configuration specified. Defaulting to webbot - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "webbot - Win32 Release" && "$(CFG)" != "webbot - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "webbot.mak" CFG="webbot - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "webbot - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "webbot - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "webbot - Win32 Release"

OUTDIR=.\..\..\..\Bin\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\..\..\..\Bin\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\webbot.exe"

!ELSE 

ALL : "wwwinit - Win32 Release" "$(OUTDIR)\webbot.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTQueue.obj"
	-@erase "$(INTDIR)\HTRobot.obj"
	-@erase "$(INTDIR)\RobotMain.obj"
	-@erase "$(INTDIR)\RobotTxt.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\webbot.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\Library\src" /I "..\..\..\Library\External" /I "..\..\..\modules\expat\xmlparse" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /Fp"$(INTDIR)\webbot.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\webbot.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\webbot.pdb" /machine:I386 /out:"$(OUTDIR)\webbot.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HTQueue.obj" \
	"$(INTDIR)\HTRobot.obj" \
	"$(INTDIR)\RobotMain.obj" \
	"$(INTDIR)\RobotTxt.obj" \
	"..\..\..\Library\External\gnu_regex.lib" \
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

"$(OUTDIR)\webbot.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "webbot - Win32 Debug"

OUTDIR=.\..\..\..\Bin\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\..\..\..\Bin\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\webbot.exe" "$(OUTDIR)\webbot.bsc"

!ELSE 

ALL : "wwwinit - Win32 Debug" "$(OUTDIR)\webbot.exe" "$(OUTDIR)\webbot.bsc"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"wwwinit - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\HTQueue.obj"
	-@erase "$(INTDIR)\HTQueue.sbr"
	-@erase "$(INTDIR)\HTRobot.obj"
	-@erase "$(INTDIR)\HTRobot.sbr"
	-@erase "$(INTDIR)\RobotMain.obj"
	-@erase "$(INTDIR)\RobotMain.sbr"
	-@erase "$(INTDIR)\RobotTxt.obj"
	-@erase "$(INTDIR)\RobotTxt.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\webbot.bsc"
	-@erase "$(OUTDIR)\webbot.exe"
	-@erase "$(OUTDIR)\webbot.ilk"
	-@erase "$(OUTDIR)\webbot.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\..\Library\src" /I "..\..\..\Library\External" /I "..\..\..\modules\expat\xmlparse" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_ASYNC" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\webbot.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\webbot.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\HTQueue.sbr" \
	"$(INTDIR)\HTRobot.sbr" \
	"$(INTDIR)\RobotMain.sbr" \
	"$(INTDIR)\RobotTxt.sbr"

"$(OUTDIR)\webbot.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\webbot.pdb" /debug /machine:I386 /out:"$(OUTDIR)\webbot.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HTQueue.obj" \
	"$(INTDIR)\HTRobot.obj" \
	"$(INTDIR)\RobotMain.obj" \
	"$(INTDIR)\RobotTxt.obj" \
	"..\..\..\Library\External\gnu_regex.lib" \
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

"$(OUTDIR)\webbot.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("webbot.dep")
!INCLUDE "webbot.dep"
!ELSE 
!MESSAGE Warning: cannot find "webbot.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "webbot - Win32 Release" || "$(CFG)" == "webbot - Win32 Debug"
SOURCE=..\HTQueue.c

!IF  "$(CFG)" == "webbot - Win32 Release"


"$(INTDIR)\HTQueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "webbot - Win32 Debug"


"$(INTDIR)\HTQueue.obj"	"$(INTDIR)\HTQueue.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\HTRobot.c

!IF  "$(CFG)" == "webbot - Win32 Release"


"$(INTDIR)\HTRobot.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "webbot - Win32 Debug"


"$(INTDIR)\HTRobot.obj"	"$(INTDIR)\HTRobot.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\RobotMain.c

!IF  "$(CFG)" == "webbot - Win32 Release"


"$(INTDIR)\RobotMain.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "webbot - Win32 Debug"


"$(INTDIR)\RobotMain.obj"	"$(INTDIR)\RobotMain.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\RobotTxt.c

!IF  "$(CFG)" == "webbot - Win32 Release"


"$(INTDIR)\RobotTxt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "webbot - Win32 Debug"


"$(INTDIR)\RobotTxt.obj"	"$(INTDIR)\RobotTxt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

!IF  "$(CFG)" == "webbot - Win32 Release"

"wwwinit - Win32 Release" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" 
   cd "..\..\..\Robot\src\windows"

"wwwinit - Win32 ReleaseCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\..\Robot\src\windows"

!ELSEIF  "$(CFG)" == "webbot - Win32 Debug"

"wwwinit - Win32 Debug" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" 
   cd "..\..\..\Robot\src\windows"

"wwwinit - Win32 DebugCLEAN" : 
   cd "\libwww-dev\libwww\Library\src\windows"
   $(MAKE) /$(MAKEFLAGS) /F ".\wwwinit.mak" CFG="wwwinit - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\..\Robot\src\windows"

!ENDIF 


!ENDIF 

