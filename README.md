# MSBuild SDL3

Please run `build.bat`.
Use git and download the latest source from github.
Generate a static dlls using Visual Studio 2022 Comunity.
Compress `dist/lib`, `dist/include`, and `dist/license` folder and store them in the `release` folder.

or

Build automatically with github actions.

# Windows building

## 1.Install

### Visual Studio 2022 Community

[https://visualstudio.microsoft.com/](https://visualstudio.microsoft.com/)

### Git for Windows

[https://gitforwindows.org/](https://gitforwindows.org/)

## 2.Git clone

Type the following command in the shell.
```
git clone https://github.com/sansuido/msbuild-sdl3
```
or

Download ZIP, and unzip.

## 3.Change Directory & build

```
cd msbuild-sdl3
build.bat
```
or 

Double click `build.bat`

If successful, a zip file will be generated in the `release` folder.

# Author

[yamahara](https://twitter.com/yamahara)