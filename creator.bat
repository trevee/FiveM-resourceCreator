@echo off

echo Resource Name:
set /p resourceName=

echo Project Name:
set /p projectName=

md %resourceName%
cd ./%resourceName%/

copy nul fxmanifest.lua
echo fx_version 'cerulean'>> fxmanifest.lua
echo game 'gta5'>> fxmanifest.lua
echo -->> fxmanifest.lua
echo project '%projectName%'>> fxmanifest.lua
echo -->> fxmanifest.lua
echo ui_page 'client/html/index.html'>> fxmanifest.lua
echo -->> fxmanifest.lua
echo shared_script 'config/cl_config.lua'>> fxmanifest.lua
echo client_script 'client/main.lua'>> fxmanifest.lua
echo -->> fxmanifest.lua
echo server_scripts { 'config/sv_config.lua', 'server/main.lua' }>> fxmanifest.lua
echo -->> fxmanifest.lua
echo files 'client/html/**'>> fxmanifest.lua

setlocal 
md config
cd ./config/
copy nul cl_config.lua
echo cl_%projectName% = {}>> cl_config.lua
copy nul sv_config.lua
echo sv_%projectName% = {}>> sv_config.lua
endlocal

setlocal
md client
cd ./client/
copy nul main.lua
md html
cd ./html/
copy nul index.html
md assets
cd ./assets/
md img
endlocal

setlocal
md server
cd ./server/
copy nul main.lua
endlocal

startlocal 
cd ./client/html/assets/
md css
cd ./css/
copy nul style.css
echo *,>> style.css
echo ::before,>> style.css
echo ::after {>> style.css
echo   margin: 0; padding: 0;>> style.css
echo }>> style.css
endlocal


