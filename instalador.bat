@echo off
setlocal enabledelayedexpansion

rem Definir la ubicación de la carpeta myScripts
set "myScriptsFolder=%USERPROFILE%\myScripts"
set "navegarScript=%USERPROFILE%\myScripts\navegar.sh"

rem Verificar si la carpeta myScripts no existe y crearla si es necesario
if not exist "!myScriptsFolder!" (
    mkdir "!myScriptsFolder!"
    echo Carpeta myScripts creada en %USERPROFILE%
)

rem Copiar el archivo navegar.sh al directorio myScripts
copy "navegar.sh" "!myScriptsFolder!"

rem Reemplazar las barras invertidas con barras inclinadas en la ruta
set "navegarScript=!navegarScript:\=//!"

rem Verificar si el archivo .bashrc existe y agregar el alias si es necesario
if exist "%USERPROFILE%\.bashrc" (
    echo # Alias para ejecutar el script de navegación>> "%USERPROFILE%\.bashrc"
    echo alias navegar="source !navegarScript!">> "%USERPROFILE%\.bashrc"
) else (
    echo Archivo .bashrc no encontrado en %USERPROFILE%. El alias no se ha agregado.
)

echo Proceso completado.
pause
