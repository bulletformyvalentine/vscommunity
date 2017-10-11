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


$setupFolder = "$env:USERNAME\Users\Desktop\guide"
Create-Folder "$setupFolder"






# haxm 
if((Test-Path "$setupFolder\guide.txt") -eq $false)
{
  
        Download-File "https://g7crtipl-my.sharepoint.com/personal/proloy_saha_g7cr_in/_layouts/15/guestaccess.aspx?docid=169d1a2323830490696d70211595f0daf&authkey=AbxkTPEDqNQQnhb6XLOd9nM" "$setupFolder\guide.txt"
}

