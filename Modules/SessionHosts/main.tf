resource "azurerm_network_interface" "avd_vm_nic" {
  count               = var.avdsh_count
  name                = "${var.prefix}-${count.index + 1}-nic"
  resource_group_name = var.rg_name
  location            = var.deploy_location

  ip_configuration {
    name                          = "nic${count.index + 1}_config"
    subnet_id                     = var.subnetId
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "avd_vm" {
  count                 = var.avdsh_count
  name                  = "${var.prefix}-${count.index + 1}"
  resource_group_name   = var.rg_name
  location              = var.deploy_location
  size                  = var.vm_size
  network_interface_ids = ["${azurerm_network_interface.avd_vm_nic.*.id[count.index]}"]
  provision_vm_agent    = true
  admin_username        = var.local_admin_username
  admin_password        = var.local_admin_password

  os_disk {
    name                 = "${lower(var.prefix)}-${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "microsoftwindowsdesktop"
    offer     = "office-365"
    sku       = "win10-21h2-avd-m365-g2"
    version   = "latest"
  }

  depends_on = [
    azurerm_network_interface.avd_vm_nic
  ]
}

resource "azurerm_virtual_machine_extension" "vmext_dsc" {
  count                      = var.avdsh_count
  name                       = "${var.prefix}${count.index + 1}-avd_dsc"
  virtual_machine_id         = azurerm_windows_virtual_machine.avd_vm.*.id[count.index]
  publisher                  = "Microsoft.Powershell"
  type                       = "DSC"
  type_handler_version       = "2.73"
  auto_upgrade_minor_version = true

  settings = <<-SETTINGS
  {
    "modulesUrl": "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_09-08-2022.zip",
    "configurationFunction": "Configuration.ps1\\AddSessionHost",
    "properties": {
      "HostPoolName":"${var.host_pool_name}"
    }
  }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {
    "properties": {
      "registrationInfoToken": "${var.session_host_token}"
    }
  }
  PROTECTED_SETTINGS
}
