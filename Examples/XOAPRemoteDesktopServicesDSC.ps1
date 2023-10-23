Configuration 'XOAPRemoteDesktopServicesDSC'
{
	Import-DSCResource -Module 'XOAPRemoteDesktopServicesDSC' -Name 'XOAP_RDSQuickStartConfiguration' -ModuleVersion '0.0.1'

    param
        (
            [string[]]$ConnectionBrokerServerName = 'connectionbroker.domain.com'
            [string[]]$SessionHostServerName = 'sessionhost.domain.com'
            [string[]]$AllowedUserGroup = 'domain\group'
        )

	Node 'XOAPRemoteDesktopServicesDSC'
	{
        XOAP_RDSQuickStartConfiguration 'Example'
            {
                ConnectionBrokerServerName = $ConnectionBrokerServerName
                SessionHostServerName = $$SessionHostServerName
                AllowedUserGroup = $$AllowedUserGroup
            }
	    }
	}
XOAPRemoteDesktopServicesDSC -OutputPath 'C:\XOAPRemoteDesktopServicesDSC'
