%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a  
cls 
@echo off
rem �رջ��ԣ�����ʾ�����
setlocal
rem �����ӳ���չ��������ѭ���и��±�����ֵ
setlocal enabledelayedexpansion
rem �汾��
set var=1.0
rem ����
set author=wuliya
rem Э��Ŀ¼
set "library=txlib\"
rem ���ñ�����ɫΪ��ɫ,ǰ��Ϊ��ɫ
color 02
rem ���ñ���
title ǩ��API by wuliya
rem �ӳ�һ��
timeout /t 1 /nobreak >nul
rem �������
echo ���ڼ�����,���Ժ�...
rem �ӳ�����
timeout /t 3 /nobreak >nul
rem �����ն�
cls
if not exist "txlib_version.json" (
	REM txlib_version_config_file does not exist.
) else ( 
for /F "delims=" %%D in ('lib\jq.exe -r ".txlib_version" txlib_version.json') do set "txlib_version=%%D" 
)
set "json_file=%library%%txlib_version%/config.json"
rem �����Ŀ����&�汾��Ϣ&����
echo "                _                 ";
echo "   __ _   ___  (_)   __ _   _ __  ";
echo "  / _` | / __| | |  / _` | | '_ \ ";
echo " | (_| | \__ \ | | | (_| | | | | |";
echo "  \__, | |___/ |_|  \__, | |_| |_|";
echo "     |_|            |___/         ";
echo "��ǰ�汾: %var%         ����: %author%";
rem �ӳ�����
timeout /t 2 /nobreak >nul
rem ����Ƿ�װ��Java
java -version >nul 2>nul
rem ���û�а�װ����ʹ���Դ���Java�ļ�
if %errorlevel% neq 0 (
    set set JAVA_HOME=.\jre
)
rem ����Ѿ���װ������ʾ
if %errorlevel% equ 0 (
  rem ʹ��ϵͳ��������
)

