source "azure-arm" "nginx" {
    use_azure_cli_auth = "true"

    image_publisher = "Canonical"
    image_offer     = "CIS-HardenedUbuntu"
    image_sku       = "20.04-LTS"

    plan_info {
      plan_name      = "20.04-LTS"
      plan_product   = "cis-ubuntu-linux-2004-l1"
      plan_publisher = "Canonical"
    }

    managed_image_resource_group_name = "packerdemo"
    managed_image_name = "nginx"
    location = "West US 3"
    vm_size = "Standard_B1s"
    os_type = "Linux"

    shared_image_gallery_destination {
      subscription   = "a40e6f09-a0f0-4884-88e6-528919fd9221"
      resource_group = "packerdemo"
      gallery_name   = "sig"
      image_name     = "nginx"
      image_version  = "0.0.1"
      replication_regions = ["UKWest", "West US 3"]
      }
    }

    build {
        sources = [
            "source.azure-arm.nginx"
        ]

    provisioner "ansible" {
        playbook_file = "./nginx.yml"
        ansible_env_vars = [ "ANSIBLE_ROLES_PATH=~/.ansible/roles" ]
    }
}
