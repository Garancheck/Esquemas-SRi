@echo off

cd Esquemas
for %%f in (*.xsd) do (
    DEL %%~nf.cs
	"%programfiles(x86)%\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\xsd.exe" /c /namespace:SRi.Esquemas.%%~nf /language:CS %%~nf.xsd xmldsig-core-schema.xsd 
	RENAME %%~nf_xmldsig-core-schema.cs %%~nf.cs
	"%programfiles(x86)%\MSBuild\14.0\Bin\amd64\csc.exe" %%~nf.cs /target:library
	MOVE %%~nf.dll ..\..\build\%%~nf.dll
	DEL %%~nf.cs
)

