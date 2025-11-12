# idk how how how how how to compress PNG
# What the fuck are the arguments did slade used?!

$FolderGraphic = ".\Graphics"
$FolderTexture = ".\Texture"
$pngout = ".\yoinks\pngstuff\pngout.exe"
$deflopt = ".\yoinks\pngstuff\deflopt.exe"
$pngcrush = ".\yoinks\pngstuff\pngcrush.exe"

Write-Output "Let's squish PNGs with:"
Write-Output "- $($pngout)"
Write-Output "- $($pngcrush)"
Write-Output "- $($deflopt)"

Get-ChildItem $FolderSource -Filter *.acs | ForEach-Object {
    $ObtainedSource = "$($FolderGraphic)\$($_.Name)"
}