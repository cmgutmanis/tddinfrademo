# demosqlserver.ps1

Function New-demoSqlServer{
    Param(
        [Parameter(Mandatory=$true)]
        [string] $rgName,
        [Parameter(Mandatory=$true)]
        [string] $location,
        [Parameter(Mandatory=$false)]
        [string] $serverName
    )

    if (-Not ($PSBoundParameters.ContainsKey('serverName'))){
        $serverName = $rgName + '-sqlserver'        
    }

    az sql server create --name $serverName --resource-group $rgName --location $location `
        --admin-user saSample --admin-password Password123!

}