%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a  
cls 
@echo off 
cls 
color 2a 
:start 
cls 
echo ******************************************************************************* 
echo * * 
echo * BAT �� �� * 
echo * * 
echo ******************************************************************************* 
echo. 
echo. 
echo. 
echo �� ����һ���Գɹ������κ��������ļ�, ��ʡ��. 
echo. 
echo �� ������������������Ҫ���ܵ�������, ��������Ը���. 
echo. 
echo �� �ܹ��Զ��жϴ�������, �������Ի�. 
echo. 
echo ˵��: ������������Ҫ���ܵ��������ļ�, ֱ�������������ļ���Ϊ���ܵ�ǰĿ¼�µ�BAT,Ҳ���Դ�·��ָ������BAT. ��ǰĿ¼�����ɵ�encrypt.bat�ļ���Ϊ���ܵ�������. 
echo. 
echo. 
echo. 
set /p file=��������Ҫ���ܵ�������󰴻س���(q=�˳�): 
if "%file%"=="q" goto quit 
echo %file%|findstr /i "\.bat$">nul && goto go 
echo %file%|findstr /i "\.cmd$">nul && goto go 
cls 
echo ============== 
echo ����ȷ����! 
echo ============== 
echo. 
echo. 
echo ���������������...... 
pause>nul 
goto start 
:go 
if not exist "%file%" goto newly 
if exist encrypt.bat copy encrypt.bat encryptbak.bat 
echo %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a >"%tmp%\encrypt.tmp" 
echo cls>>"%tmp%\encrypt.tmp" 
type "%file%">>"%tmp%\encrypt.tmp" 
setlocal enabledelayedexpansion 
for %%i in ("%tmp%\encrypt.tmp") do ( 
echo %%~zi >nul 2>nul 
set size=%%~zi 
set num=!size:~-1! 
set /a mod=!num!%%2 
if !mod! equ 0 (goto even) else (goto odd) 
) 
:even 
copy "%tmp%\encrypt.tmp" encrypt.bat 
del "%tmp%\encrypt.tmp" 
cls 
echo ========================== 
echo ������������^_^! 
echo ========================== 
echo. 
echo. 
echo ��������˳�...... 
pause>nul 
goto quit 
:odd 
echo. >>"%tmp%\encrypt.tmp" 
copy "%tmp%\encrypt.tmp" encrypt.bat 
del "%tmp%\encrypt.tmp" 
cls 
echo ========================== 
echo ��ϲ��, ��������ܳɹ�^^! 
echo ========================== 
echo. 
echo. 
echo ��������˳�...... 
pause>nul 
goto quit 
:newly 
cls 
echo ================================ 
echo �Ҳ����������ļ�, ����������! 
echo ================================ 
echo. 
echo. 
echo ���������ʼ...... 
pause>nul 
goto start 
:quit 
exit
