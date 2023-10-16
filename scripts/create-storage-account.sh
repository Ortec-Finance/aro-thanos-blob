export AZR_RESOURCE_LOCATION=westeurope
export AZR_RESOURCE_GROUP=rg-labs-001
export AZR_STORAGE_ACCOUNT_NAME=arometricshnha0

az storage account create \
  --name $AZR_STORAGE_ACCOUNT_NAME \
  --resource-group $AZR_RESOURCE_GROUP \
  --location $AZR_RESOURCE_LOCATION \
  --sku Standard_RAGRS \
  --kind StorageV2

AZR_STORAGE_KEY=$(az storage account keys list -g $AZR_RESOURCE_GROUP \
  -n $AZR_STORAGE_ACCOUNT_NAME --query "[0].value" -o tsv)

echo "Put this key in your Secrets: $AZR_STORAGE_KEY" 