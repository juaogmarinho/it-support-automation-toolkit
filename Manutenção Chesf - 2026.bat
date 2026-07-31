@echo off
mode con: cols=120 lines=30
color 0A

echo.
echo Ferramenta Manutencao - Suporte T.I Axia Energia Nordeste N2
timeout /t 1 /nobreak > nul
powershell -Command "Clear-Host"


:menu
powershell -Command "Clear-Host"
echo.
echo Informacoes do Equipamento:
echo.
powershell -Command "Write-Host ('Hostname: ' + $env:COMPUTERNAME + ' | Dominio: ' + (Get-CimInstance Win32_ComputerSystem).Domain + ' | OS: ' + (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ProductName)"
echo.
echo =============================== MENU =======================================
echo *  0. Sair                                                                 *
echo *  1. Renovar a rede (Problemas com DHCP/DNS)                              *
echo *  2. Renomear computador                                                  *
echo *  3. Instalacao de Impressoras Outsourcing (Axia Energia Nordeste)        *
echo *  4. Gerencimapo de Dispositivos (ADM)                                    *
echo *  5. Gerencimapo do Computador (Administracao de Usuarios Locais)         *
echo *  6. Instalacao de Programas - Homologados                                *
echo *  7. Mapeamento Unidades de Rede - Regionais Axia Energia Nordeste        *
echo *  8. Verificacao e Limpeza de Virus/Malware (Windows Defender)            *
echo ============================================================================
echo.

set /p opcao= Digite a opcao desejada:  
echo.
echo ============================================================================

if %opcao% equ 0 goto opcao0
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8


REM Sair
:opcao0
powershell -Command "Clear-Host"
echo Voce escolheu sair...
timeout /t 2 /nobreak > nul
exit


REM Renovar a rede
:opcao1
powershell -Command "Clear-Host"
echo Renovando rede...
powershell -Command "ipconfig /release; ipconfig /renew; ipconfig /flushdns"
echo Retornando ao menu principal 
timeout /t 1 /nobreak > nul
powershell -Command "Clear-Host"
goto menu
pause


REM Renomear computador
:opcao2
powershell -Command "Clear-Host"
echo.
set /p novoNome=Digite o novo nome do computador: 
echo.
set /p confirm=Tem certeza que deseja renomear e reiniciar agora? (S/N): 
if /i not "%confirm%"=="S" (
    echo.
    echo Operacao cancelada pelo usuario.
    goto menu
    pause
    exit /b
)
echo.
echo Renomeando computador...
powershell -Command "Rename-Computer -NewName '%novoNome%' -Force -Restart"
pause


REM Instalação Impressoras Corporativas
:opcao3
powershell -Command "Clear-Host"
echo.
echo =============================================================================
echo *  0. Retornar ao Menu                                                      *
echo *  1. Sobradinho                                                            *
echo *  2. Recife                                                                *
echo *  3. Fortaleza                                                             *
echo *  4. Salvador                                                              *
echo *  5. Teresina                                                              *
echo *  6. Paulo Afonso                                                          *
echo =============================================================================
echo.

set /p mapimpressoras= Digite a opcao desejada:  
echo ============================================================================

if %mapimpressoras% equ 0 goto menu
if %mapimpressoras% equ 1 goto mapimpressoras1
if %mapimpressoras% equ 2 goto mapimpressoras2
if %mapimpressoras% equ 3 goto mapimpressoras3
if %mapimpressoras% equ 4 goto mapimpressoras4
if %mapimpressoras% equ 5 goto mapimpressoras5
if %mapimpressoras% equ 6 goto mapimpressoras6

Rem Mapeamento Impressoras - Regional Sobradinho BA
:mapimpressoras1
chcp 65001
powershell -Command "Clear-Host"
echo Iniciando Mapeamento Impressoras - Regional Sobradinho BA
powershell -Command "Clear-Host"
rundll32 printui.dll,PrintUIEntry /in /n "\\10.128.1.126\SE Sobradinho - Sala de Comando"
rundll32 printui.dll,PrintUIEntry /in /n "\\10.128.1.126\UHE Sobradinho - Secretaria"
rundll32 printui.dll,PrintUIEntry /in /n "\\10.128.1.126\SE Juazeiro da Bahia 2 - Sala de Comando"
rundll32 printui.dll,PrintUIEntry /in /n "\\10.128.1.126\SE Pindai I - Sala de Comando"
rundll32 printui.dll,PrintUIEntry /in /n "\\10.128.1.126\SE Pindaí II - Sala de Comando"
rundll32 printui.dll,PrintUIEntry /in /n "\\10.128.1.126\SE Eunápolis - Sala de Comando"
echo Retornando ao menu principal..
powershell -Command "Clear-Host"
goto menu

