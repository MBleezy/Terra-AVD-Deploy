# Resource group
data "azurerm_resource_group" "sandbox-rg" {
  name = "mbleezarde-sandbox"
}

# Create AVD workspace
resource "azurerm_virtual_desktop_workspace" "AVD_workspace" {
  name                = var.workspace
  resource_group_name = data.azurerm_resource_group.sandbox-rg.name
  location            = var.resource_group_location
  friendly_name       = "${var.prefix} Workspace"
  description         = "${var.prefix} Workspace"
}

# Create AVD host pool
resource "azurerm_virtual_desktop_host_pool" "AVD_hostpool" {
  resource_group_name      = data.azurerm_resource_group.sandbox-rg.name
  location                 = azurerm_virtual_desktop_workspace.AVD_workspace.location
  name                     = var.hostpool
  friendly_name            = var.hostpool
  validate_environment     = true
  custom_rdp_properties    = "audiocapturemode:i:1;audiomode:i:0;"
  description              = "${var.prefix} Terraform HostPool"
  type                     = "Pooled"
  maximum_sessions_allowed = 16
  load_balancer_type       = "DepthFirst" #[BreadthFirst DepthFirst]
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "registrationinfo" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.AVD_hostpool.id
  expiration_date = var.rfc3339
}

# Create AVD DAG
resource "azurerm_virtual_desktop_application_group" "dag" {
  resource_group_name = data.azurerm_resource_group.sandbox-rg.name
  host_pool_id        = azurerm_virtual_desktop_host_pool.AVD_hostpool.id
  location            = azurerm_virtual_desktop_workspace.AVD_workspace.location
  type                = "Desktop"
  name                = "${var.prefix}-dag"
  friendly_name       = "Desktop AppGroup"
  description         = "AVD application group"
  depends_on          = [azurerm_virtual_desktop_host_pool.AVD_hostpool, azurerm_virtual_desktop_workspace.AVD_workspace]
}

# Associate Workspace and DAG
resource "azurerm_virtual_desktop_workspace_application_group_association" "ws-dag" {
  application_group_id = azurerm_virtual_desktop_application_group.dag.id
  workspace_id         = azurerm_virtual_desktop_workspace.AVD_workspace.id
}