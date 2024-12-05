# These steps reiterate the commands seen at https://developer.humanitec.com/integration-and-extensions/containerization/kubernetes/#2-configure-aks-cluster-access

export AKS_CLUSTER_ID=$(az aks show -n "Quickstart-AKS-749a92" -g "Quickstart-AKS-749a92" --query id -o tsv)

# Assign required roles for cluster access with AKS-managed Microsoft Entra integration
export MANAGED_IDENTITY_PRINCIPAL_ID=$(az identity show \
  -n quickstart-azure-cloudaccount -g Quickstart-AKS-749a92 \
  --query principalId -o tsv)

az role assignment create \
  --role "Azure Kubernetes Service Cluster User Role" \
  --scope ${AKS_CLUSTER_ID} \
  --assignee-object-id "473b40b0-190e-406d-9319-4021de8cab62" \
  --assignee-principal-type "ServicePrincipal"

az role assignment create \
  --role "Azure Kubernetes Service RBAC Cluster Admin" \
  --scope ${AKS_CLUSTER_ID} \
  --assignee-object-id "473b40b0-190e-406d-9319-4021de8cab62" \
  --assignee-principal-type "ServicePrincipal"