Configuration 'XOAP_NewSessionHostCollection'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$CollectionName,
        [Parameter(Mandatory = $true)]
        [System.String]$SessionHosts,
        [Parameter(Mandatory = $false)]
        [System.String]$CollectionDescription,
        [Parameter(Mandatory = $false)]
        [System.String]$ConnectionBrokerName
    )

        Script 'CreateNewCollection'
        {
            SetScript =
            {
                Import-Module -name 'RemoteDesktop'
                New-RDSessionCollection -CollectionName $using:CollectionName -CollectionDescription $using:CollectionDescription -SessionHost $using:SessionHosts
            }
            TestScript = {
                Import-Module -Name 'RemoteDesktop'
    
                if(!(Get-RDSessionCollection | Where-Object {$_.CollectionName -eq $using:CollectionName}))
                {
                    return $false
                }
                else {return $true}
            }
            GetScript = {
            }
        }
}
