@description('Name of the virtual network')
param vnetName string = 'rjVnet'

@description('Address prefix for the virtual network')
param vnetAddressPrefix string = '10.0.0.0/20'

@description('Name of the subnet')
param subnetName string = 'rjSubnet'

@description('Address prefix for the subnet')
param subnetPrefix string = '10.0.0.0/26'

@description('Location for the resources')
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}