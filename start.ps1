锘縫ython -V > $null
if ($? -eq 0){
   Write-Host "未锟揭碉拷 Python锟斤拷锟斤拷止锟斤拷锟斤拷"
   pause
   exit 1
}

python -c "import pip" > $null
if ($? -eq 0){
   Write-Host "未锟揭碉拷 Python Pip 模锟介，锟斤拷止锟斤拷锟斤拷"
   pause
   exit 1
}

python -c "import venv" > $null
if ($? -eq 0){
   Write-Host "未锟揭碉拷 Python venv 模锟介，锟斤拷止锟斤拷锟斤拷"
   pause
   exit 1
}

if (-not (Test-Path .\venv\Scripts\activate.ps1)) {
   Write-Host "未锟揭碉拷锟斤拷锟解环锟斤拷"
   Write-Host "锟斤拷锟斤拷锟斤拷锟解环锟斤拷锟斤拷..."
   python -m venv venv
}

.\venv\Scripts\activate.ps1

if (-not (Test-Path .\venv\Scripts\mkdocs.exe)) {
   Write-Host "锟斤拷装 MKDocs 锟斤拷..."
   python -m pip install -r requirements.txt --index-url https://mirror.baidu.com/pypi/simple
   if ($? -eq 0){
      Write-Host "锟斤拷装 MKDocs 失锟杰ｏ拷锟斤拷止锟斤拷锟斤拷"
      pause
      exit 1
   }
}

switch ($args) {
   "--update" {
       Write-Host "锟斤拷锟斤拷 MKDocs 锟斤拷..."
       python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
       if ($LastExitCode -ne 0) {
           Write-Host "锟斤拷锟斤拷 MKDocs 失锟斤拷"
       }
   }
}

Write-Host "锟斤拷锟斤拷 MKDocs 锟斤拷..."
mkdocs serve

Read-Host | Out-Null