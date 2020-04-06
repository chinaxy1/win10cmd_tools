@echo off
@title switch_csgo_audio_language_and_violence
setlocal EnableDelayedExpansion

:: ------------------------------
:: �л�csgo���ߵ����Ժͱ���Ч��
:: ------------------------------

:: ��������
set CSGO_INSTALL_PATH=F:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive


:main
if defined CSGO_INSTALL_PATH (
	cd /d "%CSGO_INSTALL_PATH%\csgo\"
	call:isRevertAudioEnglish
	call:isRevertHighViolence
	echo ==================================
	echo;
	echo   ��ǰ��Ϸ�����ߵ�����Ϊ��!var_audioLanguage!
	echo   ��ǰ��Ϸ��������Ч��Ϊ��!var_violence!
	echo;
	echo ==================================

	rem �����˵�
	call:menu
	
) else (
	call:findCsgoInstallPath
	goto:main
)
goto:eof


:menu
echo;
echo ��ѡ����Ҫ�Ĳ����� 	
echo 	1. �л����ߵ�����
echo 	2. �л�����Ч��	
echo 	3. �˳�
echo;

set /p input=����ѡ��Ϊ��

if %input% equ 1 (
	if "!var_audioLanguage!"=="����" (
		call:revertEnglishAudioAndBackupChinese
	) else (
		if "!var_audioLanguage!"=="Ӣ��" (
			call:isAudioChineseBackupFileExist
			if "!var_isAudioChineseBackupFileExist!"=="true" (
				call:changeAudioChinese
			) else (
				echo;
				goto:main
			)
		)
	)
) else (
	if %input% equ 2 (
		if "!var_violence!"=="��г��" (
			call:revertHighViolenceAndBackupLowViolence
		) else (
			if "!var_violence!"=="ԭ��" (
				call:isLowViolenceBackupFileExist
				if "!var_isLowViolenceBackupFileExist!"=="true" (
					call:changeLowViolence
				) else (
					echo;
					goto:main
				)
			)
		)
	) else (
		if %input% equ 3 (
			goto:eof
		) else (
			echo û�����ѡ�:(
			echo;
			goto:menu
		)
	)
)
cls
goto:main


rem �Զ�����CSGO��װ·��
:findCsgoInstallPath
echo;
goto:eof


rem ����Ƿ��ѻ�ԭӢ������
:isRevertAudioEnglish
if not exist .\pakxv_audiochinese_*.vpk (
	set var_audioLanguage=Ӣ��
) else (
	set var_audioLanguage=����
)
goto:eof


rem ����Ƿ��ѻ�ԭ����Ч��
:isRevertHighViolence
if not exist .\pakxv_perfectworld_*.vpk (
	set var_violence=ԭ��
) else (
	set var_violence=��г��
)
goto:eof


rem ����������������ļ��Ƿ����
:isAudioChineseBackupFileExist
if exist .\backup\pakxv_audiochinese_*.vpk (
	set var_isAudioChineseBackupFileExist=true
) else (
	set var_isAudioChineseBackupFileExist=false
	echo;
	echo [WARN] ��������pakxv_audiochinese_*.vpk�ļ����ݲ����ڣ�
)
goto:eof


rem ����гЧ�������ļ��Ƿ����
:isLowViolenceBackupFileExist
if exist .\backup\pakxv_perfectworld_*.vpk (
	set var_isLowViolenceBackupFileExist=true
) else (
	set var_isLowViolenceBackupFileExist=false
	echo;
	echo [WARN] ʯ��Ч��pakxv_perfectworld_*.vpk�ļ����ݲ����ڣ�
)
goto:eof


rem ��ԭӢ������
:revertEnglishAudioAndBackupChinese
if not exist .\backup md backup
move>nul 2>nul .\pakxv_audiochinese_*.vpk .\backup\
goto:eof


rem ��ԭ����Ч��
:revertHighViolenceAndBackupLowViolence
if not exist .\backup md backup
move>nul 2>nul .\pakxv_perfectworld_*.vpk .\backup\
move>nul 2>nul .\pakxv_lowviolence_*.vpk .\backup\
goto:eof


rem ������������
:changeAudioChinese
move>nul 2>nul .\backup\pakxv_audiochinese_*.vpk .\
goto:eof


rem ���ع���ʯ��Ч��
:changeLowViolence
move>nul 2>nul .\backup\pakxv_perfectworld_*.vpk .\
move>nul 2>nul .\backup\pakxv_lowviolence_*.vpk .\
goto:eof