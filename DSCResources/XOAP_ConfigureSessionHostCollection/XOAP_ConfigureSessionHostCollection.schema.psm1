configuration 'XOAP_ConfigureSessionHostCollection'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$CollectionName,
        [Parameter(Mandatory = $false)]
        [System.Int32]$ActiveSessionLimitMin,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$AuthenticateUsingNLA,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$AutomaticReconnectionEnabled,
        [Parameter(Mandatory = $true)]
        [ValidateSet('None', 'Disconnect', 'LogOff')]
        [System.String]$BrokenConnectionAction,
        [Parameter(Mandatory = $true)]
        [ValidateSet('None','AudioVideoPlayBack', 'AudioRecording', 'COMPort', 'PlugAndPlayDevice', 'SmartCard', 'Clipboard', 'LPTPort', 'Drive', 'TimeZone')]
        [System.String]$ClientDeviceRedirectionOptions,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$ClientPrinterAsDefault,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$ClientPrinterRedirected,
        [Parameter(Mandatory = $false)]
        [System.String]$CollectionDescription,
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBroker,
        [Parameter(Mandatory = $false)]
        [System.Int32]$DisconnectedSessionLimitMin,
        [Parameter(Mandatory = $true)]
        [ValidateSet('None', 'Low', 'ClientCompatible', 'High', 'FipsCompliant')]
        [System.String]$EncryptionLevel,
        [Parameter(Mandatory = $false)]
        [System.Int32]$IdleSessionLimitMin,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1,16)]
        [System.Int32]$MaxRedirectedMonitors,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$RDEasyPrintDriverEnabled,
        [Parameter(Mandatory = $true)]
        [ValidateSet('RDP', 'Negotiate', 'SSL')]
        [System.String]$SecurityLayer,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$TemporaryFoldersDeletedOnExit,
        [Parameter(Mandatory = $true)]
        [System.String]$UserGroup,
        [Parameter(Mandatory = $false)]
        [System.String]$DiskPath,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$EnableUserProfileDisk,
        [Parameter(Mandatory = $false)]
        [System.String]$ExcludeFilePath,
        [Parameter(Mandatory = $false)]
        [System.String]$ExcludeFolderPath,
        [Parameter(Mandatory = $false)]
        [System.String]$IncludeFilePath,
        [Parameter(Mandatory = $false)]
        [System.String]$IncludeFolderPath,
        [Parameter(Mandatory = $false)]
        [System.Int32]$MaxUserProfileDiskSizeGB
    )

        xRDSessionCollectionConfiguration 'CollectionConfiguration'
        {
            CollectionName = $CollectionName
            ActiveSessionLimitMin = $ActiveSessionLimitMin
            AuthenticateUsingNLA = $AuthenticateUsingNLA
            AutomaticReconnectionEnabled = $AutomaticReconnectionEnabled
            BrokenConnectionAction = $BrokenConnectionAction
            ClientDeviceRedirectionOptions = $ClientDeviceRedirectionOptions
            ClientPrinterAsDefault = $ClientPrinterAsDefault
            ClientPrinterRedirected = $ClientPrinterRedirected
            CollectionDescription = $CollectionDescription
            ConnectionBroker = $ConnectionBroker
            DisconnectedSessionLimitMin = $DisconnectedSessionLimitMin
            EncryptionLevel = $EncryptionLevel
            IdleSessionLimitMin = $IdleSessionLimitMin
            MaxRedirectedMonitors = $MaxRedirectedMonitors
            RDEasyPrintDriverEnabled = $RDEasyPrintDriverEnabled
            SecurityLayer = $SecurityLayer
            TemporaryFoldersDeletedOnExit = $TemporaryFoldersDeletedOnExit
            UserGroup = $UserGroup
            DiskPath = $DiskPath
            EnableUserProfileDisk = $EnableUserProfileDisk
            ExcludeFilePath = $ExcludeFilePath
            ExcludeFolderPath = $ExcludeFolderPath
            IncludeFilePath = $IncludeFilePath
            IncludeFolderPath = $IncludeFolderPath
            MaxUserProfileDiskSizeGB = $MaxUserProfileDiskSizeGB
        }
}
