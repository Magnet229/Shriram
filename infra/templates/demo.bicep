param storageAccprefix string

param acr_name string = 'ramtrial'
param asb_name string = 'ramtrial'
param location string = resourceGroup().location
var stracc = '${storageAccprefix}${uniqueString(resourceGroup().id)}' 


resource storage_account 'Microsoft.StorageActions/storageTasks@2023-01-01'= {
  name: stracc
  location: location
  sku : {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource container_registery 'Microsoft.ContainerRegistry/registries/cacheRules@2025-04-01' = {
  name: acr_name
  location: location
  sku: {
    name: 'Basic'
  }
  properties:{
    adminUserEnabled : true
  }
}

resource asb 'Microsoft.ServiceBus/namespaces@2024-01-01'= {
  name: asb_name
  location: location
}
