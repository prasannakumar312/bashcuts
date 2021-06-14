  Write-Host "arri"

$pow_sfdxcli = Get-Content 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\sfdx_cli.ps1'
if ($pow_sfdxcli -ne $NULL) {
 . 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\sfdx_cli.ps1'
} else {
    Write-Host "no sfdx cli"
}


$pow_common = Get-Content 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\pow_common.ps1'
if ($pow_common -ne $NULL) {
 . 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\pow_common.ps1'
} else {
    Write-Host "no powcli"
}

$pow_open = Get-Content 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\pow_open.ps1'
if ($pow_open -ne $NULL) {
 . 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\pow_open.ps1'
} else {
    Write-Host "no pow_open"
}

$pester = Get-Content 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\pester.ps1'
if ($pow_open -ne $NULL) {
 . 'C:\git\jdschleicher\bashcuts\powcuts_by_cli\pester.ps1'
} else {
    Write-Host "no pester"
}