# Groupe mise à l'échelle

#!/bin/bash
# Variables
RESOURCE_GROUP="MyResourceGroup"
SCALE_SET_NAME="WebScaleSet"
LOCATION="eastus"
ADMIN_USERNAME="azureUser"
ADMIN_PASSWORD="AzureUser1234!"  

# Créer le groupe de ressources
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

# Créer le groupe de machines virtuelles à mise à l'échelle
az vmss create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$SCALE_SET_NAME" \
  --image "Win2019Datacenter" \
  --admin-username "$ADMIN_USERNAME" \
  --admin-password "$ADMIN_PASSWORD" \
  --instance-count 2 \
  --upgrade-policy-mode "Automatic" \
  --vm-sku "Standard_DC1s_v2"  

# Vérifier la création du groupe de mise à l'échelle
az vmss list --resource-group "$RESOURCE_GROUP" --output table

# Création d'un profil auto-scaling 
az monitor autoscale create \
  --resource-group "$RESOURCE_GROUP" \
  --name "${SCALE_SET_NAME}-Autoscale" \
  --resource "$SCALE_SET_NAME" \
  --resource-type "Microsoft.Compute/virtualMachineScaleSets" \
  --min-count 1 \
  --max-count 10 \
  --count 2 \

# Ajouter des règles de scaling 
# Règle pour augmenter le nombre d'instances
az monitor autoscale rule create \
  --resource-group "$RESOURCE_GROUP" \
  --autoscale-name "${SCALE_SET_NAME}-Autoscale" \
  --scale out 1 \
  --condition "Percentage CPU > 50 avg 5m"

# Règle pour diminuer le nombre d'instances
az monitor autoscale rule create \
  --resource-group "$RESOURCE_GROUP" \
  --autoscale-name "${SCALE_SET_NAME}-Autoscale" \
  --scale in 1 \
  --condition "Percentage CPU < 20 avg 5m"

# Création du script d'initialisation et l'encoder en base64
nano mon_script.sh
#!/bin/bash
# Exemple de script d'initialisation
echo "Configuration de l'instance de VMSS"
apt-get update && apt-get install -y nginx  # Installe le serveur web nginx
echo "Serveur nginx installé avec succès"
chmod +x mon_script.sh
cat mon_script.sh
base64 mon_script.sh > mon_script_base64.txt

#Encoder le contenu en base 64
BASE64_CONTENT=$(base64 -w 0 mon_script.sh)

#Mettre à jour le userData avec le contenu encodé
az vmss update \
  --resource-group "$RESOURCE_GROUP" \
  --name "$SCALE_SET_NAME" \
  --set virtualMachineProfile.userData="$BASE64_CONTENT"

