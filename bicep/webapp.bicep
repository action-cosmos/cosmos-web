param name string
param location string = 'westus2'
param sku string
param skucode string
param repositoryUrl string
param branch string

@secure()
param repositoryToken string
param appLocation string
param apiLocation string
param appArtifactLocation string
param resourceTags object
param appSettings object

resource action_cosmos_web 'Microsoft.Web/staticSites@2021-01-15' = {
  name: name
  location: location
  tags: resourceTags
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    repositoryToken: repositoryToken
    buildProperties: {
      appLocation: appLocation
      apiLocation: apiLocation
      appArtifactLocation: appArtifactLocation
    }
  }
  sku: {
    tier: sku
    name: skucode
  }
}
resource action_cosmos_web_appsettings 'Microsoft.Web/staticSites/config@2021-01-15' = {
  parent: action_cosmos_web
  name: 'appsettings'
  properties: appSettings
}
