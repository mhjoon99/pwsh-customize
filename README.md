# pwsh-customize 😺

Windows PowerShell을 꾸미는 개인 설정 모음입니다.
[oh-my-posh](https://ohmyposh.dev/) 테마를 바탕으로, 프롬프트의 고양이 표정이 **git 상태에 따라 바뀌도록** 만들었습니다.

```
 ez   ~/dune/workspace/pwsh-customize  master  ?3                        14:40:05
😼
```

## 구성

| 파일 | 설명 |
|---|---|
| `Microsoft.PowerShell_profile.ps1` | PowerShell 프로필 (oh-my-posh, Terminal-Icons, PSReadLine 설정, `cc` 단축 명령) |
| `iterm2.omp.json` | oh-my-posh 테마 (`iterm2` 테마 기반 + git 상태 고양이) |
| `install.ps1` | 새 PC에 한 번에 적용하는 설치 스크립트 |

## 설치

```powershell
git clone https://github.com/mhjoon99/pwsh-customize.git
cd pwsh-customize
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

설치 스크립트가 하는 일은 다음과 같습니다.

1. `winget`으로 oh-my-posh를 설치합니다.
2. `Terminal-Icons` 모듈과 Meslo Nerd Font를 설치합니다.
3. 테마 파일을 `~\.config\oh-my-posh\`로 복사합니다.
4. 프로필을 `$PROFILE` 위치로 복사합니다. 기존 프로필은 `.bak`으로 백업됩니다.

설치가 끝나면 **Windows Terminal → 설정 → PowerShell → 모양 → 글꼴**을 `MesloLGM Nerd Font`로 바꾸고 새 창을 여세요.
글꼴을 바꾸지 않으면 아이콘이 □로 깨져 보입니다.

## 고양이 표정 (git 상태)

상태가 여러 개 겹치면 위에 있는 것이 먼저 표시됩니다.

| 고양이 | 상황 |
|:---:|---|
| 🙀 | 머지 충돌 또는 merge/rebase/cherry-pick/revert 진행 중 |
| 😾 | 원격과 갈라짐 (ahead + behind 둘 다) |
| 😿 | 원격보다 뒤처짐 (pull 필요) |
| 😹 | 스테이징된 것과 안 된 변경이 섞여 있음 |
| 😻 | 스테이징 완료 (커밋 준비 끝) |
| 😼 | 수정 중 (스테이징 전, untracked 포함) |
| 😸 | 깨끗한데 push 안 한 커밋이 있음 |
| 😽 | 깨끗한데 stash가 남아 있음 |
| 😺 | 완전히 깨끗함 |
| 🐱 | git 저장소가 아닌 폴더 |

## `cc` 단축 명령

```powershell
cc            # = claude --dangerously-skip-permissions
cc -c         # 뒤에 붙인 옵션도 그대로 전달됩니다
```

> ⚠️ **주의**: `--dangerously-skip-permissions`는 Claude Code가 파일 수정이나 명령 실행을 **묻지 않고 바로 실행**하게 하는 옵션입니다.
> 이 동작이 부담스럽다면 프로필에서 `cc` 함수를 지우거나 `claude`로 바꿔 쓰세요.

## 설정 업데이트

설정 파일을 수정했다면 이 저장소에 반영해서 push하고, 다른 PC에서는 `git pull` 후 `install.ps1`을 다시 실행하면 됩니다.

## 문제 해결

- **고양이 대신 템플릿 오류가 보일 때**: oh-my-posh 버전이 오래된 것일 수 있습니다. `oh-my-posh upgrade`를 실행하세요.
- **설정을 바꿨는데 반영이 안 될 때**: `oh-my-posh cache clear`를 실행한 뒤 새 창을 여세요.
- **"스크립트를 실행할 수 없습니다" 오류가 날 때**: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`를 실행하세요.

## Credits

- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) (MIT License): 테마는 기본 제공 `iterm2` 테마를 수정했습니다.
- [Terminal-Icons](https://github.com/devblackops/Terminal-Icons)
