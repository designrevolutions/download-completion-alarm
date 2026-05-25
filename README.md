# Download Completion Alarm

A small PowerShell script that watches your download folder and plays an alarm when a browser download has finished.

This was created for long downloads, such as Google Takeout files, where the download may run for a long time and you want a loud alert when it completes.

The script file is:

```text
alarm-for-download.ps1
```

## What it does

The script watches a chosen download folder.

It looks for temporary browser download files, such as:

```text
.crdownload
```

These files are commonly used by Chrome, Edge and other Chromium-based browsers while a file is still downloading.

When the temporary download file disappears, the script assumes the download has completed and plays an alert.

## When this is useful

This is useful when:

- You are downloading large files.
- You do not want to keep checking the browser.
- You want to leave the computer running and be alerted when the download finishes.
- You are downloading Google Takeout archive files one at a time.

## Requirements

You need:

- Windows
- PowerShell
- A browser that creates `.crdownload` files while downloading, such as Chrome or Edge

## File name

Save the script as:

```text
alarm-for-download.ps1
```

## Basic setup

Open the script in VS Code or another editor.

Find the setting for the download folder.

It may look something like this:

```powershell
$downloadFolder = "C:\\Users\\YourName\\Downloads"
```

Change it to your real download folder.

Example:

```powershell
$downloadFolder = "C:\\Users\\Omar\\Downloads"
```

Make sure the folder path exists.

## How to run it

Open PowerShell.

Go to the folder where you saved the script.

Example:

```powershell
cd C:\\Users\\Omar\\Desktop\\download-alarm
```

Run this command first if PowerShell blocks the script:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Then run the script:

```powershell
.\\alarm-for-download.ps1
```

## Suggested workflow

1. Start the script.
2. Start your browser download.
3. Leave the script window open.
4. When the download finishes, the alarm should play.
5. Stop the script by pressing `Ctrl + C`.

## Important notes

The script needs to be running before or during the download.

Do not close the PowerShell window while the download is still running.

If your browser does not use `.crdownload` files, the script may need adjusting for that browser.

Common temporary download file types include:

```text
.crdownload
.part
.tmp
```

Chrome and Edge usually use `.crdownload`.

Firefox often uses `.part`.

## Testing the script

To test the script without waiting for a real large download:

1. Start a large download in Chrome or Edge.
2. Check that a `.crdownload` file appears in your Downloads folder.
3. Leave the script running.
4. Wait for the download to complete.
5. Confirm that the alarm plays.

## Troubleshooting

### PowerShell says scripts are disabled

Run this first:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

This only changes the policy for the current PowerShell session.

It does not permanently change your Windows script policy.

### The alarm does not play

Check that:

- The script is still running.
- The download folder path is correct.
- The browser is creating `.crdownload` files.
- The computer volume is turned up.
- The download actually completed.

### The script finishes too early

This can happen if the script starts watching before the temporary download file appears.

Start the script, then start the download shortly afterwards.

If needed, the script can be improved so it waits for a download to start first, then waits for it to complete.

### I am using Firefox

Firefox usually uses `.part` files instead of `.crdownload`.

The script may need to watch for `.part` as well.

## Safety note

This script does not download anything itself.

It only watches your local download folder and plays a sound when it thinks a download has finished.

## Future improvements

Possible improvements include:

- Support for `.part` files for Firefox.
- A setting for choosing the alarm sound.
- A repeat-until-stopped alarm.
- A small desktop pop-up notification.
- Logging completed downloads to a text file.
- Watching multiple folders.
- Detecting only newly started downloads instead of any existing temporary files.
