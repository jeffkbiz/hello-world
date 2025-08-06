
Get-ADGroupMember -identity ASRGGUSERS -Recursive | foreach{ get-aduser $_} | select name | Export-Csv -Path C:\Scripts\Output\ASRGGUSERS_members.csv  