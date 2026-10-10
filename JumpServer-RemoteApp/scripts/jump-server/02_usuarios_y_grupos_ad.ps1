# Usuarios y grupos del dominio Omar1325.local
New-ADUser -Name "Usuario Sin Privilegios" -SamAccountName usuario1325 -UserPrincipalName usuario1325@Omar1325.local -AccountPassword (ConvertTo-SecureString 'Usr#Lab2025!' -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true
New-ADUser -Name "Admin Con Privilegios" -SamAccountName admin1325 -UserPrincipalName admin1325@Omar1325.local -AccountPassword (ConvertTo-SecureString 'Adm#Lab2025!' -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true

New-ADGroup -Name GRP-RA-USUARIOS -GroupScope Global -GroupCategory Security
New-ADGroup -Name GRP-RA-ADMINS  -GroupScope Global -GroupCategory Security
Add-ADGroupMember -Identity GRP-RA-USUARIOS -Members usuario1325
Add-ADGroupMember -Identity GRP-RA-ADMINS  -Members admin1325

# S-1-5-32-555 = Usuarios de escritorio remoto (Remote Desktop Users)
Add-ADGroupMember -Identity S-1-5-32-555 -Members GRP-RA-USUARIOS, GRP-RA-ADMINS

# Despues de editar la GPO "Permitir inicio de sesion a traves de Servicios de Escritorio remoto"
gpupdate /force
