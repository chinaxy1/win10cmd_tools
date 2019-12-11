@echo off
@title switch_win10_hyper_v_mode

:: ------------------------------
:: 解决古剑奇谭3在win10专业版打开时
:: 出现不能运行在虚拟机环境下的问题
:: （注：需要以管理员身份运行该CMD）
:: ------------------------------

rem 是否展示当前bcdedit配置，默认否
rem call:showCurrentBcd

:main
echo 请选择： 1. 关闭Hyper-V；  2：恢复BCD启动项
echo;

set /p input=您的选项为：

if %input% equ 1 (
    call:closeHyperV
) else if %input% equ 2 (
    call:resetBcdConfig
) else (
    echo 没有这个选项！:(
    echo;
    goto:main
)

echo;
echo 请重启电脑以生效操作！
echo;

rem call:reboot
pause
goto:eof

:: ------------------------------
:: method_begin
:: ------------------------------

:showCurrentBcd
echo 当前本机的BCDEDIT首选项配置为：
echo;
bcdedit /v
echo;
goto:eof

:closeHyperV
bcdedit /set hypervisorlaunchtype Off
goto:eof


:resetBcdConfig
bcdedit /set hypervisorlaunchtype Auto
goto:eof

:reboot
set /p select=是否现在重启电脑？(Y/N)：
if /i "%select%"=="Y" (
    shutdown -r -t 0
) else (
    echo;
)
goto:eof

:: ------------------------------
:: method_end
:: ------------------------------