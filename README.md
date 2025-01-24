
scalable web application infrastructure in Azure using Terraform. The infrastructure will include a Virtual Machine Scale Set (VMSS) behind a load balancer with proper security and scaling configurations.

## Requirements

### Base Infrastructure
1. Create a resource group in one of these regions:
   - canada

### Networking
1. Create a VNet with two subnets:
   - Application subnet (for VMSS)
2. Configure an NSG that:
   - Only allows traffic from the load balancer to VMSS
   - Uses dynamic blocks for rule configuration
   - Denies all other inbound traffic

### Compute
1. Set up a VMSS with:
   - Ubuntu 20.04 LTS
   - VM sizes with conditions based on environment(hint: use lookup function):
     * Dev: Standard_B1s
     * Stage: Standard_B2s
     * Prod: Standard_B2ms
2. Configure auto-scaling:
   - Scale in when CPU < 10%
   - Scale out when CPU > 80%
   - Minimum instances: 2
   - Maximum instances: 5

### Load Balancer
1. Create an Azure Load Balancer:
   - Public IP
   - Backend pool connected to VMSS
   - Health probe on port 80



