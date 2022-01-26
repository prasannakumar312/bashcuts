



Set-Alias -Name nfp -Value c:\windows\notepad.exe

function reinit {
    Invoke-Command { & "pwsh.exe" } -NoNewScope 
}
function new-list($new_list_variable) {
    Set-Variable -Name "$new_list_variable" -Value ([system.collections.generic.list[string]]::new()) -Scope global
}

function robot-debug() {
    $env:ROBOT_DEBUG = "TRUE"; robot --rpa -d output .
}