REM Gerenciador de Dispositivos
:opcao4
powershell -Command "Clear-Host"
echo Iniciando Gerenciador de Dispositivos...
powershell -Command "Start-Process devmgmt.msc -Verb RunAs"
echo Retornando ao menu principal..
powershell -Command "Clear-Host"
goto menu


REM Gerenciador do Computador
:opcao5
powershell -Command "Clear-Host"
echo Iniciando Gerenciador do Computador...
powershell -Command "Start-Process compmgmt.msc -Verb RunAs"
echo Retornando ao menu principal..
powershell -Command "Clear-Host"
goto menu


REM Instalação de Programas
:opcao6
powershell -Command "Clear-Host"
echo.
echo ====================== PROGRAMAS DISPONIVEIS ===============================
echo *  0. Retornar ao Menu Principal                                            *
echo *  1. Assistencia Rapida (Microsoft Store)                                  *
echo *  2. 7-Zip (Versao: 2301)                                                  *
echo *  3. Zscaler (Versao: 4.5.0.296)                                           *
echo *  4. Notepad ++ (Versao: 8.1.9.2)                                          *
echo *  5. Lightshot (Versao: 5.5.0.7)                                           *
echo *  6. FlirTools (Versao: 6.4.18039.1003)                                    *
echo *  7. Fluke Battery Manager (Versao: 1.5.63)                                *
echo *  8. Fluke Battery Manager (Versao: 1.6.0.1)                               *
echo *  9. DWG TrueView 2025 (Versao EN)                                         *
echo *  10. AutoCAD 2025 (Versao EN)                                             *
echo *  11. AutoCAD 2025 (Versao PT_BR)                                          *
echo *  12. Bizagi (Versao: 4.0.0155)                                            *
echo *  13. Bizagi (Versao: 4.2.0.003)                                           *
echo ============================================================================
echo.

set /p programa= Digite a opcao desejada:  
echo ============================================================================

if %programa% equ 0 goto programa0
if %programa% equ 1 goto programa1
if %programa% equ 2 goto programa2
if %programa% equ 3 goto programa3
if %programa% equ 4 goto programa4
if %programa% equ 5 goto programa5
if %programa% equ 6 goto programa6
if %programa% equ 7 goto programa7
if %programa% equ 8 goto programa8
if %programa% equ 9 goto programa9
if %programa% equ 10 goto programa10
if %programa% equ 11 goto programa11
if %programa% equ 12 goto programa12
if %programa% equ 13 goto programa13



:programa0
powershell -Command "Clear-Host"
goto menu


REM Assistência Rápida
:programa1
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Temp\Assistência Rápida Installer.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM 7-Zip
:programa2
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Temp\7z2409-x64.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação Zscaler
:programa3
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Zscaler\Zscaler-4.5.0.296-installer-x64.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação Notepad + + 7.8
:programa4
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Notepad ++ 7.8\Notepad ++ 8.1.9.2.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação Lighshot
:programa5
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\LIGHTSHOT\setup-lightshot 5.5.0.7.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação FlirTools 6.4
:programa6
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\flir tools ATUALIZADO6.4 (6.4.18039.1003)\FLIR TOOLS\FLIR Tools.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação Fluke Battery Manager 1.5.63
:programa7
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Fluke\Fluke_Battery_Management_1_5_63.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação Fluke Battery Manager 1.6.0.1
:programa8
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Fluke\BatteryManagement_v1.6.0.1.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação do DWG True Viewer 2025 - EN
:programa9
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\DWG TrueView 2025 - English - (EN)\Setup.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação do AutoCAD 2025 - EN
:programa10
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Autocad 2025\Create_Installer_ACD_2025_1_English_WIN64.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação do AutoCAD 2025 - PT_BR
:programa11
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Autocad 2025\Create_Installer_ACD_2025_1_Portuguese_WIN64.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação do Bizagi 4.0.0155
:programa12
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Bizagi\BizagiModelerSetup_4.0.0155.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM Instalação do Bizagi 4.2.0.003
:programa13
echo Iniciando Instalacao..
powershell -Command "Start-Process -FilePath '\\10.128.1.60\Softwares\SOFTWARES\Bizagi\BizagiModelerSetup_4.2.0.003.exe' -Verb RunAs"
echo Retornando ao Menu de Programas..
powershell -Command "Clear-Host"
goto opcao6


