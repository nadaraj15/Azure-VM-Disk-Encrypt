<#
**********************Note*************************
Replace the parametes before executing

by Nadaraj Prabhu 

$SubName        - Subscription Name
$KeyVaultrgName - Key Vault Resource Group Name
$VMrgName       - Resource Group Name
$VMs            - VM Name

you can add multiple VM in same resource group:

$VMs += "Dev1VM"
$VMs += "Dev2VM"
$VMs += "Dev3VM"

#>

$SubName ="your Subscription name"
$VMs = @()
$VMs += "DevVM"
$VMrgName = ‘Dev-RG’;


<#
$KeyVaultName - Azure Key vault Name
$KeyVaultKey  - Name of the key in the Key vault 
#>

$KeyVaultName = 'vmcypherkeys';
$keyEncryptionKeyName = 'Bitlocker-Key';
$rgName = 'Dev-RG';

Login-AzureRmAccount
Select-AzureRMSubscription -SubscriptionName $SubName

$KeyVault = Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname;
$diskEncryptionKeyVaultUrl = $KeyVault.VaultUri;
$KeyVaultResourceId = $KeyVault.ResourceId;
$keyEncryptionKeyUrl = (Get-AzureKeyVaultKey -VaultName $KeyVaultName -Name $keyEncryptionKeyName).Key.kid;


#Script to enable Azure Disk Encryption
foreach ($VMName in $VMs) {
Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $VMrgName -VMName $vmName -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -KeyEncryptionKeyUrl $keyEncryptionKeyUrl -KeyEncryptionKeyVaultId $KeyVaultResourceId -VolumeType All -SequenceVersion $sequenceVersion -Force -debug;
};
