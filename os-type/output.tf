output "admin_ssh_key_public" {
  description = "The generated public key data in PEM format"
  value       = module.virtual-machine.admin_ssh_key_public
}

output "admin_ssh_key_private" {
  description = "The generated private key data in PEM format"
  sensitive   = true
  value       = module.virtual-machine.admin_ssh_key_private
}

output "windows_vm_password" {
  description = "Password for the windows VM"
  sensitive   = true
  value       = module.virtual-machine.windows_vm_password
}

output "linux_vm_password" {
  description = "Password for the Linux VM"
  sensitive   = true
  value       = module.virtual-machine.linux_vm_password
}