if not exist "txlib_version.json" (
  echo -------------------------------------------------------------------------------------------------
  echo txlib�汾�����ļ�������.
  echo ���½������ļ�.
  echo -------------------------------------------------------------------------------------------------
echo �밴��������������:
timeout /t 2 /nobreak >nul
rem ����Э��汾�����Ϊ����Ĭ��Ϊ8.9.96
set /p "txlib_version=Э��汾txlib_version(Ĭ��:8.9.96): "
       if "!txlib_version!"=="" (
	   set "txlib_version=8.9.96"
       )  
rem ����Э��汾����json�ļ���·��
set "json_file=%library%!txlib_version!\config.json"
rem �����ַ�����Ϊ����Ĭ��Ϊ127.0.0.1
set /p "host=host(Ĭ��:127.0.0.1): "
      if "!host!"=="" (
      set "host=127.0.0.1"
      )
rem ����˿ڣ����Ϊ����Ĭ��Ϊ8080
  set /p "port=port(Ĭ��:8080): "
      if "!port!"=="" (
      set "port=8080"
      )
rem ������Կ�����Ϊ����Ĭ��Ϊwuliya
  set /p "key=��Կkey(Ĭ��:wuliya): "
      if "!key!"=="" (
      set "key=wuliya"
      )
rem �ж�Э��汾�Ƿ���ڣ��������������ʾ�����˳�
if not exist "%library%!txlib_version!" (
  echo -------------------------------------------------------------------------------------------------
      echo ����: Э����Ϣ����. 
      echo ����[txlib]�ļ���!
      echo ������֧�ֵ� txlib �汾: 
      dir txlib /b /ad
  echo -------------------------------------------------------------------------------------------------
      timeout 10
      exit /b
  ) else (
  rem ���Э��汾���ڣ����json�ļ��ж�ȡЭ��������Ϣ������ֵ����Ӧ�ı���
      for /F "delims=" %%P in ('lib\jq.exe -r ".protocol.package_name" !json_file!') do set "p_package_name=%%P"
      for /F "delims=" %%Q in ('lib\jq.exe -r ".protocol.qua" !json_file!') do set "p_qua=%%Q"
      for /F "delims=" %%V in ('lib\jq.exe -r ".protocol.version" !json_file!') do set "p_version=%%V"
      for /F "delims=" %%O in ('lib\jq.exe -r ".protocol.code" !json_file!') do set "p_code=%%O"
  rem ��������ĵ�ַ���˿ڡ���Կ�Ͷ�ȡ��Э����Ϣ������һ���µ�json���󣬲������json�ļ���
        echo { "server": { "host": "!host!", "port": !port! }, "share_token": false, "count": 5, "key": "!key!", "auto_register": true, "protocol": { "package_name": "!p_package_name!", "qua": "!p_qua!", "version": "!p_version!", "code": "!p_code!" }, "unidbg": { "dynarmic": false, "unicorn": true, "kvm": true, "debug": false } } > "!json_file!"
  rem ���Э��汾����һ��json�ļ���
        echo {"txlib_version": "!txlib_version!"} > txlib_version.json
        echo �����ļ������ɹ�,�������ű�
  )

) else (   
 rem �������txlib_version.json�ļ�������ж�ȡЭ��汾��������json�ļ���·��
  for /F "delims=" %%D in ('lib\jq.exe -r ".txlib_version" txlib_version.json') do set "txlib_version=%%D"
  set "json_file=%library%!txlib_version!/config.json"
  echo -------------------------------------------------------------------------------------------------
  echo Э��汾: %txlib_version%
  echo �������Ҫ����Э��汾,��ɾ��[txlib_version.json]�ļ����������нű�.
  echo -------------------------------------------------------------------------------------------------
  rem ��json�ļ��ж�ȡ��ַ���˿ں���Կ������ֵ����Ӧ�ı���
  for /F "delims=" %%A in ('lib\jq.exe -r ".server.host" %json_file%') do set "host=%%A"
  for /F "delims=" %%B in ('lib\jq.exe -r ".server.port" %json_file%') do set "port=%%B"
  for /F "delims=" %%C in ('lib\jq.exe -r ".key" %json_file%') do set "key=%%C"
)
rem ���ǩ��API�������Ϣ
echo -------------------------------------------------------------------------------------------------
echo ǩ��API��ַ:http://!host!:!port!
echo ��Կ=!key!
echo ǩ��API�ű��汾:%var%
echo Э��汾:%txlib_version% 
echo -------------------------------------------------------------------------------------------------
timeout /t 3 > nul
rem ���curl�����Ƿ�װ�ڻ��������У��������ʹ���Ѱ�װ��curl������ʹ��lib�ļ����е�curl.exe
where curl >nul 2>nul
echo ��� curl �����Ƿ��Ѱ�װ�ڻ���������...
if %errorlevel% equ 0 (
  echo ��⵽ curl ���ʹ���Ѱ�װ�� curl
  set "curl_command=curl"
) else (
  echo ��ⲻ�� curl ���ʹ�� lib �ļ����е� "curl.exe".
  set "curl_command=lib\curl.exe"
)

:loop
rem ʹ��curl������ǩ��API�Ƿ����У����������ʾ����״̬�����ӳ�30���������
%curl_command% -I http://!host!:!port!/register?uin=12345678 --connect-timeout 5 -m 5 >nul 2>nul
if %errorlevel% equ 0 (
    echo ǩ��API����������...
    timeout /t 30 /nobreak >nul
    goto loop
) else (
rem ���ǩ��APIû�����У�����ʾ����״̬�������Խ���֮ǰ�Ľ��̲���������
    echo ǩ��API��������,������...
    if defined pid (
      tasklist /fi "PID eq !pid!" | findstr /i "!pid!" >nul
        if %errorlevel% equ 0 (
          taskkill /F /PID !pid!))
    start "ǩ��API by wuliya" cmd /c "color 02 & bin\unidbg-fetch-qsign --basePath=%library%%txlib_version%"
    timeout /t 15 /nobreak >nul
    rem ��ȡǩ��API�Ľ���ID�������
    for /f "tokens=5" %%A in ('netstat -ano ^| findstr ":!port!.*LISTENING"') do (
      set "pid=%%A")
    echo ǩ��API������PID:!pid!�Ľ�����.
    goto loop
)
