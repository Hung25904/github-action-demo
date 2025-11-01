provider "azurerm" {
  features {}

  use_msi         = true  # Enables Managed Identity Authentication
  subscription_id = "6082979a-f525-4054-85c4-79c3e2282ab8"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorage${random_string.suffix.result}"
  resource_group_name      = "jaydeep-rg"
  location                 = "East Asia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
