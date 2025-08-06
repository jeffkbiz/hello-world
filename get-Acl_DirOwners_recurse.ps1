# Specify the starting folder
$folderPath = "\\asrsvjupiter\NS_public"

# Get the folder and subfolder owners
Get-ChildItem -Path $folderPath -Recurse -Directory | ForEach-Object {
    $folder = $_
    $acl = Get-Acl -Path $folder.FullName
    $owner = $acl.Owner
    [PSCustomObject]@{
        Folder = $folder.FullName
        Owner = $owner
    }
} | Export-Csv -Path 'C:\Scripts\Output\N_public_dir_owners.csv' -UseCulture -NoTypeInformation

 