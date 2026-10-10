# Jump Server OMAR1325 - PowerShell como administrador

# Licencia de evaluacion de Windows Server
slmgr /dlv
slmgr /rearm
Restart-Computer

# Despues del reinicio: IP fija 10.13.25.138/29, gateway 10.13.25.137, DNS 127.0.0.1
# (ncpa.cpl -> Ethernet0 -> IPv4)
Enable-NetFirewallRule -Name FPS-ICMP4-ERQ-In
ipconfig /registerdns
ping 10.13.25.137
ping 8.8.8.8
nslookup omar1325.omar1325.local
nslookup google.com
