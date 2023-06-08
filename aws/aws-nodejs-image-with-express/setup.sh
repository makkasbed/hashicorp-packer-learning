 #!/bin/bash
  cd /tmp
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
  source ~/.bashrc
  nvm i 14.15.3
  curl -o- -L https://yarnpkg.com/install.sh | bash
  sudo yum install -y ruby wget
  cd /home/ec2-user
  wget https://aws-codedeploy-ap-southeast-2.s3.ap-southeast-2.amazonaws.com/latest/install
  chmod +x ./install
  sudo ./install auto
  sudo ln -s /home/ec2-user/.nvm/versions/node/v12.13.0/bin/node /usr/bin
  sudo ln -s /home/ec2-user/.nvm/versions/node/v12.13.0/bin/npm /usr/bin
  sudo ln -s /home/ec2-user/.yarn/bin/yarn /usr/bin
  sudo yarn global add pm2
  sudo ln -s /usr/local/bin/pm2 /usr/bin