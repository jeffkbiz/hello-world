$rgName = "rg-asr-asr-filestore-prd"
$storageAccount = "stfesasrfileshareprd"
$containerName = "backup"
$blobName = "H_Drives"

# Get the storage account context.
$ctx = New-AzStorageContext -StorageAccountName $storageAccount -UseConnectedAccount

# Get the blob from the service.
$blob = Get-AzStorageBlob -Context $ctx -Container $containerName -Blob $blobName

# Check the AccessTier and AccessTierInferred properties.
# If the access tier is inferred, that property returns true.
$blob.BlobProperties.AccessTier
$blob.BlobProperties.AccessTierInferred