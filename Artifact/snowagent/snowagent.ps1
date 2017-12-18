$uri= "https://goldenimagetemplate.blob.core.windows.net/goldenimage/Agents/SNOW%20Agent/MPHASIS_LIMITED_snowagent-5.2.1.x64.msi"
$out = "c:\MPHASIS_LIMITED_snowagent.msi"
Invoke-WebRequest -uri $uri -OutFile $out
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $out /quiet /norestart /l c:\installlog.txt"