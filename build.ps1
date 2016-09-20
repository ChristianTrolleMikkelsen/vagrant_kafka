function Install-Choco
{
    if((Test-Path "C:\ProgramData\chocolatey\bin\choco.exe") -eq $false)
    {
        iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    }
    $env:Path += ";C:\ProgramData\chocolatey\bin"
}

function Install-OpenSSH
{
    if(((choco.exe search -localonly win32-openssh) -like "win32-openssh*").Count -eq 0)
    {
        choco install win32-openssh -y -version 2016.05.15 --force --ignore-checksums
    }
    else
    {
        choco upgrade win32-openssh -y
    }

    $env:Path += ";C:\Program Files\OpenSSH-Win64"
}

function Install-VBox
{
    if(((choco.exe search -localonly virtualbox) -like "virtualbox*").Count -eq 0)
    {
        choco install virtualbox -y -version 5.0.16.105871 --force --ignore-checksums
    }
    else
    {
        choco upgrade virtualbox -y
    }
}

function Install-Vagrant
{
    if(((choco.exe search -localonly vagrant) -like "vagrant*").Count -eq 0)
    {
        choco install vagrant -y -version 1.8.1.20160318 --force --ignore-checksums
    }
    else
    {
        #hoco upgrade vagrant -y
    }
 
    $env:Path += ";C:\HashiCorp\Vagrant\bin"
}

function Build-Box
{
    vagrant destroy -f
    vagrant up
    rm kafka_cluster.box -Force -ErrorAction SilentlyContinue
    vagrant package --output kafka_cluster.box --vagrantfile DefaultVagrantfile
    vagrant destroy -f
}

Install-Choco
Install-OpenSSH
Install-VBox
Install-Vagrant
Build-Box
