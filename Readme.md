<<<<<<< HEAD
# XOAPRemoteDesktopServicesDSC

This repository contains a PowerShell DSC module for the deployment of a complete Remote Desktop Services environment.

## Code of Conduct

This project has adopted this [Code of Conduct](CODE_OF_CONDUCT.md).

## Contributing

Please check out common DSC Community [contributing guidelines](https://dsccommunity.org/guidelines/contributing).

## Change log

A full list of changes in each version can be found in the [Releases](https://github.com/xoap-io/XOAPRemoteDesktopServicesDSC/releases).

## Documentation

The XOAP demo configuration DSC module contains examples for the following resources:

## Prerequisites

Be sure that the following DSC modules are installed on your system:

- xRemoteDesktopSessionHost (2.1.0)

## DSC Resources and syntax

### XOAP_AddServerToCollection

```PowerShell
XOAP_AddServerToCollection [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [ConnectionBrokerName = [String]]
        [CollectioNname = [String]]
        [ServerName = [String]]
    }
```

### XOAP_AddServerToDeployment

```PowerShell
XOAP_AddServerToDeployment [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [ConnectionBrokerName = [String]]
        [ServerName = [String]]
        [ServerRole = [String]] #'RDS-Virtualization','RDS-RD-Server','RDS-Connection-Broker','RDS-Web-Access','RDS-Gateway','RDS-Licensing'
    }
```

### XOAP_ConfigureCertificateConfiguration

```PowerShell
XOAP_ConfigureCertificateConfiguration [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [ConnectionBrokerName = [String]]
        [ImportPath = [String]]
        [Role = [String]] #'RDRedirector', 'RDPublishing', 'RDWebAccess', 'RDGateway'
    }
```

### XOAP_ConfigureLicenseServer

```PowerShell
XOAP_ConfigureLicenseServer [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [ConnectionBrokerName = [String]]
        [LicenseServer = [String]]
        [LicenseMode = [String]] #'PerUser', 'PerDevice','NotConfigured
    }
```

### XOAP_ConfigureSessionHostCollection

```PowerShell
XOAP_ConfigureSessionHostCollection [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [ColletionName = [String]]
        [AuthenticateUsingNLA = [boolean]]
        [ActiveSessionLimit = [Int32]]
        [AutomaticReconnectionEnabled = [boolean]]
        [BrokenConnectionAction = [String]] #'None', 'Disconnect', 'LogOff'
        [ClientDeviceRedirectionOptions = [String]] #'None','AudioVideoPlayBack', 'AudioRecording', 'COMPort', 'PlugAndPlayDevice', 'SmartCard', 'Clipboard', 'LPTPort', 'Drive', 'TimeZone'
        [ClientPrinterAsDefault = [boolean]]
        [ClientPrinterRedirected = [boolean]]
        [CollectionDescription = [String]]
        [ConnectionBroker = [String]]
        [DisconnectedSessionLimit = [Int32]]
        [EncryptionLevel = [String]] #'None', 'Low', 'ClientCompatible', 'High', 'FipsCompliant'
        [IdleSessionLimit = [Int32]]
        [MaxRedirectedMonitors = [Int32]] #from 1 to 16
        [RDEasyPrintDriverEnabled = [boolean]]
        [SecurityLayer = [String]] #'RDP', 'Negotiate', 'SSL'
        [TemporaryFoldersDeletedOnExit = [boolean]]
        [UserGroup = [String]]
        [DiskPath = [String]]
        [EnableUserProfileDisk = [boolean]]
        [ExcludeFilePath = [String]]
        [ExcludeFolderPath = [String]]
        [IncludeFilePath = [String]]
        [IncludeFolderPath = [String]]
        [MaxUserProfileDiskSizeGB = [Int32]]
    }
```

### XOAP_NewRDSDeployment

```PowerShell
XOAP_NewRDSDeployment [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [XOAP_NewRDSDeployment = [String]]
        [SessionHostName = [String]]
        [WebAccessServerName = [String]]
    }
```

### XOAP_NewRemoteApp

```PowerShell
XOAP_NewRemoteApp [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [Alias = [String]]
        [CollectionName = [String]]
        [Ensure = [String]] #'Present','Absent'
        [DisplayName = [String]]
        [FilePath = [String]]
        [FileVirtualPath = [String]]
        [FolderName = [String]]
        [CommandLineSetting = [String]] #'Allow','DoNotAllow','Require'
        [RequiredCommandLine = [String]]
        [IconIndex = [String]]
        [IconPath = [String]]
        [UserGroups = [String]]
        [ShowInWebAccess = [boolean]]
    }
```

### XOAP_NewSessionHostCollection

```PowerShell
XOAP_NewSessionHostCollection [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [CollectionName = [String]]
        [SessionHosts = [String]]
        [CollectionDescription = [String]]
        [ConnectionBrokerName = [String]]
    }
```

### XOAP_QuickConfiguration

```PowerShell
XOAP_QuickConfiguration [String] #ResourceName
    {
        [DependsOn = [String[]]]
        [PsDscRunAsCredential = [PSCredential]]
        [ConnectionBrokerServerName = [String]]
        [SessionHostServerName = [String]]
        [AllowedUserGroup = [String]]
    }
```

## Configuration examples for each resource

To implement the Remote Desktop Services DSC module, add the following resources to your DSC configuration and adjust the parameters accordingly:

### Add server to a collection

```PowerShell
Configuration 'XOAP_AddServerToCollection'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_AddServerToCollection' -ModuleVersion '0.0.1'
    
    XOAP_AddServerToCollection 'Example'
    {
	    ConnectionBrokerName [String]= 'connectionbroker.domain.com'
	    CollectionName [String]= 'Example'
	    ServerName [String]= 'hostname.domain.com'
    }
}
XOAP_AddServerToCollection
```
 
### Add a server to the RDS deployment

```PowerShell
Configuration 'XOAP_AddServerToDeployment'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_AddServerToDeployment' -ModuleVersion '0.0.1'
    
    XOAP_AddServerToDeployment 'Example'
    {
	    ConnectionBrokerName [String]= 'connectionbroker.domain.com'
	    Servername [String]= 'hostname.domain.com'
	    ServerRole [String]= 'RDS-Virtualization'
    }
}
XOAP_AddServerToDeployment
```

### Certificate configuration	

```PowerShell
Configuration 'XOAP_ConfigureCertificateConfiguration'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureCertificateConfiguration' -ModuleVersion '0.0.1'

    XOAP_ConfigureCertificateConfiguration 'Example'
    {
	    ConnectionBrokerName [String]= 'connectionbroker.domain.com'
	    ImportPath [String]= 'hostname.domain.com'
	    Role [String]= 'RDWebAccess'
    }
}
XOAP_ConfigureCertificateConfiguration
```

### Configure license server

```PowerShell
Configuration 'XOAP_ConfigureLicenseServer'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureLicenseServer' -ModuleVersion '0.0.1'

    XOAP_ConfigureLicenseServer 'Example'
    {
        ConnectionBrokerName [String]= 'connectionbroker.domain.com'
        LicenseServer [String]= 'licenseserver.domain.com'
        LicenseMode [String]= 'PerUser'
    }
}
XOAP_ConfigureLicenseServer
```

### Configure Session Host Collection

```PowerShell
Configuration 'XOAP_ConfigureSessionHostCollection'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureSessionHostCollection' -ModuleVersion '0.0.1'
    
    XOAP_ConfigureSessionHostCollection 'Example'
    {
        CollectionName = 'Example'
        AuthenticateUsingNLA = $true
        ActiveSessionLimit = 0
        AutomaticReconnectionEnabled = $true
        BrokenConnectionAction = 'None'
        ClientDeviceRedirectionOptions = 'None'
        ClientPrinterAsDefault = $true
        ClientPrinterRedirected = $true
        CollectionDescription = 'Example'
        ConnectionBroker = 'connectionbroker.domain.com'
        DisconnectedSessionLimit = 0
        EncryptionLevel = 'High'
        IdleSessionLimit = 0
        MaxRedirectedMonitors = 1
        RDEasyPrintDriverEnabled = $true
        SecurityLayer = 'SSL'
        TemporaryFoldersDeletedOnExit = $true
        UserGroup = 'domain\group'
        DiskPath = 'C:\'
        EnableUserProfileDisk = $true
        ExcludeFilePath = 'C:\'
        ExcludeFolderPath = 'C:\'
        IncludeFilePath = 'C:\'
        IncludeFolderPath = 'C:\'
        MaxUserProfileDiskSizeGB = 10
    }
}
XOAP_ConfigureSessionHostCollection
```

### New RDS deployment

```PowerShell
Configuration 'XOAP_NewRDSDeployment'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewRDSDeployment' -ModuleVersion '0.0.1'
    
    XOAP_NewRDSDeployment 'Example'
    {
        XOAP_NewRDSDeployment = 'Example'
        SessionHostName = 'hostname.domain.com'
        WebAccessServerName = 'webaccess.domain.com'
    }
}
XOAP_NewRDSDeployment
```

### New Remote App

```PowerShell
Configuration 'XOAP_NewRemoteApp'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewRemoteApp' -ModuleVersion '0.0.1'
    
    XOAP_NewRemoteApp 'Example'
    {
        Alias = 'Example'
        CollectionName = 'Example'
        Ensure = 'Present'
        DisplayName = 'Example'
        FilePath = 'C:\'
        FileVirtualPath = 'C:\'
        FolderName = 'Example'
        CommandLineSetting = 'Allow'
        RequiredCommandLine = 'C:\'
        IconIndex = '0'
        IconPath = 'C:\'
        UserGroups = 'domain\group'
        ShowInWebAccess = $true
    }
}
XOAP_NewRemoteApp
```

### New Session Host Collection

```PowerShell
Configuration 'XOAP_NewSessionHostCollection'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewSessionHostCollection' -ModuleVersion '0.0.1'
    
    XOAP_NewSessionHostCollection 'Example'
    {
        CollectionName = 'Example'
        SessionHosts = 'hostname.domain.com'
        CollectionDescription = 'Example'
        ConnectionBrokerName = 'connectionbroker.domain.com'
    }
}
XOAP_NewSessionHostCollection
```

### Quick configuration

```PowerShell
Configuration 'XOAP_QuickConfiguration'
{
Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_QuickStartConfiguration' -ModuleVersion '0.0.1'
    
    XOAP_QuickStartConfiguration 'Example'
    {
        ConnectionBrokerServerName = 'connectionbroker.domain.com'
        SessionHostServerName = 'hostname.domain.com'
        AllowedUserGroup = 'domain\group'
    }
}
XOAP_QuickStartConfiguration
```

### Example DSC configuration

```PowerShell
Configuration 'XOAPRemoteDesktopServicesDSC'
{
	Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_QuickStartConfiguration' -ModuleVersion '0.0.1'

    param
    (
        [string[]]$ConnectionBrokerServerName = 'connectionbroker.domain.com'
        [string[]]$SessionHostServerName = 'sessionhost.domain.com'
        [string[]]$AllowedUserGroup = 'domain\group'
    )
    
	Node 'XOAPRemoteDesktopServicesDSC'
	{
        XOAP_QuickConfiguration 'Example'
            {
                ConnectionBrokerServerName = 'connectionbroker.domain.com'
                SessionHostServerName = 'hostname.domain.com'
                AllowedUserGroup = 'domain\group'
            }
    } 
}
XOAPRemoteDesktopServicesDSC -OutputPath 'C:\XOAPRemoteDesktopServicesDSC'
```
## Quick deployment with XOAP and config.XO

For a basic installation, you need a minimum of two Windows Server 2016 nodes. One node will be the RD Connection Broker, and the other node will be the RD Session Host.
Additionally, you need to open the following ports on your nodes to our backend API at https://api.xoap.io.

### Create new parameter for your domain user with admin rights on the nodes

Go to Configuration Management --> Parameters-->

Add Parameter and fill in required information. 

![1.png](docs%2Fimg%2F1.png)

### Adjust existing configuration with your values

Go to Configuration Management --> Configurations --> 
 
Find **XOAP_RDS_Infrastructure** configuration.

![2.png](docs%2Fimg%2F2.png)

Click on the action menu--> Click **Edit**

![3.png](docs%2Fimg%2F3.png)

Set PsDscRunAsCredential parameter --> From the drop-down menu select your previously created user.

Set ConnectionBrokerServerName --> FQDN of the server which will be connection broker.

Set SessionHostServerName--> FQDN of the server which will be session host.

Set AllowedUserGroup--> Active Directory name of the group of users which will have access to the published applications.

![4.png](docs%2Fimg%2F4.png)

## Register Nodes

Download the registration script for the infrastructure node:

![5.png](docs%2Fimg%2F5.png)

Run the script on your infrastructure node.

> Be sure to run the script as administrator in PowerShell 5.1

Download the registration script for the session host node:

![6.png](docs%2Fimg%2F6.png)

> Be sure to run the script as administrator in PowerShell 5.1

After a few minutes, your nodes should show up as compliant in XOAP.
=======
A full list of changes in each version can be found in the [Releases](https://github.com/xoap-io/XOAPRemoteDesktopServicesDSC/releases).

## Documentation

This script is used to easily create new DSC modules and resources.

## Prerequisites

Please install Plaster first and make sure it's present.

```powershell
Install-Module Plaster
Import-Module Plaster
```

## Create new DSC modules

Modules will be automatically created once you are creating a new DSC resource.

## Create new DSC resources

DSC resources can easily be deployed via the invocation of

```powershell
.\New-CompositeResource.ps1
```

with parameters

```powershell
.\New-CompositeResource.ps1 -Module XOAPModuleTemplateDSC -Version 0.0.1 -Resource ScheduledTasks
```

The parameter list is as followed:

| Parameter | Description                            | Note |
|-----------|----------------------------------------|------|
| Module    | Name of the outer module part          | -    |
| Version   | Target version of the module           | -    |
| Ressource | The name of the ressource /config part | -    |

### Examples

You can review the [Examples](/Examples/Resources) directory in the **XOAPModuleTemplateDSC** module
for some general use scenarios for all the resources that are in the module.
