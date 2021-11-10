<#
	.SYNOPSIS
		Configures and connects to the default VPN connection.
	.DESCRIPTION
		Configures the VPN network specified by -VpnName using the Fireware (or the first VPN connection configured, if none specified)(if not already connected).
	.PARAMETER VpnName
		The VPN connection name.
	.PARAMETER ServerAddress
		The VPN server address.
	.PARAMETER AuthenticationMethod
		The authentication method to use for the VPN connection.
	.PARAMETER EncryptionLevel
		The encryption level for the VPN connection.
	.PARAMETER TunnelType
		The type of tunnel used for the VPN connection.
	.PARAMETER NetRoutes
		The destination routes to map to the VPN connection.
	.PARAMETER Username
		An authorized user name.
	.PARAMETER Password
		The password for the specified user name.
	.PARAMETER Certificate
		A certificate to verify the VPN connection.
	.EXAMPLE
		Connect-VPN.ps1
		Connects (if any and is not connected) to the first VPN connection stored.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection
		Connects (if exists and is not connected) to the specified -VpnName.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -NetRoutes 192.168.1.0/24
		Connects (if exists and is not connected) to the specified -VpnName and adds the specified -NetRoutes.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -NetRoutes 192.168.1.0/24 -Certificate <X509Certificate2>
		Connects (if exists and is not connected) to the specified -VpnName and adds the specified -NetRoutes and -Certificate.
	.EXAMPLE
		Connect-VPN.ps1 -NetRoutes 192.168.1.0/24
		Connects (if any and is not connected) to the first VPN connection stored and adds the specified -NetRoutes.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -ServerAddress 192.168.1.1
		Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected).
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -NetRoutes 192.168.1.0/24
		Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) and adds the specified -NetRoutes.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe
		Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName and request the password.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe -NetRoutes 192.168.1.0/24
		Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName, request the password and adds the specified -NetRoutes.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText)
		Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName and -Password (specified as a secure string).
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText) -NetRoutes 192.168.1.0/24
		Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName and -Password (specified as a secure string) and adds the specified -NetRoutes.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -UserName jdoe
		Connects to the VPN connection specified by -VpnName (if exists) with the specified -UserName and request the password.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -UserName jdoe -NetRoutes 192.168.1.0/24
		Connects to the VPN connection specified by -VpnName (if exists) with the specified -UserName, request the password and adds the specified -NetRoutes.
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText)
		Connects to the VPN connection (if exists and is not connected) with the specified -UserName and -Password (specified as a secure string).
	.EXAMPLE
		Connect-VPN.ps1 -VpnName MyVpnConnection -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText) -NetRoutes 192.168.1.0/24
		Connects to the VPN connection (if exists and is not connected) with the specified -UserName, -Password (specified as a secure string) and adds the specified -NetRoutes.
