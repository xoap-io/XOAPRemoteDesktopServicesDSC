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
XOAP_NewRemoteApp -OutputPath 'C:\XOAP_NewRemoteApp'
