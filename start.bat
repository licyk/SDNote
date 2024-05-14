@echo off

python -V >NUL
if %ERRORLEVEL% NEQ 0 (
    echo δ�ҵ� Python����ֹ����
    pause
    exit /b
)

python -m pip -V >NUL
if %ERRORLEVEL% NEQ 0 (
    echo δ�ҵ� Python Pip ģ�飬��ֹ����
    pause
    exit /b
)

python -c "import venv" >NUL
if %ERRORLEVEL% NEQ 0 (
    echo δ�ҵ� Python venv ģ�飬��ֹ����
    pause
    exit /b
)

if not exist .\venv\Scripts\activate.bat (
    echo δ�ҵ����⻷��
    echo �������⻷����...
    python -m venv venv
)

call .\venv\Scripts\activate.bat

if not exist .\venv\Scripts\mkdocs.exe (
    echo ��װ MKDocs ��...
    python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
    if %ERRORLEVEL% NEQ 0 (
        echo ��װ MKDocs ʧ�ܣ���ֹ����
        pause
        exit /b
    )
)

for %%a in (%*) do (
    if %%a == --update (
        echo ���� MKDocs ��...
        python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
        if %ERRORLEVEL% NEQ 0 (
            echo ���� MKDocs ʧ��
        )
    )
)

echo ���� MKDocs ��...
mkdocs serve

pause
