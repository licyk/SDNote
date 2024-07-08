@echo off

python -V >NUL
if %ERRORLEVEL% NEQ 0 (
    echo 未找到 Python，终止运行
    pause
    exit /b
)

python -c "import pip" > $null
if %ERRORLEVEL% NEQ 0 (
    echo 未找到 Python Pip 模块，终止运行
    pause
    exit /b
)

python -c "import venv" >NUL
if %ERRORLEVEL% NEQ 0 (
    echo 未找到 Python venv 模块，终止运行
    pause
    exit /b
)

if not exist .\venv\Scripts\activate.bat (
    echo 未找到虚拟环境
    echo 创建虚拟环境中...
    python -m venv venv
)

call .\venv\Scripts\activate.bat

if not exist .\venv\Scripts\mkdocs.exe (
    echo 安装 MKDocs 中...
    python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
    if %ERRORLEVEL% NEQ 0 (
        echo 安装 MKDocs 失败，终止运行
        pause
        exit /b
    )
)

for %%a in (%*) do (
    if %%a == --update (
        echo 更新 MKDocs 中...
        python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
        if %ERRORLEVEL% NEQ 0 (
            echo 更新 MKDocs 失败
        )
    )
)

echo 启动 MKDocs 中...
mkdocs serve

pause
