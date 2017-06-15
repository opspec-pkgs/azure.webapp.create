#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for existing webapp"
if [ "$(az webapp show --resource-group "$resourceGroup" --name "$name")" != "" ]
then
    echo "found existing webapp"
else
    createCmd='az webapp create'
    createCmd=$(printf "%s --name %s" "$createCmd" "$name")
    createCmd=$(printf "%s --plan %s" "$createCmd" "$appServicePlan")
    createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")
    createCmd=$(printf "%s --deployment-source-branch %s" "$createCmd" "$deploymentSourceBranch")

    # handle opts
    if [ "$deploymentContainerImageName" != " " ]; then
      createCmd=$(printf "%s --deployment-container-image-name %s" "$createCmd" "$deploymentContainerImageName")
    fi

    if [ "$isLocalGitEnabled" == "true" ]; then
      createCmd=$(printf "%s --deployment-local-git" "$createCmd")
    fi

    if [ "$deploymentSourceUrl" != " " ]; then
      createCmd=$(printf "%s --deployment-source-url %s" "$createCmd" "$deploymentSourceUrl")
    fi

    if [ "$runtime" != " " ]; then
      createCmd=$(printf "%s --runtime %s" "$createCmd" "$runtime")
    fi

    if [ "$startupFile" != " " ]; then
      createCmd=$(printf "%s --startup-file %s" "$createCmd" "$startupFile")
    fi

    echo "creating webapp"
    eval "$createCmd"
fi