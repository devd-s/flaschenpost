1. I have created the module based on the requirement given in question 1 to create resources in West Europe Region in Azure.
2. While setting up things for azure , I need to create service principal using below command <az ad sp create-for-rbac --name <service-principal-name> --role Contributor --scopes /subscriptions/<your-subscription-id> and then setting up enviornment variables which are 
'''
export ARM_CLIENT_ID="11111111-2222-3333-4444-555555555555"
export ARM_CLIENT_SECRET="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
export ARM_TENANT_ID="66666666-7777-8888-9999-000000000000"
export ARM_SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
'''
3. required_version = ">= 1.0.0" specifies that the Terraform configuration requires Terraform version 1.0.0 or higher to be used.This ensures that code takes advantage of features and improvements available in newer Terraform versions, avoiding compatibility issues.tfswitch can also be used when working with multiple terraform versions.
4. source = "hashicorp/azurerm": Specifies the provider is maintained by HashiCorp,Specifies that version 2.0.0 or higher of the azurerm provider must be used.This ensures that the Terraform configuration is compatible with the Azure provider’s features and syntax starting from version 2.0.0. This is idle for managing new updates.Also locking on specific version can be done. 
5. Also based on the doc it mentions to create the storage account using name : 'srechallengeforflaschenpost', whereas the azure has limitation of characters for this reource which is in between 3 and 24 characters long which is why I faced the below error and fixed it by changing it to 'srechallengeflaschenpost'.

╷
│ Error: name ("srechallengeforflaschenpost") can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long
│
│   with module.azure_storage.azurerm_storage_account.sre_storage,
│   on modules/storage-account/main.tf line 26, in resource "azurerm_storage_account" "sre_storage":
│   26:   name                     = var.storage_account_name
│
╵
Also i have added flexibility for this , by giving the default name and location option and along with others which you can mention while using the module and leaving that commented for now while calling the module to show that they are not compulsory as default values were mentioned.

5. Also I have given the option by taking input from the module caller so that he/ she can define access_tier, name and so on.

