mkdir C:\temp1 ; cd C:\temp1;
[Net.ServicePointManager]::SecurityProtocol= [Net.SecurityProtocolType]::Tls12
curl -o master.zip https://github.com/saikrishnavydha/Krishna/archive/refs/heads/master.zip;
expand-archive -path 'c:\temp1\master.zip' -destinationpath '.\masterunzip';
cd masterunzip\Krishna-master;
msiexec /i xagtSetup_32.30.13_universal.msi
