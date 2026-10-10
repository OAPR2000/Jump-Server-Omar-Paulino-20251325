# Exporta la configuracion de RDS y AD a C:\Certs\jump-config.txt
$o = "C:\Certs\jump-config.txt"
"=== IP ===" | Out-File $o; Get-NetIPConfiguration | Out-File $o -Append
"=== Servidores RDS ===" | Out-File $o -Append; Get-RDServer | Out-File $o -Append
"=== RemoteApps ===" | Out-File $o -Append; Get-RDRemoteApp | Format-List DisplayName,FilePath,CommandLineSetting,RequiredCommandLine,UserGroups | Out-File $o -Append
"=== Grupos de la coleccion ===" | Out-File $o -Append; Get-RDSessionCollectionConfiguration -CollectionName QuickSessionCollection -UserGroup | Out-File $o -Append
"=== Certificados ===" | Out-File $o -Append; Get-RDCertificate | Out-File $o -Append
"=== Licencias ===" | Out-File $o -Append; Get-RDLicenseConfiguration | Out-File $o -Append
"=== Grupos AD ===" | Out-File $o -Append; "GRP-RA-USUARIOS","GRP-RA-ADMINS" | % { $_; Get-ADGroupMember $_ | Select Name,SamAccountName } | Out-File $o -Append
notepad $o
