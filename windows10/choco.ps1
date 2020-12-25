Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install 1password autohotkey ddu discord firefox gpu-z hwinfo livesplit logitech-options mobaxterm obs openjdk prime95 sublimetext3 sumatrapdf teamspeak thunderbird vlc youtube-dl
