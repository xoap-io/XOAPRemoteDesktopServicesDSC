Configuration 'XOAP_NewRDSDeployment'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBrokerName,
        [Parameter(Mandatory = $true)]
        [System.String]$SessionHostName,
        [Parameter(Mandatory = $true)]
        [System.String]$WebAccessServerName
    )

        xRDSessionDeployment 'SessionDeployment'
            {
                SessionHost = $SessionHostName
                ConnectionBroker = $ConnectionBrokerName
                WebAccessServer = $WebAccessServerName
            }
}
