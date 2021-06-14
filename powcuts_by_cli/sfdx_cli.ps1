

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


