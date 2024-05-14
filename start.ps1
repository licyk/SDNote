python -V > $null
if ($? -eq 0){
   Write-Host "δ�ҵ� Python����ֹ����"
   pause
   exit 1
}

python -m pip -V > $null
if ($? -eq 0){
   Write-Host "δ�ҵ� Python Pip ģ�飬��ֹ����"
   pause
   exit 1
}

python -c "import venv" > $null
if ($? -eq 0){
   Write-Host "δ�ҵ� Python venv ģ�飬��ֹ����"
   pause
   exit 1
}

if (-not (Test-Path .\venv\Scripts\activate.ps1)) {
   Write-Host "δ�ҵ����⻷��"
   Write-Host "�������⻷����..."
   python -m venv venv
}

.\venv\Scripts\activate.ps1

if (-not (Test-Path .\venv\Scripts\mkdocs.exe)) {
   Write-Host "��װ MKDocs ��..."
   python -m pip install -r requirements.txt --index-url https://mirror.baidu.com/pypi/simple
   if ($? -eq 0){
      Write-Host "��װ MKDocs ʧ�ܣ���ֹ����"
      pause
      exit 1
   }
}

switch ($args) {
   "--update" {
       Write-Host "���� MKDocs ��..."
       python -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
       if ($LastExitCode -ne 0) {
           Write-Host "���� MKDocs ʧ��"
       }
   }
}

Write-Host "���� MKDocs ��..."
mkdocs serve

pause