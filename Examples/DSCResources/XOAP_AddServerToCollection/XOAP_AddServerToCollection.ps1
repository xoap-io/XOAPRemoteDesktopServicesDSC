configuration 'XOAP_AddServerToCollection'
{
Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_QuickStartConfiguration' -ModuleVersion '0.0.1'
    
    XOAP_AddServerToCollection 'Example'
    {
	    ConnectionBrokerName [String]= 'connectionbroker.domain.com'
	    CollectionName [String]= 'Example'
	    ServerName [String]= 'hostname.domain.com'
    }
}
XOAP_AddServerToCollection -OutputPath 'C:\XOAP_AddServerToCollection'
