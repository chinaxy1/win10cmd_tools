@echo off
@title switch_win10_hyper_v_mode

:: ------------------------------
:: ����Ž���̷3��win10רҵ���ʱ
:: ���ֲ�������������������µ�����
:: ��ע����Ҫ�Թ���Ա������и�CMD��
:: ------------------------------

rem �Ƿ�չʾ��ǰbcdedit���ã�Ĭ�Ϸ�
rem call:showCurrentBcd

:main
echo ��ѡ�� 1. �ر�Hyper-V��  2���ָ�BCD������
echo;

set /p input=����ѡ��Ϊ��

if %input% equ 1 (
    call:closeHyperV
) else if %input% equ 2 (
    call:resetBcdConfig
) else (
    echo û�����ѡ�:(
    echo;
    goto:main
)

echo;
echo ��������������Ч������
echo;

rem call:reboot
pause
goto:eof

:: ------------------------------
:: method_begin
:: ------------------------------

:showCurrentBcd
echo ��ǰ������BCDEDIT��ѡ������Ϊ��
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
set /p select=�Ƿ������������ԣ�(Y/N)��
if /i "%select%"=="Y" (
    shutdown -r -t 0
) else (
    echo;
)
goto:eof

:: ------------------------------
:: method_end
:: ------------------------------