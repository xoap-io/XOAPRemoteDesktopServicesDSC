Configuration 'XOAPRemoteDesktopServicesDSC'
{
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_AddServerToCollection' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_AddServerToDeployment' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureCertificateConfiguration' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureLicenseServer' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_ConfigureSesseionHostCollection' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewRDSDeployment' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewRemoteApp' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewSessionHostCollection' -ModuleVersion '0.0.1'
    Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_QuickStartConfiguration' -ModuleVersion '0.0.1'

    Node 'XOAPRemoteDesktopServicesDSC'
    {
        XOAP_AddServerToCollection 'AddServerToCollection'
        {
        }
        XOAP_AddServerToDeployment 'AddServerToDeployment'
        {
        }
        XOAP_ConfigureCertificateConfiguration 'ConfigureCertificateConfiguration'
        {
        }
        XOAP_ConfigureLicenseServer 'ConfigureLicenseServer'
        {
        }
        XOAP_ConfigureSesseionHostCollection 'ConfigureSesseionHostCollection'
        {
        }
        XOAP_NewRDSDeployment 'NewRDSDeployment'
        {
        }
        XOAP_NewRemoteApp 'NewRemoteApp'
        {
        }
        XOAP_NewSessionHostCollection 'NewSessionHostCollection'
        {
        }
        XOAP_QuickStartConfiguration 'QuickStartConfiguration'
        {
        }
    }
}
XOAPRemoteDesktopServicesDSC -OutputPath 'C:\XOAPRemoteDesktopServicesDSC'
