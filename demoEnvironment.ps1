. ".\demowebapp.ps1"
. ".\demokeyvault.ps1"
. ".\demosqlserver.ps1"
. ".\demostorageaccount.ps1"

Function New-demoEnvironment {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$rgName,
        [Parameter(Mandatory=$false)]
        [string]$location
    )

    az group create --name $rgName --location eastus

    # Create App Service Plan and Webapp
    New-demoAzureWebApp -rgName $rgName -location eastus

    # Create Key Vault for secret management
    New-demoKeyVault -rgName $rgName -location eastus

    # Create Azure SQL Server Instance.
    New-demoSqlServer -rgName $rgName -location eastus

    New-demoStorageAccount -rgName $rgName -location eastus
}