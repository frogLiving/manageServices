# Powershell script "Security patching"
# Date: 08/15/2023
# Purpose:  Turn services on and off
# Switches: "on" or "off" to turn services on / off.  Switches are required "-state"

# Required parameter
Param([string]$state = "")

# List of services
$service = @('TrustedInstaller', 'wuauserv')

function updateServices {
	
	
	if($state -match "on") {
		foreach ($i in $service) {
			Set-Service $i -StartupType Automatic #Enable services
			Start-Service -Name $i								
		}		
	}
	else{
		foreach ($i in $service) {
			Stop-Service -Name $i
			Set-Service $i -StartupType Disabled #Enable services			
		}				
	}
}

# Function call and check
if ($state -ne "") { updateServices }
else { Write-Output "`nPlease use the -State switch and set it to either `"on`" or `"off`"`n" }