## Azure Machine Learning Workspace

Azure Machine Learning Workspace is a foundational resource in Azure that provides a collaborative environment where data scientists can build, train, and deploy machine learning models.

### Design Decisions

1. **Security**: 
   - The workspace employs Azure Key Vault for storing sensitive information and encryption keys.
   - Managed identities are used for secure and seamless access.

2. **Identity Management**:
   - UserAssigned Identity is used for both compute instances and clusters to ensure role-based access control.
   - Azure roles are assigned to different resources ensuring least-privilege access.

3. **Scalability**:
   - Compute clusters are configured with auto-scaling settings to optimize resource use based on workload demands.
   - Instances can be dedicated and customized per workload requirements.

4. **High Availability**:
   - Ensures resources are distributed across availability zones to minimize service disruption.

### Runbook

#### Unable to Access Azure Machine Learning Workspace

If you are experiencing issues accessing the Azure Machine Learning Workspace, the following troubleshooting steps might help.

**Check Role Assignments and Permissions**

Ensure the user or service principal has the required roles assigned.

```sh
az role assignment list --scope /subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.MachineLearningServices/workspaces/<workspace-name> --assignee <user-or-service-principal-id>
```

**Expected Output**: A list of roles assigned to the user or service principal. Verify the "AzureML Data Scientist" or similar roles are included.

#### Compute Instance Not Starting

If a compute instance is not starting, you can use the following commands to diagnose the issue.

**Check Instance Status**

```sh
az ml compute show -n <instance-name> -w <workspace-name> -g <resource-group>
```

**Expected Output**: The status of the compute instance. Look for states like "creating", "running", or "failed".

**Review Activity Logs**

```sh
az monitor activity-log list --resource-group <resource-group> --resource-id <compute-instance-resource-id>
```

**Expected Output**: Details of recent activities and errors related to the compute instance.

#### Poor Performance of Machine Learning Experiment

If you notice poor performance with your machine learning experiment, the following steps can help identify bottlenecks.

**Check VM Utilization**

Azure CLI command to check the current utilization of the VM:

```sh
az vm list-vm-resize-options --resource-group <resource-group> --name <vm-name> --query "[?location=='<location>']"
```

**Expected Output**: A list of possible VM sizes and the current VM configuration. Ensure the VM size is appropriate for the workload.

**Log into the Compute Instance**

Use SSH or RDP (based on configuration) to log into the compute instance and check system metrics like CPU, memory, and disk usage.

```sh
# SSH Example
ssh <username>@<vm-ip-address>
top
```

**Expected Output**: High CPU or memory utilization indicating resource constraints.

#### Issues with Data Access in Storage Account

If there are issues accessing data in the associated storage account:

**Check Storage Account Permissions**

Ensure the necessary roles are assigned for the storage account.

```sh
az role assignment list --scope /subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account-name> --assignee <user-or-service-principal-id>
```

**Expected Output**: A list of roles assigned to the user or service principal. Verify roles like "Storage Blob Data Contributor" are included.

#### Key Vault Access Issues

If you encounter access issues with Azure Key Vault, use the following steps:

**Check Key Vault Access Policies**

Ensure the relevant access policies are in place.

```sh
az keyvault show --name <keyvault-name> --query "properties.accessPolicies"
```

**Expected Output**: Access policies configured for the Key Vault. Validate policies for required permissions like "Get", "List", "Set", etc.

