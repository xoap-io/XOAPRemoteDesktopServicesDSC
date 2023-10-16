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
XOAP_NewRDSDeployment -OutputPath 'C:\XOAP_NewRDSDeployment'
