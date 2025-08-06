# delete file, need to write to log***

# If the HP3000 MBFSYNC fails under a particular condition, then it will write a file RESTRTUC.TXT to the path \\asrsvinfnetp002\e$\FTPArchUser\From_HP\MBFSYNC

# Out-File "$(Get-Date -UFormat '%Y-%m-%d-%H-%M-%S-')$output.xml" -Append
# "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Your output message" | Out-File -FilePath $logfile -Append

# Set variables

$filePath = "C:\Temp\test\test.txt"
$destinationPath = "C:\Temp\test2\"
$serviceName = "Phone Service"
$logfile = "C:\Temp\log\log.txt"

# Check if the file exists
if (Test-Path -Path $filePath) {
    # Delete the file
    try {
        Remove-Item $filePath -Force
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - File deleted successfully." | Out-File -FilePath $logfile -Append
    } catch {
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Error deleting file: $($_.Exception.Message)" | Out-File -FilePath $logfile -Append
    }

    # Restart the service
    try {
        Restart-Service -Name $serviceName -Force
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Service '$serviceName' restarted successfully." | Out-File -FilePath $logfile -Append
    } catch {
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Error restarting service '$serviceName': $($_.Exception.Message)" | Out-File -FilePath $logfile -Append
    }
} else {
    Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - File not found at '$filePath'." | Out-File -FilePath $logfile -Append
}
