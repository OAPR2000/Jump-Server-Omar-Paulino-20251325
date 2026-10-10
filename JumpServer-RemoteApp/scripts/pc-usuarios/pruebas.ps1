# PC-USUARIOS - pruebas con la VPN conectada (PowerShell)
ipconfig                                   # adaptador Shrew con 10.25.13.x
route print 10.13.25.*
ping omar1325.omar1325.local               # responde 10.13.25.138

# Como usuario1325
Test-NetConnection 10.13.25.138 -Port 443  # True  (VPN-USUARIOS-A-JUMP)
Test-NetConnection 10.13.25.138 -Port 22   # False (DENY-USUARIO-SSH-JUMP)
Test-NetConnection 10.13.25.130 -Port 22   # False (DENY-USUARIO-SSH-WEB)
Test-NetConnection 10.13.25.130 -Port 443  # False (DENY-VPN-A-WEB)

# Como admin1325
Test-NetConnection 10.13.25.138 -Port 3389 # True  (VPN-ADMINS-A-JUMP)
Test-NetConnection 10.13.25.130 -Port 22   # False (DENY-VPN-A-WEB)
