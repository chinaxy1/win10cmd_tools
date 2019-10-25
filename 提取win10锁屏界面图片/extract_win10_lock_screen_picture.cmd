@echo off
@title extract_win10_lock_screen_picture

:: ------------------------------
:: language_begin
:: ------------------------------

rem English 
set LANGUAGE_FOLDER_ALREADY_EXIST=already exist

rem ��������
set LANGUAGE_FOLDER_ALREADY_EXIST_ZH_CN=Ŀ¼�Ѵ��ڣ�
set LANGUAGE_CREATE_FOLDER_ZH_CN=�����ļ��У�
set LANGUAGE_COPY_LOCK_SCREEN_FILE_START_ZH_CN=��ʼ��������ͼƬ�ļ���
set LANGUAGE_COPY_LOCK_SCREEN_FILE_END_ZH_CN=ȫ��������ɣ�
set LANGUAGE_RENAME_FILE_PATH_ZH_CN=�޸��ļ���׺ΪPNG��·����
set LANGUAGE_RENAME_FINISH_ZH_CN=�ļ���������ɣ�
set LANGUAGE_DELETE_REMAIN_PNG_FILES_ZH_CN=ִ��ɾ������PNG�ļ�
set LANGUAGE_DELETE_FINISH_ZH_CN=ɾ����ɣ�

set FOLDER_COLLECTION_NAME=���ղ�

:: ------------------------------
:: language_end
:: ------------------------------



:: ------------------------------
:: main_begin
:: ------------------------------

set PIC_PATH=D:\Pictures\Assets

if exist %PIC_PATH% (
	call:logger.warn %PIC_PATH%%LANGUAGE_FOLDER_ALREADY_EXIST_ZH_CN%
) else (
	call:logger.info %LANGUAGE_CREATE_FOLDER_ZH_CN%%PIC_PATH%
	md %PIC_PATH%
)

call:logger.info %LANGUAGE_COPY_LOCK_SCREEN_FILE_START_ZH_CN%
xcopy %HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets D:\Pictures\Assets /e
call:logger.info %LANGUAGE_COPY_LOCK_SCREEN_FILE_END_ZH_CN%

cd /d %PIC_PATH%
rem if not exist %FOLDER_COLLECTION_NAME% md %FOLDER_COLLECTION_NAME%

call:logger.info %LANGUAGE_RENAME_FILE_PATH_ZH_CN%%PIC_PATH%
ren *.* *.png
call:logger.info %LANGUAGE_RENAME_FINISH_ZH_CN%

start .

pause

rem call:logger.warn %LANGUAGE_DELETE_REMAIN_PNG_FILES_ZH_CN%
rem del /q %PIC_PATH%\*.png
rem call:logger.warn %LANGUAGE_DELETE_FINISH_ZH_CN%

:: ------------------------------
:: main_end
:: ------------------------------



:: ------------------------------
:: method_begin
:: ------------------------------

:logger.info
echo [INFO] %1
echo;
goto:eof

:logger.warn
echo [WARN] %1
echo;
goto:eof

:func.judgeLanguage
rem dism /online /get-intl
goto:eof

:: ------------------------------
:: method_end
:: ------------------------------