function Create-Folder {
    Param ([string]$path)
    if ((Test-Path $path) -eq $false) 
    {
        Write-Host "$path doesn't exist. Creating now.."
        New-Item -ItemType "directory" -Path $path
    }
}

function Download-File{
    Param ([string]$src, [string] $dst)

    (New-Object System.Net.WebClient).DownloadFile($src,$dst)
    #Invoke-WebRequest $src -OutFile $dst
}

function WaitForFile($File) {
  while(!(Test-Path $File)) {    
    Start-Sleep -s 10;   
  }  
} 


#Setup Folders

$setupFolder = "c:\dump"
Create-Folder "$setupFolder"

$dest = "c:\Website"
Create-Folder "$dest"


#$os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match ‘(x64)’

# SQL Server Installation 
if((Test-Path "$setupFolder\bootstrap-3.3.7-dist.zip") -eq $false)
{
    Write-Host "Downloading."
    Download-File "https://mylibrary123.blob.core.windows.net/reposit/bootstrap-3.3.7-dist.zip" "$setupFolder\bootstrap-3.3.7-dist.zip"
    
}



Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "c:\dump\bootstrap-3.3.7-dist.zip"

$Destination = $dest

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)


Remove-Item -Path c:\dump\bootstrap-3.3.7-dist.zip -Recurse
Remove-Item -Path C:\website\bootstrap


#$wshshell = New-Object -ComObject WScript.Shell
#$desktop = [System.Environment]::GetFolderPath('Desktop')
  #$lnk = $wshshell.CreateShortcut($desktop+"\realm.lnk")
  #$lnk.TargetPath = "c:\website\bootstrap"
  #$lnk.Save()  
