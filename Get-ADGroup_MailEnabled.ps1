
# OU=IS,OU=Unmanaged Roles,OU=Unmanaged Groups,OU=ASR Groups,OU=ASR,DC=SCCGOV,DC=ORG
# OU=SSE,OU=Unmanaged Roles,OU=Unmanaged Groups,OU=ASR Groups,OU=ASR,DC=SCCGOV,DC=ORG

# Get-ADGroup -SearchBase 'ou=groups,dc=AD,dc=AD,dc=AD,dc=COM' -LDAPFilter "(&(mail=*)(groupType:1.2.840.113556.1.4.803:=2147483648))" -Properties displayname, mail | epcsv C:\output\SG-Email.csv -not

Get-ADGroup -SearchBase 'OU=SSE,OU=Unmanaged Roles,OU=Unmanaged Groups,OU=ASR Groups,OU=ASR,DC=SCCGOV,DC=ORG' -LDAPFilter "(&(mail=*)(groupType:1.2.840.113556.1.4.803:=2147483648))" -Properties displayname, mail # | epcsv C:\output\SG-Email.csv -not