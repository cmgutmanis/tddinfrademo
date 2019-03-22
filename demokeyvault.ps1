# demoKeyVault.ps1
# creates an Azure Key Vault
# always sets with soft delete

Function New-demoKeyVault{
    Param(
        [Parameter(Mandatory=$true)]
        [string] $rgName,
        [Parameter(Mandatory=$true)]
        [string] $location,
        [Parameter(Mandatory=$false)]
        [string] $keyvaultName
    )

    if (-Not ($PSBoundParameters.ContainsKey('keyvaultName'))){
        $keyvaultName = $rgName + '-kv'        
    }

   az keyvault create --name $keyvaultName --resource-group $rgName --location $location --enable-soft-delete $true
}