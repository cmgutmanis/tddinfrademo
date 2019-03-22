. ".\demoEnvironment.ps1"

$envRg = 'demo'

Describe 'demo Environment Creation Test' {
   
    
    BeforeAll { 
        Write-Host $envRg
        Write-Host 'Creating demo Environment'
    #    New-demoEnvironment -rgName 'demo'
    }

    It "Verifies RG created" {
        $rg = az group show --name $envRg
        $rg | Should Not Be $null
    }

    It "Verifies AppService Plan created" {
        $appServicePlanName = $envRg + '-appserviceplan'
        $appServicePlan = az appservice plan show --name $appServicePlanName --resource-group $envRg
        $appServicePlan | Should Not Be $null
    }

    It "Verifies AppService Plan is on free tier (F1)"{
        $appServicePlanName = $envRg + '-appserviceplan'
        $sku = az appservice plan show --name $appservicePlanName --resource-group $envRg --query sku.size -o tsv
        $sku | Should Be "F1"
    }

    It "Verifies Azure Web App Created" {
        $webappName = $envRg + '-web'
        $webapp = az webapp show --name $webappName --resource-group $envRg
        $webapp | Should Not Be $null
    }

    It "Verifies Azure Key Vault Created" { 
        $keyvaultName = $envRg + '-kv'
        $keyvault = az keyvault show --name $keyvaultName --resource-group $envRg
        $keyvault | Should Not Be $null
    }

    It "Verifies Storage Account Created"{
        $storageAccountName = $envRg + 'stg'
        $storageAccount = az storage account show --resource-group $envRg --name $storageAccountName
        $storageAccount | Should Not Be $null
    }

    It "Verifies SQL Server Created" {
        $sqlServerName = $envRg + '-sqlserver'
        $sqlServer = az sql server show --name $sqlServerName --resource-group $envRg
        $sqlServer | Should Not Be $null
    }

    AfterAll {
        Write-Host "Deleting Environment"
       # az group delete --resource-group $envRg -y
        Write-Host "Cleanup complete."
    }
}