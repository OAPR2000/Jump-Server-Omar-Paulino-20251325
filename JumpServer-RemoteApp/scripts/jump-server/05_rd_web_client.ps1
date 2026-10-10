# Ventana 1 (PowerShell como administrador)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force

# Ventana 2 (cerrar y abrir otra PowerShell como administrador)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-Module -Name RDWebClientManagement -Force -AcceptLicense
Install-RDWebClientPackage
Import-RDWebClientBrokerCert C:\Certs\rds1325.cer
Publish-RDWebClientPackage -Type Production -Latest
# URL: https://omar1325.omar1325.local/RDWeb/webclient/
