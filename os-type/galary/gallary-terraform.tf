provider "azurerm" {
  version = "~>2.0"
  /* subscription_id = "" */
  features {}
}

/* terraform {
  backend "azurerm" {
    storage_account_name = ""
    resource_group_name  = ""
    container_name       = ""
    key                  = ""
  }
} */

resource "azurerm_resource_group" "rg" {
  name     = "sig"
  location = "West US 3"
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
    publisher = "Canonical"
    offer     = "CIS-HardenedUbuntu"
    sku       = "20.04-LTS"
  }
}

output "nginx" { value = azurerm_shared_image.nginx }
output "sig" { value = azurerm_shared_image_gallery.sig }
