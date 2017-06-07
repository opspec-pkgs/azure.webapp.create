#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for existing webapp"
if [ "$(az webapp show --resource-group "$resourceGroup" --name "$name")" != "" ]
then
    echo "found existing webapp"
else
    echo "webapp not found"
    echo "creating webapp"
    az webapp create \
    --name "$name" \
    --plan "$plan" \
    --resource-group "$resourceGroup"
fi