$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot

# 1) oh-my-posh 설치 + PATH 새로고침
winget install JanDeDobbeleer.OhMyPosh -s winget --accept-package-agreements --accept-source-agreements
$env:Path = [Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [Environment]::GetEnvironmentVariable('Path','User')

# 2) Terminal-Icons 모듈, Nerd Font 설치
Install-Module Terminal-Icons -Scope CurrentUser -Force
oh-my-posh font install meslo

# 3) 테마 복사
$themeDir = "$HOME\.config\oh-my-posh"
New-Item -ItemType Directory -Force $themeDir | Out-Null
Copy-Item "$repo\iterm2.omp.json" $themeDir -Force

# 4) 프로필 복사 (기존 프로필은 .bak으로 백업)
New-Item -ItemType Directory -Force (Split-Path $PROFILE) | Out-Null
if (Test-Path $PROFILE) { Copy-Item $PROFILE "$PROFILE.bak" -Force }
Copy-Item "$repo\Microsoft.PowerShell_profile.ps1" $PROFILE -Force

Write-Host "완료! 터미널 글꼴을 'MesloLGM Nerd Font'로 바꾸고 새 창을 여세요." -ForegroundColor Green