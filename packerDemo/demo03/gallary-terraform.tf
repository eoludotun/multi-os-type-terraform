provider "azurerm" {
  version         = "~>2.0"
  subscription_id = ""
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = ""
    resource_group_name  = ""
    container_name       = ""
    key                  = ""
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "sig"
  location = "UKSouth"
}

resource "azurerm_shared_image_gallery" "sig" {
  name                = "sig"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_shared_image" "nginx" {
  name                = "nginx"
  gallery_name        = azurerm_shared_image_gallery.sig.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"

  identifier {
    publisher = "center-for-internet-security-inc"
    offer     = "cis-ubuntu-linux-2004-l1"
    sku       = "cis-ubuntu2004-l1"
  }
}

output "nginx" { value = azurerm_shared_image.nginx }
output "sig" { value = azurerm_shared_image_gallery.sig }
