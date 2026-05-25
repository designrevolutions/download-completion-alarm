# Watches a folder for browser downloads.
# When all .crdownload files disappear, it plays a loud repeating alert.
#
# Sample usage:
# 1. Save this file as watch-download.ps1.
# 2. Change $downloadFolder to your Google Takeout download folder.
# 3. Start one download in Edge or Chrome.
# 4. Run this script in PowerShell.
# 5. Leave it running until the sound plays.

$downloadFolder = "C:\Users\YOUR_NAME\Downloads"

Write-Host "Watching downloads in: $downloadFolder"
Write-Host "Waiting for an active browser download..."

# Wait until at least one Chrome/Edge temporary download file appears.
while ($true)
{
    $activeDownloads = Get-ChildItem -Path $downloadFolder -Filter "*.crdownload" -ErrorAction SilentlyContinue

    if ($activeDownloads.Count -gt 0)
    {
        Write-Host "Download detected."
        break
    }

    Start-Sleep -Seconds 5
}

Write-Host "Waiting for download to finish..."

# Wait until no .crdownload files remain.
while ($true)
{
    $activeDownloads = Get-ChildItem -Path $downloadFolder -Filter "*.crdownload" -ErrorAction SilentlyContinue

    if ($activeDownloads.Count -eq 0)
    {
        Write-Host "Download appears to have completed."
        break
    }

    Start-Sleep -Seconds 10
}

# Play a loud alert several times.
for ($alertCount = 1; $alertCount -le 10; $alertCount++)
{
    [console]::beep(1000, 700)
    Start-Sleep -Milliseconds 300
}

Write-Host "Finished. Check your downloaded file."
