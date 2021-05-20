



Set-Alias -Name nfp -Value c:\windows\notepad.exe
function reinit {
    Write-Host "arrrrra"
    # . $profile
    Invoke-Command { & "powershell.exe" } -NoNewScope # PowerShell 5
    Write-Host "arrrrra"

}

