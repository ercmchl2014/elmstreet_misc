## Download and install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y adobereader -params '"/EnableUpdateService /UpdateMode:4"'

choco install -y googlechrome firefox slack zoom google-drive-file-stream teamviewer.host