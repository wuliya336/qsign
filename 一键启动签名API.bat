%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a  
cls 
@echo off
rem 关闭回显，不显示命令本身
setlocal
rem 开启延迟扩展，允许在循环中更新变量的值
setlocal enabledelayedexpansion
rem 版本号
set var=1.0
rem 作者
set author=wuliya
rem 协议目录
set "library=txlib\"
rem 设置背景颜色为黑色,前景为绿色
color 02
rem 设置标题
title 签名API by wuliya
rem 延迟一秒
timeout /t 1 /nobreak >nul
rem 输出文字
echo 正在加载中,请稍候...
rem 延迟三秒
timeout /t 3 /nobreak >nul
rem 清理终端
cls
if not exist "txlib_version.json" (
	REM txlib_version_config_file does not exist.
) else ( 
for /F "delims=" %%D in ('lib\jq.exe -r ".txlib_version" txlib_version.json') do set "txlib_version=%%D" 
)
set "json_file=%library%%txlib_version%/config.json"
rem 输出项目名称&版本信息&作者
echo "                _                 ";
echo "   __ _   ___  (_)   __ _   _ __  ";
echo "  / _` | / __| | |  / _` | | '_ \ ";
echo " | (_| | \__ \ | | | (_| | | | | |";
echo "  \__, | |___/ |_|  \__, | |_| |_|";
echo "     |_|            |___/         ";
echo "当前版本: %var%         作者: %author%";
rem 延迟两秒
timeout /t 2 /nobreak >nul
rem 检测是否安装了Java
java -version >nul 2>nul
rem 如果没有安装，则使用自带的Java文件
if %errorlevel% neq 0 (
    set set JAVA_HOME=.\jre
)
rem 如果已经安装，则不提示
if %errorlevel% equ 0 (
  rem 使用系统环境变量
)

if not exist "txlib_version.json" (
  echo -------------------------------------------------------------------------------------------------
  echo txlib版本配置文件不存在.
  echo 将新建配置文件.
  echo -------------------------------------------------------------------------------------------------
echo 请按需输入以下内容:
timeout /t 2 /nobreak >nul
rem 输入协议版本，如果为空则默认为8.9.96
set /p "txlib_version=协议版本txlib_version(默认:8.9.96): "
       if "!txlib_version!"=="" (
	   set "txlib_version=8.9.96"
       )  
rem 根据协议版本设置json文件的路径
set "json_file=%library%!txlib_version!\config.json"
rem 输入地址，如果为空则默认为127.0.0.1
set /p "host=host(默认:127.0.0.1): "
      if "!host!"=="" (
      set "host=127.0.0.1"
      )
rem 输入端口，如果为空则默认为8080
  set /p "port=port(默认:8080): "
      if "!port!"=="" (
      set "port=8080"
      )
rem 输入密钥，如果为空则默认为wuliya
  set /p "key=密钥key(默认:wuliya): "
      if "!key!"=="" (
      set "key=wuliya"
      )
rem 判断协议版本是否存在，如果不存在则提示错误并退出
if not exist "%library%!txlib_version!" (
  echo -------------------------------------------------------------------------------------------------
      echo 错误: 协议信息错误. 
      echo 请检查[txlib]文件夹!
      echo 以下是支持的 txlib 版本: 
      dir txlib /b /ad
  echo -------------------------------------------------------------------------------------------------
      timeout 10
      exit /b
  ) else (
  rem 如果协议版本存在，则从json文件中读取协议的相关信息，并赋值给相应的变量
      for /F "delims=" %%P in ('lib\jq.exe -r ".protocol.package_name" !json_file!') do set "p_package_name=%%P"
      for /F "delims=" %%Q in ('lib\jq.exe -r ".protocol.qua" !json_file!') do set "p_qua=%%Q"
      for /F "delims=" %%V in ('lib\jq.exe -r ".protocol.version" !json_file!') do set "p_version=%%V"
      for /F "delims=" %%O in ('lib\jq.exe -r ".protocol.code" !json_file!') do set "p_code=%%O"
  rem 根据输入的地址、端口、密钥和读取的协议信息，生成一个新的json对象，并输出到json文件中
        echo { "server": { "host": "!host!", "port": !port! }, "share_token": false, "count": 5, "key": "!key!", "auto_register": true, "protocol": { "package_name": "!p_package_name!", "qua": "!p_qua!", "version": "!p_version!", "code": "!p_code!" }, "unidbg": { "dynarmic": false, "unicorn": true, "kvm": true, "debug": false } } > "!json_file!"
  rem 输出协议版本到另一个json文件中
        echo {"txlib_version": "!txlib_version!"} > txlib_version.json
        echo 配置文件新增成功,请重启脚本
  )

) else (   
 rem 如果存在txlib_version.json文件，则从中读取协议版本，并设置json文件的路径
  for /F "delims=" %%D in ('lib\jq.exe -r ".txlib_version" txlib_version.json') do set "txlib_version=%%D"
  set "json_file=%library%!txlib_version!/config.json"
  echo -------------------------------------------------------------------------------------------------
  echo 协议版本: %txlib_version%
  echo 如果您想要更改协议版本,请删掉[txlib_version.json]文件后重新运行脚本.
  echo -------------------------------------------------------------------------------------------------
  rem 从json文件中读取地址、端口和密钥，并赋值给相应的变量
  for /F "delims=" %%A in ('lib\jq.exe -r ".server.host" %json_file%') do set "host=%%A"
  for /F "delims=" %%B in ('lib\jq.exe -r ".server.port" %json_file%') do set "port=%%B"
  for /F "delims=" %%C in ('lib\jq.exe -r ".key" %json_file%') do set "key=%%C"
)
rem 输出签名API的相关信息
echo -------------------------------------------------------------------------------------------------
echo 签名API地址:http://!host!:!port!
echo 密钥=!key!
echo 签名API脚本版本:%var%
echo 协议版本:%txlib_version% 
echo -------------------------------------------------------------------------------------------------
timeout /t 3 > nul
rem 检查curl命令是否安装在环境变量中，如果是则使用已安装的curl，否则使用lib文件夹中的curl.exe
where curl >nul 2>nul
echo 检查 curl 命令是否已安装在环境变量中...
if %errorlevel% equ 0 (
  echo 检测到 curl 命令，使用已安装的 curl
  set "curl_command=curl"
) else (
  echo 检测不到 curl 命令，使用 lib 文件夹中的 "curl.exe".
  set "curl_command=lib\curl.exe"
)

:loop
rem 使用curl命令检测签名API是否运行，如果是则提示运行状态，并延迟30秒后继续检测
%curl_command% -I http://!host!:!port!/register?uin=12345678 --connect-timeout 5 -m 5 >nul 2>nul
if %errorlevel% equ 0 (
    echo 签名API正在运行中...
    timeout /t 30 /nobreak >nul
    goto loop
) else (
rem 如果签名API没有运行，则提示重启状态，并尝试结束之前的进程并重新启动
    echo 签名API不在运行,重启中...
    if defined pid (
      tasklist /fi "PID eq !pid!" | findstr /i "!pid!" >nul
        if %errorlevel% equ 0 (
          taskkill /F /PID !pid!))
    start "签名API by wuliya" cmd /c "color 02 & bin\unidbg-fetch-qsign --basePath=%library%%txlib_version%"
    timeout /t 15 /nobreak >nul
    rem 获取签名API的进程ID，并输出
    for /f "tokens=5" %%A in ('netstat -ano ^| findstr ":!port!.*LISTENING"') do (
      set "pid=%%A")
    echo 签名API运行在PID:!pid!的进程上.
    goto loop
)
