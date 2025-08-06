# delete file, no log file***

# Set variables

$filePath = "C:\Temp\test\test.txt"
$destinationPath = "C:\Temp\test2\"
$serviceName = "Phone Service"

# Check if the file exists
if (Test-Path -Path $filePath) {
    # Delete the file
    try {
        Remove-Item $filePath -Force
        Write-Host "File deleted successfully."
    } catch {
        Write-Host "Error deleting file: $($_.Exception.Message)"
    }

    # Restart the service
    try {
        Restart-Service -Name $serviceName -Force
        Write-Host "Service '$serviceName' restarted successfully."
    } catch {
        Write-Host "Error restarting service '$serviceName': $($_.Exception.Message)"
    }
} else {
    Write-Host "File not found at '$filePath'."
}
