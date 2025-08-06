
# delete file, restart MBF-UDAconnector, write to logfile
# test path: "\\asrsvinfnetp002\e$\FTPArchUser\From_HP\Test Files\RESTRTUC.TXT" | Service: SQLTELEMETRY
# MBF-UDAconnector
# SQLTELEMETRY

# If the HP3000 MBFSYNC fails under a particular condition, then it will write a file RESTRTUC.TXT to the path \\asrsvinfnetp002\e$\FTPArchUser\From_HP\MBFSYNC\RESTRTUC.TXT

# Set variables
$filePath = "\\asrsvinfnetp002\e$\FTPArchUser\From_HP\MBFSYNC\RESTRTUC.TXT"

$serviceName = "MBF-UDAconnector"
$logfile = "C:\Scripts\_MBFsyncLog-sqlp001.txt"
$ComputerName = "asrsvintsqlp001"

# Check if the file exists

if (Test-Path -Path $filePath) {
    # Delete the file
    try {
        Remove-Item $filePath -Force
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - RESTRTUC.TXT deleted successfully." | Out-File -FilePath $logfile -Append
    } catch {
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Error deleting RESTRTUC.TXT: $($_.Exception.Message)" | Out-File -FilePath $logfile -Append
    }

    # Restart the service
    try {
       $ServiceObj = Get-Service -Name $ServiceName -ComputerName $ComputerName -ErrorAction Stop
       Restart-Service -InputObject $ServiceObj -ErrorAction Stop 
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Service '$serviceName' restarted successfully." | Out-File -FilePath $logfile -Append
    } catch {
        Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Error restarting service '$serviceName': $($_.Exception.Message)" | Out-File -FilePath $logfile -Append
    }
}  else {
    
}

# Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - File not found at '$fileP