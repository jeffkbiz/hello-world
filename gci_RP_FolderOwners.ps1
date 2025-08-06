# Specify the starting folder
$folderPath = "\\asrsvjupiter\RealProp"

# Get the folder and subfolder owners
Get-ChildItem -Path $folderPath -Recurse -Directory | ForEach-Object {
    $folder = $_
    $acl = Get-Acl -Path $folder.FullName
    $owner = $acl.Owner
    [PSCustomObject]@{
        Folder = $folder.FullName
        Owner = $owner
    }
} # | Export-Csv -Path 'C:\Scripts\Output\AZ-RealProp_dir_owners.csv' -UseCulture -NoTypeInformation

 