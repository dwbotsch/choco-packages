# Runs before the choco package is installed 

# Installation dir location
$INSTALL_DIR = Join-Path $PSScriptRoot 'installer'

Start-Process "msiexec.exe" -Wait -ArgumentList "/i $INSTALL_DIR\msodbcsql.msi /qn /norestart"
gci -Path $INSTALL_DIR\Microsoft* -Filter *.exe -Recurse | % {Start-Process $_.FullName -ArgumentList "/q /norestart" -wait -Verbose}
