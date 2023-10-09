configuration 'XOAP_QuickStartConfiguration'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBrokerServerName,
        [Parameter(Mandatory = $true)]
        [System.String]$SessionHostServerName,
        [Parameter(Mandatory = $true)]
        [System.String]$AllowedUserGroup
    )

        WindowsFeature 'XOAP_ConnectionBrokerFeatureInstallation'
        {
            Ensure = 'Present'
            Name   = 'RDS-Connection-Broker'
        }

        WindowsFeature 'XOAP_LicenseServerFeatureInstallation'
        {
            Ensure = 'Present'
            Name   = 'RDS-Licensing'
        }

        WindowsFeature 'XOAP_WebAccessFeatureInstallation'
        {
            Ensure = 'Present'
            Name   = 'RDS-Web-Access'
        }

        xRDSessionDeployment 'XOAP_SessionDeployment'
        {
            SessionHost = $SessionHostServerName
            ConnectionBroker = $ConnectionBrokerServerName
            WebAccessServer = $ConnectionBrokerServerName
        }

        Script 'XOAP_AddLicenseServerToDeployment'
        {
            SetScript =
    {
                Import-Module -name 'RemoteDesktop'
                Add-RDServer -Server $using:ConnectionBrokerServerName -Role "RDS-Licensing" -ConnectionBroker $using:ConnectionBrokerServerName
            }
            TestScript = {
                Import-Module -Name 'RemoteDesktop'

                if(!(Get-RDServer | where-object {$_.Server -eq $using:ConnectionBrokerServerName}))
                {
                    return $false
                }
                else {return $true}
            }
            GetScript = {
           }
        }

        xRDLicenseConfiguration 'XOAP_MyLicenseServer'
        {
            ConnectionBroker = $ConnectionBrokerServerName
            LicenseMode = 'PerUser'
            LicenseServer = $ConnectionBrokerServerName
        }

        xRDSessionCollection 'XOAP_SessionCollection'
        {
            CollectionName = "RemoteApplications"
            SessionHost = $SessionHostServerName
            ConnectionBroker = $ConnectionBrokerServerName
            CollectionDescription = "Collection for publishing applications"
        }

        xRDSessionCollectionConfiguration 'XOAP_SessionCollectionConfiguration'
            {
                CollectionName = "RemoteApplications"
                CollectionDescription = "Collection for publishing applications"
                ConnectionBroker = $ConnectionBrokerServerName
                UserGroup = $AllowedUserGroup
                ActiveSessionLimitMin = 0
                BrokenConnectionAction = 'Disconnect'
                AutomaticReconnectionEnabled = $True
                DisconnectedSessionLimitMin = 30
                IdleSessionLimitMin = 1440 # One day
                TemporaryFoldersDeletedOnExit = $True
                RDEasyPrintDriverEnabled = 0
                MaxRedirectedMonitors = 2
                ClientPrinterRedirected = 0
                ClientDeviceRedirectionOptions = 'AudioVideoPlayBack, AudioRecording, Clipboard'
                ClientPrinterAsDefault = 0
                AuthenticateUsingNLA = $True
                EncryptionLevel = 'Low'
                SecurityLayer = 'RDP'
        }

        xRDRemoteApp 'XOAP_Notepad++' {
                Alias = 'Notepad++'
                CollectionName = 'RemoteApplications'
                CommandLineSetting = 'DoNotAllow'
                DisplayName = 'Notepad++'
                FilePath = 'C:\Program Files\Notepad++\notepad++.exe'
                IconPath = 'C:\Program Files\Notepad++\notepad++.exe'
                ShowInWebAccess = $True
                UserGroups = $AllowedUserGroup
                FileVirtualPath = 'C:\Program Files\Notepad++\notepad++.exe'
        }

        xRDRemoteApp 'XOAP_AdobeAcrobadReader' {
                Alias = 'AdobeAcrobatReader'
                CollectionName = 'RemoteApplications'
                CommandLineSetting = 'DoNotAllow'
                DisplayName = 'AdobeAcrobatReader'
                FilePath = 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
                IconPath = 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
                ShowInWebAccess = $True
                UserGroups = $AllowedUserGroup
                FileVirtualPath = 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
        }
}
