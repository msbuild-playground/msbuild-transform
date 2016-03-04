rem "== EDIT THIS SECTION =="
set app=ScanStation
set targetDir=Z:\temp\nuget
set transformer=ScanStation-Release.config

rem "== DO NOT TOUCH THIS =="
set tempFile=%temp%/app.config
set appConfig=%targetDir%/%app%/%app%.exe.config
set projectFile="\\192.168.0.115\B Circle Software\NugetPackages\Transform.xml"

rem "== RREPARE ENV =="
cp "%appConfig%" "%tempFile%"
rmdir /S "%targetDir%/%app%"

rem "== PROCESS =="
call nuget install %app% -ExcludeVersion -OutputDirectory %targetDir%
call pymsbuild %projectFile% ^
	/p:SourceFile=%tempFile% ^
	/p:TransformFile="%cd%/%transformer%" ^
	/p:TargetFile=%appConfig% ^
	/verbosity:m ^
	/t:AfterCompile

pause