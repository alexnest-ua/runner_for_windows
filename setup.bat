# Install git, python3, pip3
winget install -e --id Git.Git --silent --accept-package-agreements
winget install python --accept-package-agreements
curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

#Install latest version of mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd mhddos_proxy
python -m pip install -r requirements.txt
