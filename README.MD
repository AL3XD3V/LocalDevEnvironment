# LocalDevEnvironment
This repository contains configuration of local development environment for Symfony projects based on Virtual Machine.
## Prerequisites
To start working with environment, you need to install software above:
* [VirtualBox](https://download.virtualbox.org/virtualbox/6.0.14/VirtualBox-6.0.14-133895-Win.exe)
* [Vagrant](https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.msi)
* [Git](https://github.com/git-for-windows/git/releases/download/v2.24.0.windows.2/Git-2.24.0.2-64-bit.exe)

> Tested on:\
> Windows10 (x64) LTSC (10.0.17763.615)\
> VirtualBox 6.0.12\
> Vagrant 2.2.5

## How to up environment

1. Ensure that you have been installed software listed in Prerequisites.
2. Open the Terminal (with admin permissions).
3. Jump to your projects directory (or other): \
` cd D:\Projects\ `
4. Clone this repository and jump to cloned directory: \
` git clone https://github.com/AL3XD3V/LocalDevEnvironment.git ` \
` cd LocalDevEnvironment `
5. Create Virtual Machine and wait for its configuration: \
` vagrant up `
6. In **hosts** file (on Windows: 'C:\Windows\System32\drivers\etc'; on Linux: '/etc/hosts') add line: \
*open file with admin permissions* \
` 127.0.0.1 project.loc `
7. Open browser and type: \
` project.loc:8080/ `

To ssh into VM, type: `vagrant ssh`\
To shutdown VM, type: `vagrant halt`