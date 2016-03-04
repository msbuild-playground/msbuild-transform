rem "== EDIT THIS SECTION =="
set app=ScanStation
set targetDir=Z:\temp\nuget
set transformer=ScanStation-Release.config

rem "== DO NOT TOUCH THIS =="
set tempFile=%temp%/app.config
set appConfig=%targetDir%/%app%/%app%.exe.config
set projectFile="\\192.168.0.115\B Circle Software\NugetPackages\Transform.xml"
rem set projectFile="Transform.xml"
cp "%appConfig%" "%tempFile%"

nuget install %app% -ExcludeVersion -OutputDirectory %targetDir%

pymsbuild %projectFile% ^
	/p:SourceFile=%tempFile% ^
	/p:TransformFile="%cd%/%transformer%" ^
	/p:TargetFile=%appConfig% ^
	/verbosity:m ^
	/t:AfterCompile

pause