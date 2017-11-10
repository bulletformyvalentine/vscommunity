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

$setupFolder = "c:\spring-mvc"
Create-Folder "$setupFolder"

Create-Folder "c:\Spring-MVC-All-modules"




if((Test-Path "$setupFolder\Spring-MVC modules.zip") -eq $false)
{
  
        Download-File "https://aproloydevtestlab901.blob.core.windows.net/softwares/Spring-MVC%20%20modules.zip" "$setupFolder\Spring-MVC modules.zip"  
}






Add-Type -assembly "system.io.compression.filesystem"

$BackUpPath = "$setupFolder\Spring-MVC modules.zip"

$destination = "C:\Spring-MVC-All-modules"



Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::ExtractToDirectory($BackUpPath, $destination)

Remove-Item –path C:\spring-mvc -Recurse

#Start-Process -FilePath C:\haxmextracted\silent_install.bat -WorkingDirectory C:\haxmextracted\