REM mapimpressoras de Discos
:opcao7
powershell -Command "Clear-Host"
echo.
echo =============================================================================
echo *  1. Fortaleza                                                             *
echo *  2. Recife                                                                *
echo *  3. Sobradinho                                                            *
echo *  4. Salvador                                                              *
echo *  5. Teresina                                                              *
echo *  6. Paulo Afonso                                                          *
echo =============================================================================
echo.

set /p mapeamento= Digite a opcao desejada:  
echo ============================================================================

if %mapeamento% equ 0 goto mapeamento0
if %mapeamento% equ 1 goto mapeamento1
if %mapeamento% equ 2 goto mapeamento2
if %mapeamento% equ 3 goto mapeamento3
if %mapeamento% equ 4 goto mapeamento4
if %mapeamento% equ 5 goto mapeamento5
if %mapeamento% equ 6 goto mapeamento6


:mapeamento0
powershell -Command "Clear-Host"
goto menu


REM Mapemanto Fortaleza
:mapeamento1
echo Iniciando Mapeamento Fortaleza..
powershell -Command "Start-Process -FilePath '\\corp.eletrobras\netlogon\ELETROBRAS-CHESF\ftz.bat' -Verb RunAs"
echo Retornando ao Menu de mapimpressoras..
powershell -Command "Clear-Host"
goto menu


REM Mapemanto Recife
:mapeamento2
echo Iniciando Mapeamento Recife..
powershell -Command "Start-Process -FilePath '\\corp.eletrobras\netlogon\ELETROBRAS-CHESF\rec.bat' -Verb RunAs"
echo Retornando ao Menu de mapimpressoras..
powershell -Command "Clear-Host"
goto menu


REM Mapemanto Sobradinho
:mapeamento3
echo Iniciando Mapeamento Sobradinho..
powershell -Command "Start-Process -FilePath '\\corp.eletrobras\netlogon\ELETROBRAS-CHESF\sob.bat' -Verb RunAs"
echo Retornando ao Menu de mapimpressoras..
powershell -Command "Clear-Host"
goto menu


REM Mapemanto Salvador
:mapeamento4
echo Iniciando Mapeamento Salvador..
powershell -Command "Start-Process -FilePath '\\corp.eletrobras\netlogon\ELETROBRAS-CHESF\ssa.bat' -Verb RunAs"
echo Retornando ao Menu de mapimpressoras..
powershell -Command "Clear-Host"
goto menu


REM Mapemanto Teresina
:mapeamento5
echo Iniciando Mapeamento Teresina..
powershell -Command "Start-Process -FilePath '\\corp.eletrobras\netlogon\ELETROBRAS-CHESF\tsa.bat' -Verb RunAs"
echo Retornando ao Menu de mapimpressoras..
powershell -Command "Clear-Host"
goto menu


REM Mapemanto Paulo Afonso
:mapeamento6
echo Iniciando Mapeamento Paulo Afonso..
powershell -Command "Start-Process -FilePath '\\corp.eletrobras\netlogon\ELETROBRAS-CHESF\paf.bat' -Verb RunAs"
echo Retornando ao Menu de mapimpressoras..
powershell -Command "Clear-Host"
goto menu


REM Verificação e Limpeza de Vírus/Malware
:opcao8
echo Inicializando a Verificacaoo de Virus/Malware
powershell -Command "Update-MpSignature; Start-MpScan -ScanType FullScan"
echo Retornando ao Menu Principal..
powershell -Command "Clear-Host"
goto menu