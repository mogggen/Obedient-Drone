# Start Outlook COM
$outlook = New-Object -ComObject Outlook.Application
$namespace = $outlook.GetNamespace("MAPI")

# Get the default Inbox
$inbox = $namespace.GetDefaultFolder([Microsoft.Office.Interop.Outlook.OlDefaultFolders]::olFolderInbox)

# Get the most recent 10 emails
$emails = $inbox.Items | Sort-Object ReceivedTime -Descending | Select-Object -First 10

foreach ($email in $emails) {
    Write-Host "From: $($email.SenderName)"
    Write-Host "Subject: $($email.Subject)"
    Write-Host "Received: $($email.ReceivedTime)"
    Write-Host "Body: $($email.Body.Substring(0, [Math]::Min(200, $email.Body.Length)))`n"
}


$keywordPattern = '(?i)\b(invoice|payment|urgent)\b'  # Case-insensitive match

foreach ($email in $emails) {
    if ($email.Body -match $keywordPattern) {
        Write-Host ">>> Keyword found in email from $($email.SenderName) - Subject: $($email.Subject)"
        
        # Optional: Move to folder, flag, or respond
    }
}

