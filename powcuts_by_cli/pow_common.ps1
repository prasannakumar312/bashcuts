



Set-Alias -Name nfp -Value c:\windows\notepad.exe
function reinit {
    Write-Host "arrrrra"
    # . $profile
    Invoke-Command { & "powershell.exe" } -NoNewScope # PowerShell 5
    Write-Host "arrrrra"

}

function new-list($new_list_variable) {
    Set-Variable -Name "$new_list_variable" -Value ([system.collections.generic.list[string]]::new()) -Scope global
}
