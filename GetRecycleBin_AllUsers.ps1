# to delete for all users, in admin cmd   rd /s F:\$Recycle.Bin

$recycleBinPath = 'C:\$Recycle.Bin'


$sidFolders = Get-ChildItem -Path $recycleBinPath -Directory -Force
$results = @()

foreach ($sidFolder in $sidFolders) {
    
    $sid = $sidFolder.Name

 
    try {
        $user = (New-Object System.Security.Principal.SecurityIdentifier($sid)).Translate([System.Security.Principal.NTAccount]).Value
    } catch {
        $user = "Unknown user($sid)"
    }

    
    $size = Get-ChildItem -Path $sidFolder.FullName -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum

    if ($size.Sum -gt 0) {
        
        $results += [PSCustomObject]@{
            'User'     = $user
            'Size (MB)' = [Math]::Round($size.Sum / 1MB, 2)
        }
    }
}


if ($results.Count -gt 0) {
    $results | Sort-Object 'Size (MB)' -Descending | Format-Table -AutoSize
} else {
    Write-Host "No results"
}