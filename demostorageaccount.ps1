# demostorageaccount.ps1

# creates a storage account 
Function New-demoStorageAccount {
    Param(
        [Parameter(Mandatory=$true)]
        [string] $rgName,
        [Parameter(Mandatory=$true)]
        [string] $location,
        [Parameter(Mandatory=$false)]
        [string] $storageAccountName
    )

     if (-Not ($PSBoundParameters.ContainsKey('storageAccountName'))){
        $serverName = $rgName + 'stg'        
    }

    az storage account create --name $serverName --resource-group $rgName --location $location
}