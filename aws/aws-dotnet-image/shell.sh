 #!/bin/bash
 sudo su
sudo yum install aspnetcore-runtime-7.0
sudo yum install dotnet-sdk-7.0
dotnet tool install --global x . /etc/profile.d/dotnet-cli-tools-bin-path.sh
dotnet sdk check