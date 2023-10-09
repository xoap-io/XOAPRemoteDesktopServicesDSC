configuration 'XOAP_NewRemoteApp'
{
    Import-DSCResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'xRemoteDesktopSessionHost' -ModuleVersion '2.1.0'

    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]$Alias,
        [Parameter(Mandatory = $true)]
        [System.String]$CollectionName,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]$Ensure,
        [Parameter(Mandatory = $true)]
        [System.String]$DisplayName,
        [Parameter(Mandatory = $true)]
        [System.String]$FilePath,
        [Parameter(Mandatory = $true)]
        [System.String]$FileVirtualPath,
        [Parameter(Mandatory = $false)]
        [System.String]$FolderName,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Allow','DoNotAllow','Require')]
        [System.String]$CommandLineSetting,
        [Parameter(Mandatory = $false)]
        [System.String]$RequiredCommandLine,
        [Parameter(Mandatory = $false)]
        [System.String]$IconIndex,
        [Parameter(Mandatory = $false)]
        [System.String]$IconPath,
        [Parameter(Mandatory = $true)]
        [System.String]$UserGroups,
        [Parameter(Mandatory = $false)]
        [System.Boolean]$ShowInWebAccess
    )

        xRDRemoteApp 'RemoteApp'
        {
            Alias = $Alias
            CollectionName = $CollectionName
            Ensure = $Ensure
            DisplayName = $DisplayName
            FilePath = $FilePath
            FileVirtualPath = $FileVirtualPath
            FolderName = $FolderName
            CommandLineSetting = $CommandLineSetting
            RequiredCommandLine = $RequiredCommandLine
            IconIndex = $IconIndex
            UserGroups = $UserGroups
            ShowInWebAccess = $ShowInWebAccess
        }
}
