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
        choco install virtualbox -y -version 5.0.16.105871 --force
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
        choco install vagrant -y -version 1.8.1.20160318 --force
        #hoco upgrade vagrant -y
    }
 
    $env:Path += ";C:\HashiCorp\Vagrant\bin"
}

function Build-Box-v9
{
    $version = "v9"
    $vagrantFile = "Vagrantfile_"+$version
    $vagrantBox = "kafka_cluster.box"
    
    rm Vagrantfile -Force -ErrorAction SilentlyContinue
    cp $vagrantFile "Vagrantfile"

    vagrant destroy -f
    vagrant up

    rm $vagrantBox -Force -ErrorAction SilentlyContinue

    vagrant package --output $vagrantBox --vagrantfile DefaultVagrantfile
    vagrant destroy -f
}

function Build-Box
{
    param([string] $version)

    $vagrantFile = "Vagrantfile_"+$version
    $vagrantBox = "kafka_cluster_"+$version+".box"
    
    rm Vagrantfile -Force -ErrorAction SilentlyContinue
    cp $vagrantFile "Vagrantfile"

    vagrant destroy -f
    vagrant up

    rm $vagrantBox -Force -ErrorAction SilentlyContinue

    vagrant package --output $vagrantBox --vagrantfile DefaultVagrantfile
    vagrant destroy -f
}

#Install-Choco
#Install-OpenSSH
#Install-VBox
#Install-Vagrant
#Build-Box-v9
Build-Box v9
Build-Box v10
