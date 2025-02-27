﻿# Add some assemblies
Add-type -AssemblyName System.xml.linq                 -ErrorAction SilentlyContinue
Add-Type -AssemblyName System.Runtime.Serialization    -ErrorAction SilentlyContinue
Add-Type -AssemblyName System.Web                      -ErrorAction SilentlyContinue
Add-Type -AssemblyName System.Web.Extensions           -ErrorAction SilentlyContinue
Add-Type -path "$PSScriptRoot\BouncyCastle.Crypto.dll" -ErrorAction SilentlyContinue

# Load settings
. "$PSScriptRoot\Configuration.ps1"
Read-Configuration

# Set supported TLS methods
[Net.ServicePointManager]::SecurityProtocol = Get-Setting -Setting "SecurityProtocol"

# Print the welcome message
$manifest = Import-PowerShellDataFile "$PSScriptRoot\AADInternals.psd1"
$version = $manifest.ModuleVersion
$host.ui.RawUI.WindowTitle="AADInternals $version"

$logo=@"
    ___    ___    ____  ____      __                        __    
   /   |  /   |  / __ \/  _/___  / /____  _________  ____ _/ /____
  / /| | / /| | / / / // // __ \/ __/ _ \/ ___/ __ \/ __ ``/ / ___/
 / ___ |/ ___ |/ /_/ _/ // / / / /_/  __/ /  / / / / /_/ / (__  ) 
/_/  |_/_/  |_/_____/___/_/ /_/\__/\___/_/  /_/ /_/\__,_/_/____/  
  
 v$version 🛡️ TROOPERS23 edition by @DrAzureAD (Nestori Syynimaa)
"@

Write-Host $logo -ForegroundColor Yellow