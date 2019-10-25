@echo off
@title extract_win10_lock_screen_picture

:: ------------------------------
:: language_begin
:: ------------------------------

rem English 
set LANGUAGE_FOLDER_ALREADY_EXIST=already exist

rem 简体中文
set LANGUAGE_FOLDER_ALREADY_EXIST_ZH_CN=目录已存在！
set LANGUAGE_CREATE_FOLDER_ZH_CN=创建文件夹：
set LANGUAGE_COPY_LOCK_SCREEN_FILE_START_ZH_CN=开始复制锁屏图片文件：
set LANGUAGE_COPY_LOCK_SCREEN_FILE_END_ZH_CN=全部复制完成！
set LANGUAGE_RENAME_FILE_PATH_ZH_CN=修改文件后缀为PNG的路径：
set LANGUAGE_RENAME_FINISH_ZH_CN=文件重命名完成！
set LANGUAGE_DELETE_REMAIN_PNG_FILES_ZH_CN=执行删除多余PNG文件
set LANGUAGE_DELETE_FINISH_ZH_CN=删除完成！

set FOLDER_COLLECTION_NAME=已收藏

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