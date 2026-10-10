[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
New-Item -ItemType Directory "C:\Program Files\PuTTY" -Force
Invoke-WebRequest https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe -OutFile "C:\Program Files\PuTTY\putty.exe"
