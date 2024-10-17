@echo off
setlocal

rem Obtener el espacio libre antes de la limpieza
for /f "tokens=3" %%a in ('dir %temp% ^| find "bytes free"') do set FreeSpaceBeforeTemp=%%a
for /f "tokens=3" %%a in ('dir C:\Windows\Prefetch ^| find "bytes free"') do set FreeSpaceBeforePrefetch=%%a

rem Borrar archivos temporales
echo Borrando archivos temporales...
del /s /q %temp%\*
rd /s /q %temp%
md %temp%
echo Archivos temporales borrados.

rem Borrar archivos de Prefetch
echo Borrando archivos de Prefetch...
del /s /q C:\Windows\Prefetch\*
echo Archivos de Prefetch borrados.

rem Obtener el espacio libre después de la limpieza
for /f "tokens=3" %%a in ('dir %temp% ^| find "bytes free"') do set FreeSpaceAfterTemp=%%a
for /f "tokens=3" %%a in ('dir C:\Windows\Prefetch ^| find "bytes free"') do set FreeSpaceAfterPrefetch=%%a

rem Calcular el espacio liberado
set /a SpaceFreedTemp=%FreeSpaceAfterTemp% - %FreeSpaceBeforeTemp%
set /a SpaceFreedPrefetch=%FreeSpaceAfterPrefetch% - %FreeSpaceBeforePrefetch%

echo Espacio liberado en archivos temporales: %SpaceFreedTemp% bytes
echo Espacio liberado en archivos de Prefetch: %SpaceFreedPrefetch% bytes

pause
endlocal