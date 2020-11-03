resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
    name: 'CHANGEME_TO_A_UNIQUE_NAME'
    location: 'eastus'
    kind: 'Storage'
    sku: {
        name: 'Standard_LRS'
    }
}