rem call "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars32.bat"

if exist "dist" (
  rmdir dist /s /q
)
if exist "SDL3" (
  rmdir SDL3 /s /q
)
mkdir SDL3

call build_cmake_to SDL SDL3

call build_cmake_to SDL_image SDL3_image

call build_cmake_to SDL_mixer SDL3_mixer

call build_cmake_to SDL_ttf SDL3_ttf

call build_cmake_to SDL_net SDL3_net

call build_cmake_to SDL_rtf SDL3_rtf

call build_cmake_to SDL_shadercross SDL_shadercross

if not exist "release" (
  mkdir release
)

powershell compress-archive dist/* release/SDL3-%date:~0,4%-%date:~5,2%-%date:~8,2% -Force

rem gh release create %date:~0,4%-%date:~5,2%-%date:~8,2% --title %date:~0,4%-%date:~5,2%-%date:~8,2% --notes ""
rem gh release upload %date:~0,4%-%date:~5,2%-%date:~8,2% release/SDL3-%date:~0,4%-%date:~5,2%-%date:~8,2%.zip
