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
XOAP_ConfigureSessionHostCollection -OutputPath 'C:\XOAP_ConfigureSessionHostCollection'
