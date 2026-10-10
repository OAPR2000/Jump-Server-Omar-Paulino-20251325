# El certificado se crea en Propiedades de implementacion -> Certificados
# (omar1325.omar1325.local, C:\Certs\rds1325.pfx, contrasena Cert1325!)
New-Item -ItemType Directory C:\Certs -Force

# Exportar la parte publica y publicarla en el IIS de Acceso web
$thumb = (Get-RDCertificate -Role RDPublishing).Thumbprint
$cert  = Get-Item "Cert:\LocalMachine\My\$thumb"
Export-Certificate -Cert $cert -FilePath C:\Certs\rds1325.cer -Force
Import-Certificate -FilePath C:\Certs\rds1325.cer -CertStoreLocation Cert:\LocalMachine\Root
Copy-Item C:\Certs\rds1325.cer C:\inetpub\wwwroot\rds1325.cer -Force
