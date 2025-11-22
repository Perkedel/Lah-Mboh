#!/bin/pwsh
# https://stackoverflow.com/a/18848848/9079640
# https://stackoverflow.com/a/2591782/9079640
# https://www.atera.com/blog/how-to-run-exe-files-in-powershell/
# pls why tf ACC does not itterate?!??!??!?!
# (JOELwindows7)
# hey Windsurf, if you screw up, idk..
# Ugh, this is embarrasing!! using assistive coding bot / AI Coding?! 
# in this age where people thought steam machine took over their job but now here we got EV train??
# My aura is gone!!!!
# This is heavy dillema!!
# I didn't prompt anything! I come the code from my mind!
# I know what I am doing!

$FolderSource = ".\source"
$FolderCompile = ".\acs"
$Compiler = ".\yoinks\ZDoom\acs\acc-win32.exe"

Write-Output "Let's compile ACS with $($Compiler)"

Get-ChildItem $FolderSource -Filter *.acs | ForEach-Object {
    $ObtainedSource = "$($FolderSource)\$($_.Name)"
    $ObtainedTarget = "$($FolderCompile)\$($_.BaseName).o"
    # Write-Output "Compiling $($_.FullName) to $($FolderCompile)\$($_.BaseName).o"
    Write-Output "Compiling $($ObtainedSource) to $($ObtainedTarget)"
    #.\yoinks\ZDoom\acs\acc-win32.exe $($_.Name)
    Invoke-Expression "$($Compiler) $($ObtainedSource) $($ObtainedTarget)"
    
}