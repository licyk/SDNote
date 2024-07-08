python -V > $null
if ($? -eq 0){
   Write-Host "未找到 Python，终止运行"
   pause
   exit 1
}

python -c "import pip" > $null
if ($? -eq 0){
   Write-Host "未找到 Python Pip 模块，终止运行"
   pause
   exit 1
}

python -c "import venv" > $null
if ($? -eq 0){
   Write-Host "未找到 Python venv 模块，终止运行"
   pause
   exit 1
}

if (-not (Test-Path .\venv\Scripts\activate.ps1)) {
   Write-Host "未找到虚拟环境"
   Write-Host "创建虚拟环境中..."
   python -m venv venv
}

.\venv\Scripts\activate.ps1

if (-not (Test-Path .\venv\Scripts\mkdocs.exe)) {
   Write-Host "安装 MKDocs 中..."
   python -m pip install -r requirements.txt --index-url https://mirror.baidu.com/pypi/simple
   if ($? -eq 0){
      Write-Host "安装 MKDocs 失败，终止运行"
      pause
      exit 1
   }
}

switch ($args) {
   "--update" {
       Write-Host "更新 MKDocs 中..."
       python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
       if ($LastExitCode -ne 0) {
           Write-Host "更新 MKDocs 失败"
       }
   }
}

Write-Host "启动 MKDocs 中..."
mkdocs serve

Read-Host | Out-Null