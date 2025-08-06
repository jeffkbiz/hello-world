

$sourcePath = '\\asrsvjupiter\martydavidrichelle'              # enter your path here
$outputPath = 'C:\Scripts\FolderOwners.csv'   # and the path for the output file here

Get-ChildItem -Path $sourcePath -Recurse | 
Select-Object Mode, FullName, CreationTime, LastWriteTime, LastAccessTime,
              @{Name = 'Owner'; Expression = {(Get-Acl -Path $_.FullName).Owner}} |
Export-Csv -Path $outputPath -UseCulture -NoTypeInformation