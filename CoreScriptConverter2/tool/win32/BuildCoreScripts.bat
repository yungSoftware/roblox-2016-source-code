ECHO Running CoreScriptConverter
CD %~dp0
rsc.exe --rscloc %1 --verbose

CD ..\..\..\App\script
cd

IF EXIST LuaGenCS.inl (
	FC /b LuaGenCSNew.inl LuaGenCS.inl > nul
	IF ERRORLEVEL == 1 (
		ECHO CoreScript changes detected, will require linking 1
		DEL LuaGenCS.inl
		REN "LuaGenCSNew.inl" "LuaGenCS.inl"
	) ELSE (
		ECHO No CoreScript changes detected
		DEL LuaGenCSNew.inl
	)
) ELSE (
	ECHO CoreScript changes detected, will require linking 2
	REN "LuaGenCSNew.inl" "LuaGenCS.inl"
)