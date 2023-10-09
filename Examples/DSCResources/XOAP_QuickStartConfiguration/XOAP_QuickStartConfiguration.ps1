configuration 'XOAP_QuickConfiguration'
{
Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_QuickStartConfiguration' -ModuleVersion '0.0.1'

    XOAP_QuickStartConfiguration 'Example'
    {
        ConnectionBrokerServerName = 'connectionbroker.domain.com'
        SessionHostServerName = 'hostname.domain.com'
        AllowedUserGroup = 'domain\group'
    }
}
XOAP_QuickStartConfiguration -OutputPath 'C:\XOAP_QuickStartConfiguration'
