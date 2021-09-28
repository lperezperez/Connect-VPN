# Connect-VPN

[![Project status: Active – The project has reached a stable, usable state and is being actively developed.](https://img.shields.io/badge/Status-Active-46b31f.svg?logo=git&logoColor=fff "Project status: Active – The project has reached a stable, usable state and is being actively developed.")](https://www.repostatus.org/#active) [![License: MPLv2](https://img.shields.io/badge/License-MIT-8b1eb2.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAABJmlDQ1BBZG9iZSBSR0IgKDE5OTgpAAAoFWNgYDJwdHFyZRJgYMjNKykKcndSiIiMUmA/z8DGwMwABonJxQWOAQE+IHZefl4qAwb4do2BEURf1gWZxUAa4EouKCoB0n+A2CgltTiZgYHRAMjOLi8pAIozzgGyRZKywewNIHZRSJAzkH0EyOZLh7CvgNhJEPYTELsI6Akg+wtIfTqYzcQBNgfClgGxS1IrQPYyOOcXVBZlpmeUKBhaWloqOKbkJ6UqBFcWl6TmFit45iXnFxXkFyWWpKYA1ULcBwaCEIWgENMAarTQZKAyAMUDhPU5EBy+jGJnEGIIkFxaVAZlMjIZE+YjzJgjwcDgv5SBgeUPQsykl4FhgQ4DA/9UhJiaIQODgD4Dw745AMDGT/0QRiF8AAAACXBIWXMAAAsTAAALEwEAmpwYAAAGTGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIwLTEwLTA3VDAwOjM3OjMzKzAyOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIwLTEwLTA3VDAwOjM3OjMzKzAyOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMC0xMC0wN1QwMDozNzozMyswMjowMCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDphZGU1YjczYy0wOWI1LWFmNDgtYmJkZi03NWQxMWM2ZTMwYmUiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo1ZmYyZWI4MS03NTE0LTgwNDQtYjUyYy1jNzZkZDhmN2I2NWIiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1OTZkYjZmYS0yZmM4LWVkNDAtYjM5Ny1kNDg2NzBhZjM0NzQiIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIj4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OTZkYjZmYS0yZmM4LWVkNDAtYjM5Ny1kNDg2NzBhZjM0NzQiIHN0RXZ0OndoZW49IjIwMjAtMTAtMDdUMDA6Mzc6MzMrMDI6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YWRlNWI3M2MtMDliNS1hZjQ4LWJiZGYtNzVkMTFjNmUzMGJlIiBzdEV2dDp3aGVuPSIyMDIwLTEwLTA3VDAwOjM3OjMzKzAyOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDxwaG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+IDxyZGY6QmFnPiA8cmRmOmxpPkUwN0Y5Mzk1MDhFQTM3QzU4REI4NUVCQUE0NTFGRjUzPC9yZGY6bGk+IDwvcmRmOkJhZz4gPC9waG90b3Nob3A6RG9jdW1lbnRBbmNlc3RvcnM+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+/vYkRwAAARRJREFUKBVj+P//PwMWzAXEz4D4LA55BmTOEiCeDcTdUBoG+qBiC4F4OrpGQyD+C8R5UD4rEJ8G4nlAzAkVqwbiL0CsgaxxIhBrA3ENECtBxc5DXQFiGwBxMVRNH0yjGxBPgCpIAuJGKPsSEK+AsruAOBjKngbEVgxQEzSQ/NoOxEJAvB/qEhEg7kCSNwEZBGLEA7E0EKsAsRwQ+wGxGhDvAOIeqLgvECtA2fIgPSCNr/9jAjEgXgnE9UDMjUX+HQM0JJHBUaiTQPQcKPsgmppSmLtdof7IRvLLZaitMH4GVI0negJAx6DoWEpMykHHx4F4KrEa2YDYHohrgfgHED8F4hIgNsWnsQqI7/7HDS4CcQpMPQBC9I8A38nA5AAAAABJRU5ErkJggg== "License: MPLv2")](LICENSE.md)

> Creates and connects to the specified VPN connection.

Creates a VPN network (if not exists) with the specified parameters (or the first VPN connection, if none specified) and connects (if not already connected).

## Usage

### Syntax

```powershell
Connect-VPN [[-VpnName] <String>] [[-ServerAddress] <String>] [[-AuthenticationMethod] <String>] [[-EncryptionLevel] <String>] [[-TunnelType] <String>] [[-Certificate] <X509Certificate2>] [[-UserName] <String>] [[-Password] <SecureString>] [[-NetRoutes] <String[]>] [<CommonParameters>]
```

### Examples

```powershell
Connect-VPN
```

Connects (if any and is not connected) to the first VPN connection stored.

```powershell
Connect-VPN -VpnName MyVpnConnection
```

Connects (if exists and is not connected) to the specified -VpnName.

```powershell
Connect-VPN -VpnName MyVpnConnection -NetRoutes 192.168.1.0/24
```

Connects (if exists and is not connected) to the specified -VpnName and adds the specified -NetRoutes.

```powershell
Connect-VPN -VpnName MyVpnConnection -NetRoutes 192.168.1.0/24 -Certificate <X509Certificate2>
```

Connects (if exists and is not connected) to the specified -VpnName and adds the specified -NetRoutes and -Certificate.

```powershell
Connect-VPN -NetRoutes 192.168.1.0/24
```

Connects (if any and is not connected) to the first VPN connection stored and adds the specified -NetRoutes.

```powershell
Connect-VPN -VpnName MyVpnConnection -ServerAddress 192.168.1.1
```

Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected).

```powershell
Connect-VPN -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -NetRoutes 192.168.1.0/24
```

Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) and adds the specified -NetRoutes.

