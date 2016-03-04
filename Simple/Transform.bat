pymsbuild Transform.xml ^
	/p:SourceFile=App.config ^
	/p:TransformFile=Release.config ^
	/p:TargetFile=_Transofrm.config ^
	/t:AfterCompile