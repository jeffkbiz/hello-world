$FolderPath = dir -Directory -Path "\\stfesasrfileshareprd.file.core.windows.net\asrazfiles\asr1" -Recurse -Force
$Report = @()
Foreach ($Folder in $FolderPath) {
    $Acl = Get-Acl -Path $Folder.FullName
    foreach ($Access in $acl.Access)
        {
            $Properties = [ordered]@{'FolderName'=$Folder.FullName;'AD
Group or
User'=$Access.IdentityReference;'Permissions'=$Access.FileSystemRights;'Inherited'=$Access.IsInherited}
            $Report += New-Object -TypeName PSObject -Property $Properties
        }
}
$Report | Export-Csv -path "C:\Scripts\Output\ASR1_Permissions2_AZ.csv"

# $Output     #| Out-GridView