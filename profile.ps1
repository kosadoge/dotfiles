function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        } else {
            # we're on an actual branch, so print it
            Write-Host " ($branch)" -ForegroundColor "blue"
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}

function prompt {
    $base = "PS "
    $path = "$($executionContext.SessionState.Path.CurrentLocation)"
    $userPrompt = "$('>' * ($nestedPromptLevel + 1)) "

    Write-Host "`n$base" -NoNewline

    if (Test-Path .git) {
        Write-Host $path -NoNewline -ForegroundColor "green"
        Write-BranchName
    } else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host $path -ForegroundColor "green"
    }

    return $userPrompt
}

# Create user profile if it doesn't exist
if ( -not ( Test-Path $Profile ) ) { New-Item -Path $Profile -Type File -Force }

# PowerShell Settings
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward


# Env
$env:BAT_THEME = "gruvbox-dark"


# Aliases
Set-Alias -Name k8s -Value kubectl

function Display-Content () { bat -p --paging=never $args }
Set-Alias -Name cat -Value Display-Content

function List-Tree () { eza -t $args }
function List-Long () { eza -l $args }
Set-Alias -Name tree -Value List-Tree
Set-Alias -Name ll -Value List-Long
Set-Alias -Name ls -Value eza