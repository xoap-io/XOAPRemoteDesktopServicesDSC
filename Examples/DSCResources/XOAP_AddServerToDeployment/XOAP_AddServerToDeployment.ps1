configuration 'XOAP_AddServerToDeployment'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_AddServerToDeployment' -ModuleVersion '0.0.1'
    
    XOAP_AddServerToDeployment 'Example'
    {
	    ConnectionBrokerName [String]= 'connectionbroker.domain.com'
	    Servername [String]= 'hostname.domain.com'
	    ServerRole [String]= 'RDS-Virtualization'
    }
}
XOAP_AddServerToDeployment -OutputPath 'C:\XOAP_AddServerToDeployment'
