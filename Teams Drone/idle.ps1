Add-Type -assemblyName System.Windows.Forms;
# max 48 hours work week
$a = @(1..100);
while (1) {
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(($a | get-random), ($a | get-random));
    start-sleep -seconds (Get-Random -Minimum 5.0 -Maximum 20.93)
}