# Problem statement
creates an azure webapp (if it doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.webapp.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.webapp.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.webapp.create#VERSION
```

## compose

```yaml
op:
  pkg: { ref: github.com/opspec-pkgs/azure.webapp.create#VERSION }
  inputs:
    subscriptionId:
    loginId:
    loginSecret:
    name:
    resourceGroup:
    appServicePlan:
    # begin optional args
    deploymentContainerImageName:
    deploymentSourceBranch:
    deploymentSourceUrl:
    isLocalGitEnabled:
    loginTenantId:
    loginType:
    runtime:
    startupFile:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.webapp.create/issues)
