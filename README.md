# Azure VM Disk Encrypt

#### How to enable Disk Encryption on Azure VM (BitLocker/DM-Crypt)

Azure Disk Encryption is a capability that helps you encrypt your Windows and Linux IaaS VM disks. When you apply the Disk Encryption management solution, you can satisfy the following business needs:

•	IaaS VMs are secured at rest by using industry-standard encryption technology to address organizational security and compliance requirements.

•	IaaS VMs boot under customer-controlled keys and policies. You can audit their usage in your key vault.

Since Azure has recently started supporting DR for Azure Disk Encryption-enabled VMs Link. To enable disk encryption, we need to leverage Azure AD App and Azure Key Vault service from Azure which help in encryption and decryption.

## Prerequisites:

•	Azure Disk Encryption needs the Key Vault and the VMs to be co-located in the same region. Create and use a Key Vault that is in the same region as the VM to be encrypted. Link

•	Encrypting or disabling encryption may cause the VM to auto-reboot once.
Summary:
Below are the steps we need to perform to enable encryption for disks in Azure VM:

1.	Create a key vault.
2.	Set the key vault access policy.
3.	Set key vault advanced access policies.
4.	Run PowerShell script to enable encryption (since enabling encryption from portal is not yet available) 

Kindly follow the document for the steps

Note: In this script we are not using App ID, since new Azure kek encryption method for disk supports without App ID requirement.
