configuration 'XOAP_NewSessionHostCollection'
{
    Import-DscResource -ModuleName 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_NewSessionHostCollection' -ModuleVersion '0.0.1'

    XOAP_NewSessionHostCollection 'Example'
    {
        CollectionName = 'Example'
        SessionHosts = 'hostname.domain.com'
        CollectionDescription = 'Example'
        ConnectionBrokerName = 'connectionbroker.domain.com'
    }
}
XOAP_NewSessionHostCollection -OutputPath 'C:\XOAP_NewSessionHostCollection'
