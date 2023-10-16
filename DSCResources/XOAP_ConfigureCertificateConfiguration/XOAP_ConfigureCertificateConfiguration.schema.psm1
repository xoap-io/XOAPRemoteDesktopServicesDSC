Configuration 'XOAP_ConfigureCertificateConfiguration'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBrokerName,
        [Parameter(Mandatory = $true)]
        [System.String]$ImportPath,
        [Parameter(Mandatory = $true)]
        [ValidateSet('RDRedirector', 'RDPublishing', 'RDWebAccess', 'RDGateway')]
        [System.String]$role,
        [Parameter(Mandatory = $false)]
        [PSCredential]$Credential
    )

        xRDCertificateConfiguration 'XOAP_CertificateConfiguration'
        {
            ConnectionBroker = $ConnectionBrokerName
            Role = $role
            ImportPath = $ImportPath
            Credential = $Credential
        }
}
