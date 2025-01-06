resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "storage" {
  name                 = "storage-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  service_endpoints = ["Microsoft.Storage"]

  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "cosmos" {
  name                 = "cosmos-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]

  service_endpoints = ["Microsoft.AzureCosmosDB"]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}