```powershell
Connect-VPN -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe
```

Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName and request the password.

```powershell
Connect-VPN -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe -NetRoutes 192.168.1.0/24
```

Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName, request the password and adds the specified -NetRoutes.

```powershell
Connect-VPN -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText)
```

Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName and -Password (specified as a secure string).

```powershell
Connect-VPN -VpnName MyVpnConnection -ServerAddress 192.168.1.1 -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText) -NetRoutes 192.168.1.0/24
```

Installs (if not exists) or updates the configuration of the specified -VpnName and connects (if not connected) to the specified -VpnName with the specified -UserName and -Password (specified as a secure string) and adds the specified -NetRoutes.

```powershell
Connect-VPN -VpnName MyVpnConnection -UserName jdoe
```

Connects to the VPN connection specified by -VpnName (if exists) with the specified -UserName and request the password.

```powershell
Connect-VPN -VpnName MyVpnConnection -UserName jdoe -NetRoutes 192.168.1.0/24
```

Connects to the VPN connection specified by -VpnName (if exists) with the specified -UserName, request the password and adds the specified -NetRoutes.

```powershell
Connect-VPN -VpnName MyVpnConnection -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText)
```

Connects to the VPN connection (if exists and is not connected) with the specified -UserName and -Password (specified as a secure string).

```powershell
Connect-VPN -VpnName MyVpnConnection -UserName jdoe -Password $(ConvertTo-SecureString "****" -AsPlainText) -NetRoutes 192.168.1.0/24
```

Connects to the VPN connection (if exists and is not connected) with the specified -UserName, -Password (specified as a secure string) and adds the specified -NetRoutes.

## Parameters

### -VpnName &lt;String&gt;

The VPN connection name.

```
Mandatory:                  false
Position:                   1
Default value:              None
Accept pipeline input:      false
Accept wildcard characters: false
```

### -ServerAddress &lt;String&gt;

The VPN server address.

```
Mandatory:                  false
Position:                   2
Default value:              None
Accept pipeline input:      false
Accept wildcard characters: false
```

### -AuthenticationMethod &lt;String&gt;

The authentication method to use for the VPN connection.

```
Mandatory:                  false
Position:                   3
Default value:              EAP
Accept pipeline input:      false
Accept wildcard characters: false
```

### -EncryptionLevel &lt;String&gt;

The encryption level for the VPN connection.

```
Mandatory:                  false
Position:                   4
Default value:              Optional
Accept pipeline input:      false
Accept wildcard characters: false
```

### -TunnelType &lt;String&gt;

The type of tunnel used for the VPN connection.

```
Mandatory:                  false
Position:                   5
Default value:              Automatic
Accept pipeline input:      false
Accept wildcard characters: false
```

### -Certificate &lt;X509Certificate2&gt;

A certificate to verify the VPN connection.

```
Mandatory:                  false
Position:                   6
Default value:              None
Accept pipeline input:      false
Accept wildcard characters: false
```

### -UserName &lt;String&gt;

An authorized user name.

```
Mandatory:                  false
Position:                   7
Default value:              None
Accept pipeline input:      false
Accept wildcard characters: false
```

### -Password &lt;SecureString&gt;

The password for the specified user name.

```
Mandatory:                  false
Position:                   8
Default value:              None
Accept pipeline input:      false
Accept wildcard characters: false
```

### -NetRoutes &lt;String[]&gt;

The destination routes to map to the VPN connection.

```
Mandatory:                  false
Position:                   9
Default value:              None
Accept pipeline input:      false
Accept wildcard characters: false
```

## Maintainer

[@Luiyi](https://github.com/lperezperez)

## Contribute

This repository follows the [Contributors covenant code of conduct](https://www.contributor-covenant.org/version/2/0).

## License

Under [MIT license](LICENSE.md) terms.
