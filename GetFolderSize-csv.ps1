 $targetfolder = 'C:\Users'
$dataColl = Get-ChildItem -Force $targetfolder -Directory -ErrorAction SilentlyContinue | ForEach-Object {
   $len = Get-ChildItem -Recurse -Force $_.FullName -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum
   $foldername = $_.FullName
   $foldersize = '{0:N2} GB' -f ($len / 1Gb)
   [PSCustomObject]@{
       foldername = $foldername
       foldersizeGb = $foldersize
   }
}
$dataColl | Export-Csv -Path C:\Scripts\Output\FolderSizeTest.csv  



