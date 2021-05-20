

function SetupLocalGitHubActionsEnvironment {
	$env:SFDX_AUTH_URL = "force://PlatformCLI::.com"
	$env:ORG_ALIAS = "dev"
}

Set-Alias -Name np -Value c:\windows\notepad.exe

Set-Alias -Name jonwh -Value  "Write-Host"


function pernit {
    Write-Host "SetupLocalGitHubActionsEnvironment"
	SetupLocalGitHubActionsEnvironment

}


# Set-PSReadLineOption -colors @{
#   Operator           = 'Cyan'
#   Parameter          = 'Cyan'
#   String             = 'White'
# }

# function Invoke-PowerShell {
#     powershell –nologo
#     Invoke-PowerShell
# }

# function Restart-PowerShell {
#     if ($host.Name -eq 'ConsoleHost') {
#         exit
#     }
#     Write-Warning 'Only usable while in the PowerShell console host'
# }


# function reinit_test {
# 	if ($host.Name -eq 'ConsoleHost') {
#         exit
#     }
#     Write-Warning 'Only usable while in the PowerShell console host'
# }


# Set-Alias –Name 'reinit' –Value 'reinit_test'

# $parentProcessId = (Get-WmiObject Win32_Process –Filter "ProcessId=$PID").ParentProcessId
# $parentProcessName = (Get-WmiObject Win32_Process –Filter "ProcessId=$parentProcessId").ProcessName

# if ($host.Name -eq 'ConsoleHost') {
#     if (-not($parentProcessName -eq 'powershell.exe')) {
#         Invoke-PowerShell
#     }
# }

