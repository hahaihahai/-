@echo off  
REM 读取配置文件  
for /f "tokens=1,2 delims==" %%a in (config.txt) do (  
    set "%%a=%%b"  
)  

REM 进入图片目录  
cd %input_dir%  

REM 拼接图片  
if "%layout%"=="vertical" (  
    magick *.* -append %output_file%  
) else (  
    magick *.* +append %output_file%  
) 
echo 已经在当前目录下输出图片
echo 是否删除image文件夹内图片？
del * -f
echo 图片合成完成！
cd ..  ::回到主目录

if %compression%=="true" (
    magick result.jpg -quality 60  result.jpg  #压缩质量为60
    REM 本来压缩应该用%output_file% 的。但是报错，故写死，望周知。
    echo 图片压缩完成！
)else(
    echo 未压缩图片
)
pause