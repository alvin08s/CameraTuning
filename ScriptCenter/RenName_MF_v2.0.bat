:: #########################################################################
:: # File Name      : simulation.sh
:: # Author         : Alvin
:: # mail           : shiyunfengchn@126.com
:: # Created Time   : Thu 20 Feb 2019 09:46:02 AM CST
:: # Version        : Ver2.1
:: #########################################################################

@echo off

REM 后续命令使用的是：UTF-8编码
@chcp 65001

setlocal EnableDelayedExpansion
:: If you want to change other format file name,just change below variable 
::set imageFormat=raw

echo 请选择你要重命名的图片格式:
echo   1.raw
echo   2.yuv
echo   3.jpg
set /p select_num=请选择你要重命名的图片格式:

if '%select_num%' EQU '1' (
    set imageFormat=raw
    ) else (
        if '%select_num%' EQU '2' (
            set imageFormat=yuv
            ) else (
                if '%select_num%' EQU '3' (
                    set imageFormat=jpg
                ) else (
                    goto end
                )
            )
        )

echo 需要重命名的文件后缀名为：%imageFormat%

if exist *.%imageFormat% (
    echo 找到相关的文件，列表如下：
    dir /b *.%imageFormat%
) else (
    echo 未找到对应后后缀名的文件，程序将在三秒后自动退出
    timeout /t 3
    @exit
)

:: Do not change below message
set /p fileName=请输入新的文件名(重命名之后，文件末尾会从"_0"开始):
set /a var=0

if defined fileName (
	for /f %%i in ('dir /b *.%imageFormat%') do (
		::call echo ren %%i !fileName!_!var!.%imageFormat%
        call ren %%i !fileName!_!var!.%imageFormat%
        set /a var += 1
    )
    echo "文件重命名成功，该程序将在3秒后退出"
) else (
    echo "Nothing to do"
)

timeout /t 3
@exit

:end
echo "选择有误，程序将在3秒后退出"
timeout /t 3
@exit

