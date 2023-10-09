configuration 'XOAP_ConfigureCertificateConfiguration'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureCertificateConfiguration' -ModuleVersion '0.0.1'

    XOAP_ConfigureCertificateConfiguration 'Example'
    {
	    ConnectionBrokerName [String]= 'connectionbroker.domain.com'
	    ImportPath [String]= 'hostname.domain.com'
	    Role [String]= 'RDWebAccess'
    }
}
XOAP_ConfigureCertificateConfiguration -OutputPath 'C:\XOAP_ConfigureCertificateConfiguration'
