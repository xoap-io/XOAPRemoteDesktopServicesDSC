Configuration 'XOAP_AddServerToCollection'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$ConnectionBrokerName,
        [Parameter(Mandatory = $true)]
        [System.String]$CollectionName,
        [Parameter(Mandatory = $true)]
        [System.String]$ServerName
    )

        Script 'AddServerToCollection'
        {
            SetScript = {
                Import-Module -name 'RemoteDesktop'
                Add-RDSessionHost -SessionHost $using:ServerName -CollectionName $using:CollectionName -ConnectionBroker $using:ConnectionBrokerName
            }
            TestScript = {
                Import-Module -Name 'RemoteDesktop'

                if(!(Get-RDSessionHost -CollectionName $using:CollectionName | where-object {$_.SessionHost -eq $using:ServerName}))
                {
                    return $false
                }
                else {return $true}
            }
            GetScript = {
            }
        }
}
