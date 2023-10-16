Configuration 'XOAP_AddServerToDeployment'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBrokerName,
        [Parameter(Mandatory = $true)]
        [System.String]$ServerName,
        [Parameter(Mandatory = $true)]
        [ValidateSet('RDS-Virtualization','RDS-RD-Server','RDS-Connection-Broker','RDS-Web-Access','RDS-Gateway','RDS-Licensing')]
        [System.String]$ServerRole
    )

        Script 'AddServerToTheDeployment'
        {
            SetScript =
            {
                Import-Module -name 'RemoteDesktop'
                Add-RDServer -Server $using:ServerName -Role $using:ServerRole -ConnectionBroker $using:ConnectionBrokerName
            }
            TestScript =
            {
                Import-Module -Name 'RemoteDesktop'

                if(!(Get-RDServer | where-object {$_.Server -eq $using:ServerName}))
                {
                    return $false
                }
                else {return $true}
            }
            GetScript = {
            }
        }
}
