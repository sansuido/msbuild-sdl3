chdir SDL3

if exist %1 (
  rmdir %1 /s /q
)

git clone https://github.com/libsdl-org/%1.git

if exist %1 (
  chdir %1
  if exist "external" (
    chdir external
    powershell ./Get-GitModules.ps1
    chdir ..
  ) 
  if exist "include" (
    robocopy include ../../dist/include /s /e
  )
  if exist "VisualC" (
    chdir VisualC
    MSBuild %1.sln /t:clean /t:rebuild /p:Configuration=Release /p:Platform="Win32"
    MSBuild %1.sln /t:clean /t:rebuild /p:Configuration=Release /p:Platform="x64"
    robocopy Win32/release ../../../dist/lib/x86 *.dll *.lib
    robocopy x64/release ../../../dist/lib/x64 *.dll *.lib
    if exist "external" (
      if exist "external/optional" (
        robocopy external/optional/x86 ../../../dist/lib/x86 *.dll
        robocopy external/optional/x64 ../../../dist/lib/x64 *.dll
        robocopy external/optional/x64 ../../../dist/license/%1 LICENSE*.*
      )
      if exist "external/lib" (
        robocopy external/lib/x64 ../../../dist/license/%1 LICENSE*.*
      )
    )
    chdir ..
  )
  robocopy . ../../dist/license/%1 LICENSE*.*
  chdir ..
)

chdir ..
