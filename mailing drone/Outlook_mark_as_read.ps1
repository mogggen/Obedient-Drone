# Mark as read
$email.UnRead = $false

# Move to another folder (e.g., "Processed")
$processedFolder = $inbox.Folders | Where-Object { $_.Name -eq "Processed" }
if (-not $processedFolder) {
    $processedFolder = $inbox.Folders.Add("Processed")
}
$email.Move($processedFolder)