#>
[CmdletBinding()]
param
(
	[string]$VpnName,
	[string]$ServerAddress,
	[string]$AuthenticationMethod = "EAP",
	[string]$EncryptionLevel = "Required",
	[string]$TunnelType = "Automatic",
	[System.Security.Cryptography.X509Certificates.X509Certificate2]$Certificate,
	[string]$UserName,
	[SecureString]$Password,
	[string[]]$NetRoutes
)
function Show-PSHelp
{
	<#
	.SYNOPSIS
		Shows this script help.
	.DESCRIPTION
		Shows the script documentation and its usages information.
	#>
	Get-Help $PSCommandPath
	exit
}
function Get-VpnConnectionByVpnName
{
	<#
	.SYNOPSIS
		Sets the IPsec parameters of the VPN connection specified by VpnName and gets this VPN connection.
	.DESCRIPTION
		Sets the Internet Protocol Security (IPsec) parameters of the VPN connection specified by -VpnName and returns the VPN connection object.
	.OUTPUTS
		The VPN connection object specified by VpnName.
	#>
	Set-VpnConnectionIPsecConfiguration -ConnectionName $VpnName -AuthenticationTransformConstants SHA196 -CipherTransformConstants AES256 -DHGroup Group14 -EncryptionMethod AES256 -IntegrityCheckMethod SHA256 -PfsGroup None -Force
	return Get-VpnConnection -Name $VpnName
}
function Invoke-ElevatedCommand($command)
{
	<#
	.SYNOPSIS
		Invokes the specified command with elevated privileges.
	.DESCRIPTION
		Invokes the specified command in another PowerShell instance with elevated privileges and closes after the command invocation.
	.PARAMETER command
		The command to invoke.
	#>
	Start-Process powershell.exe "-NoLogo -NonInteractive -NoProfile -WindowStyle Hidden -Command ""$command""" -Verb RunAs -Wait
}
# If no VPN connection name is specified...
if (-not $VpnName)
{
	# Get VPN connections
	$vpn = Get-VpnConnection
	# If no VPN connections...
	if ($vpn.Count -eq 0)
	{
		# Show warning message
		Write-Warning "There are no connections installed on the system. Please, specify a VPN name (parameter -VpnName) and a VPN server address (parameter -ServerAddress) to install a new VPN connection."
		# Show help and exit
		Show-PSHelp
	}
	$vpn = $vpn[0]
	$VpnName = $vpn.Name
}
else
{
	# Get the specified VPN connection
	$vpn = Get-VpnConnection -Name $VpnName -ErrorAction Ignore
}
# If the specified VPN connection not exists...
if (-not $vpn)
{
	# If server address was not specified...
	if (-not $ServerAddress)
	{
		# Show warning message
		Write-Warning "There is no $VpnName connection installed on the system and the server address was not specified. Please, specify a server address to connect to."
		# Show help and exit
		Show-PSHelp
	}
	# Add VPN connection
	Add-VpnConnection $VpnName -ServerAddress $ServerAddress -TunnelType $TunnelType -EncryptionLevel $EncryptionLevel -AuthenticationMethod $AuthenticationMethod -SplitTunneling -RememberCredential -ErrorAction Stop
	$vpn = Get-VpnConnectionByVpnName
}
# Else, if server address was specified...
elseif ($ServerAddress)
{
	# Update VPN connection
	Set-VpnConnection $VpnName -ServerAddress $ServerAddress -TunnelType Ikev2 -EncryptionLevel $EncryptionLevel -AuthenticationMethod Eap -SplitTunneling $true -RememberCredential $true -ErrorAction Stop -WarningAction SilentlyContinue
	$vpn = Get-VpnConnectionByVpnName
}
if (-not $vpn)
{
	Write-Error "Cannot retrieve the VPN connection $VpnName."
	exit
}
# If VPN is already connected...
if ($vpn.ConnectionStatus -eq "Connected")
{
	Write-Host "VPN $VpnName already connected."
	exit
}
# If certificate is specified and not installed...
if ($Certificate -and (Get-ChildItem -Path Cert:\ -Recurse | Where-Object { $_.Subject -eq $Certificate.Subject }).Count -eq 0)
{	
	# Create temporal certificate file
	$certificatePath = Join-Path $env:TEMP "Certificate.crt"
	$crt = New-Object System.Text.StringBuilder
	$crt.AppendLine("-----BEGIN CERTIFICATE-----") | Out-Null
	$crt.AppendLine([System.Convert]::ToBase64String($Certificate.RawData, 1)) | Out-Null
	$crt.AppendLine("-----END CERTIFICATE-----") | Out-Null
	$crt.ToString() | Out-File $certificatePath
	# Import certificate
	Invoke-ElevatedCommand "Import-Certificate '$certificatePath' -CertStoreLocation cert:\LocalMachine\root"
	# Remove temporal certificate file
	Remove-Item $certificatePath
}
# For each route...
foreach ($netRoute in $NetRoutes)
{
	# If route is not set...
	if (!$(Get-NetRoute -DestinationPrefix $netRoute -ErrorAction SilentlyContinue) )
	{
		# Set route
		New-NetRoute -DestinationPrefix $netRoute -InterfaceAlias $VpnName
	}
}
# If user name was specified...
if ($UserName)
{
	# If password was not specified
	if (-Not $Password)
	{
		# Request the password
		$Password = Read-Host -AsSecureString "Enter the password for user $UserName"
	}
	# If VPNCredentialsHelper module is not installed...
	if (-Not (Get-Module -ListAvailable -Name VPNCredentialsHelper))
	{
		# Installs the module
		Invoke-ElevatedCommand "Install-Module VPNCredentialsHelper"
	}
	# Set user and password to the VPN connection
	Set-VpnConnectionUsernamePassword -connectionname $VpnName -username $UserName -password $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))) | Out-Null
}
# Connect to the VPN
rasdial.exe $VpnName | Out-Null