# problem statement
creates an azure webapp (if it doesn't already exist)

# example usage

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
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.webapp.create#VERSION }
    inputs:
      subscriptionId:
      azureUsername:
      azurePassword:
      name:
      plan:
      resourceGroup:
```