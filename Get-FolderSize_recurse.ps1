(Get-ChildItem -Path "\\asrsvfs1\asr\disabled users" -Recurse | Measure-Object -Property Length -Sum).Sum

