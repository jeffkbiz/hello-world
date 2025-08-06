
Connect-VIServer -Server asrsvvcenter2.sccgov.org
Get-VM -Name asrsvsrm2 | Get-Snapshot | Where-Object { $_.CreationTime -lt (Get-Date).AddDays(-3)} | Remove-Snapshot -Confirm:$false -ErrorAction SilentlyContinue