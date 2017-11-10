

# Needed to run remote scripts
Set-ExecutionPolicy Unrestricted



# Update Env variables in session so npm is available
#Update-Environment

# Install karma test-runner from node package manager (npm) into global node_modules
& powershell -command {npm install -g karma}
write-host "**** INSTALLED KARMA *****"

# Set ENV variables for browsers, due to a bug in karma on Windows:
$CHROME_BIN = "C:\Program Files (x86)\Google\Chrome\Application\Chrome.exe"
$FIREFOX_BIN = "C:\Program Files (x86)\Mozilla Firefox\Firefox.exe"

[Environment]::SetEnvironmentVariable("CHROME_BIN", $CHROME_BIN, "User")
[Environment]::SetEnvironmentVariable("FIREFOX_BIN", $FIREFOX_BIN, "User")

write-host "**** ADDED BROWSERS TO USER ENV VARIABLES *****"

npm install -g karma-cli

karma start
 

