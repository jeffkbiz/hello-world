
# Test Inputs:
# ASRWS085010
# c$\Users\jeff.kendig\OneDrive - SCC-Cloud\Documents\_GIS


# Enter the computer name
$computerName = Read-Host "Enter computer name"

# Get the last access time for all files in a specific folder
$folderPath = Read-Host "Enter folder path"

Get-ChildItem -Path "\\$computerName\$folderPath" -File | Select-Object Name, LastAccessTime,LastWriteTime
| export-csv -path C:\Scripts\Output\FileLastAccessed.csv