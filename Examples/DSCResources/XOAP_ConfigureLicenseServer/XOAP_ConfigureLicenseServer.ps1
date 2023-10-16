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
XOAP_ConfigureLicenseServer -OutputPath 'C:\XOAP_ConfigureLicenseServer'
