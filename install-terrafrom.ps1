Add-Type -AssemblyName System.IO.Compression.FileSystem
$terrafromurl="https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_windows_amd64.zip"



function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$client = new-object System.Net.WebClient
$client.DownloadFile(“$terrafromurl”,“$PSScriptRoot\terraform.zip”)

if(test-path "C:\terraform"){
Remove-Item "C:\terraform" -Force -Recurse
}

Unzip "$PSScriptRoot\terraform.zip" "C:\terraform"

$env:Path += ";C:\terraform"  
Remove-Item "$PSScriptRoot\terraform.zip"