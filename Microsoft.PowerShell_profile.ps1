# Powerhsell 꾸미기
oh-my-posh init pwsh --config "C:\Users\$env:USERNAME\.config\oh-my-posh\iterm2.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Claude Code 단축 명령
function cc { claude --dangerously-skip-permissions @args }