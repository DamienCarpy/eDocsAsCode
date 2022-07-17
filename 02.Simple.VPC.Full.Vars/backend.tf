terraform {
  backend "azurerm" {
    resource_group_name  = "rga-dca"
    storage_account_name = "edocsascode"            #storage account name for tf state
    container_name       = "terraform"              #storage account container name, default to terraform
    key                  = "01.simple.vars.tfstate" #file.tfstate, used to store the state
  }
}