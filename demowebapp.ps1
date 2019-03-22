# demoWebapp.ps1

Function New-demoAzureWebApp{
    Param (
        [Parameter(Mandatory=$true)]
        [string]$rgName,
        [Parameter(Mandatory=$false)]
        [string]$location,
        [Parameter(Mandatory=$false)]
        [string]$appServicePlanName,
        [Parameter(Mandatory=$false)]
        [string]$webappName
    )

   if (-Not ($PSBoundParameters.ContainsKey('appServicePlanName'))){
        $appServicePlanName = $rgName + '-appserviceplan'        
   }
   if (-Not ($PSBoundParameters.ContainsKey('webappName'))){
        $webappName = $rgName + '-web'        
   }
   
   Write-Host $appServicePlanName
   az appservice plan create --name $appServicePlanName --resource-group $envRg --location eastus2 --sku F1 --tags 'env=development'

   az webapp create --name $webappName --plan $appServicePlanName --resource-group $rgName
}

