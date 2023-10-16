Configuration 'XOAP_ConfigureLicenseServer'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBrokerName,
        [Parameter(Mandatory = $true)]
        [System.String]$LicenseServer,
        [Parameter(Mandatory = $true)]
        [ValidateSet('PerUser', 'PerDevice','NotConfigured')]
        [System.String]$LicenseMode
    )

        xRDLicenseConfiguration 'LicenseServerConfiguration'
        {
            ConnectionBroker = $ConnectionBrokerName
            LicenseServer = $LicenseServer
            LicenseMode = $LicenseMode
        }
}
