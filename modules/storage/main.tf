resource "random_string" "storage_suffix" {
  length  = 6
  upper   = false
  special = false
}
resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name}${random_string.storage_suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Allow"
    virtual_network_subnet_ids = [var.subnet_id]
    bypass = ["AzureServices"]  # Allow Azure services like Functions to access
  }

  lifecycle {
    prevent_destroy = false
  }

  depends_on = [
    var.subnet_id
  ]
}