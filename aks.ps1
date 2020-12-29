$resourcegroup = "k8s-rg"
$location      = "australiaeast"
$clustername   = "k8s-akscluster"

az group create --name $resourcegroup --location $location

az aks create --resource-group $resourcegroup `
  --name $clustername `
  --kubernetes-version 1.19.3 `
  --node-vm-size Standard_DS2_v2 `
  --node-count 1 `
  --enable-addons monitoring `
  --generate-ssh-keys

  az aks get-credentials `
   --resource-group $resourcegroup `
   --name $clustername

kubectl get nodes