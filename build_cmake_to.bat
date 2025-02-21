SET SDL3_DIR=../SDL/


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
  rem build
  cmake -S . -B build -DSDL3_DIR=../SDL/build -DSDLIMAGE_AVIF=OFF
  cmake --build build --config Release
  cmake --install build --config Release
  
  rem copy dll & lib files
  robocopy build/Release ../../dist/lib/x64 *.dll *.lib
  
  rem copy LICENSE files
  robocopy . ../../dist/license/%1 LICENSE*.*
  
  rem copy include files
  if exist "include" (
    robocopy include ../../dist/include /s /e
  )
  if exist "VisualC" (
    chdir VisualC
    if exist "external" (
      if exist "external/optional" (
        rem copy dll files
        robocopy external/optional/x86 ../../../dist/lib/x86 *.dll
        robocopy external/optional/x64 ../../../dist/lib/x64 *.dll
        rem copy LICENSE files
        robocopy external/optional/x64 ../../../dist/license/%1 LICENSE*.*
      )
      rem copy LICENSE files
      if exist "external/lib" (
        robocopy external/lib/x64 ../../../dist/license/%1 LICENSE*.*
      )
    )
    chdir ..
  )
  chdir ..
)

chdir ..
