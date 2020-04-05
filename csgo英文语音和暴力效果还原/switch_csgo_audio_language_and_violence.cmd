@echo off
@title switch_csgo_audio_language_and_violence
setlocal enabledelayedexpansion

:: ------------------------------
:: 切换csgo无线电语言和暴力效果
:: ------------------------------

:: 变量配置
set CSGO_INSTALL_PATH=F:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive
set var_audioLanguage=
set var_violence=
set var_isAudioChineseBackupFileExist=
set var_isLowViolenceBackupFileExist=

:main
if defined CSGO_INSTALL_PATH (
	cd /d "%CSGO_INSTALL_PATH%\csgo\"
	call:isRevertAudioEnglish
	call:isRevertHighViolence
	echo 当前游戏的无线电语音为：%var_audioLanguage%
	echo 当前游戏暴力表现效果为：%var_violence%
	
	rem 操作菜单
	call:menu
) else (
	call:findCsgoInstallPath
	goto:main
)
pause
goto:eof


:menu
echo;
echo 请选择需要的操作： 	
echo 	1. 切换无线电语言
echo 	2. 切换暴力效果	
echo 	3. 退出
echo;
set /p input=您的选项为：

if %input% equ 1 (
	if %var_audioLanguage% == 中文 (
		call:revertEnglishAudioAndBackupChinese
	) else if %var_audioLanguage% == 英文 (
		call:isAudioChineseBackupFileExist
		if %var_isAudioChineseBackupFileExist% == "true" (
			call:changeAudioChinese
		)
	)
) else if %input% equ 2 (
	if %var_violence% == 和谐版 (
		call:revertHighViolenceAndBackupLowViolence
	) else if %var_violence% == 原版 (
		call:isLowViolenceBackupFileExist
		if %var_isLowViolenceBackupFileExist% == "true" (
			call:changeLowViolence
		)
	)
) else if %input% equ 3 (
	::
) else (
	echo 没有这个选项！_(:з」∠)_
	echo;
	goto:menu
)
goto:eof


rem 自动查找CSGO安装路径
:findCsgoInstallPath

goto:eof


rem 检查是否已还原英文语音
:isRevertAudioEnglish
if not exist .\pakxv_audiochinese_*.vpk (
	set %var_audioLanguage% = 英文
) else (
	set %var_audioLanguage% = 中文
)
goto:eof


rem 检查是否已还原暴力效果
:isRevertHighViolence
if not exist .\pakxv_perfectword_*.vpk (
	set var_violence = 原版
) else (
	set var_violence = 和谐版
)
goto:eof


rem 检查中文语音备份文件是否存在
:isAudioChineseBackupFileExist
if exist .\backup\pakxv_audiochinese_*.vpk (
	set var_isAudioChineseBackupFileExist = "true"
) else (
	set var_isAudioChineseBackupFileExist = "false"
	echo [WARN] 中文语音pakxv_audiochinese_*.vpk文件备份不存在！
)
goto:eof


rem 检查和谐效果备份文件是否存在
:isLowViolenceBackupFileExist
if exist .\backup\pakxv_perfectword_*.vpk (
	set var_isLowViolenceBackupFileExist = "true"
) else (
	set var_isLowViolenceBackupFileExist = "false"
	echo [WARN] 石油效果pakxv_perfectword_*.vpk文件备份不存在！
)
goto:eof


rem 还原英文语音
:revertEnglishAudioAndBackupChinese
if not exist .\backup md backup
move .\pakxv_audiochinese_*.vpk .\backup\
goto:eof


rem 还原暴力效果
:revertHighViolenceAndBackupLowViolence
if not exist .\backup md backup
move .\pakxv_perfectword_*.vpk .\backup\
move .\pakxv_lowviolence_*.vpk .\backup\
goto:eof


rem 换回中文语音
:changeAudioChinese
move .\backup\pakxv_audiochinese_*.vpk .\
goto:eof


rem 换回国服石油效果
:changeLowViolence
move .\backup\pakxv_perfectword_*.vpk .\
move .\backup\pakxv_lowviolence_*.vpk .\
goto:eof