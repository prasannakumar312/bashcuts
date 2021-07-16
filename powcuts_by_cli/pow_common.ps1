



Set-Alias -Name nfp -Value c:\windows\notepad.exe
function reinit {
    Invoke-Command { & "powershell.exe" } -NoNewScope # PowerShell 5
}

function new-list($new_list_variable) {
    Set-Variable -Name "$new_list_variable" -Value ([system.collections.generic.list[string]]::new()) -Scope global
}
