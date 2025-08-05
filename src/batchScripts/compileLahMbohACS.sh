#!/bin/bash
# Same compile but for Linux
# (JOELwindows7)
# https://stackoverflow.com/a/1521498/9079640
# https://unix.stackexchange.com/a/711377/390514
# https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
# https://superuser.com/a/731250/1036816
# https://askubuntu.com/a/804082 must also aware of architecture!


folderSource="./source"
folderCompile="./acs"
compiler="./yoinks/ZDoom/acs/acc-amd64"

echo "Firstly, check the CPU Architecture!:"

# direct yoink, edit now! Change app based on this!
arch=$(uname -i)
if [[ $arch == x86_64* ]]; then
    echo "X64 Architecture"
    compiler="./yoinks/ZDoom/acs/acc-amd64"
elif [[ $arch == i*86 ]]; then
    echo "X32 Architecture"
    compiler="./yoinks/ZDoom/acs/acc-i386"
elif  [[ $arch == arm* ]]; then
    echo "ARM Architecture"
    compiler="./yoinks/ZDoom/acs/acc-arm64"
elif  [[ $arch == riscv ]]; then
    echo "RISC-V Architecture"
    compiler="./yoinks/ZDoom/acs/acc-riscv64" # oh shit! We don't have RISC-V version!!!!!!!!
fi

echo "Add Executable Permission onto the compiler we\'re gonna use"

chmod +x $compiler

echo "Time to Compile with $compiler"

for anFile in ./source/*.acs; do
    baseFilename=$(basename -- "$anFile")
    extensionFile="${baseFilename##*.}"
    justFilename=${baseFilename%.*}
    obtainedSource="$anFile"
    obtainedTarget="$folderCompile/$justFilename.o"
    echo "Compile $obtainedSource to $obtainedTarget"
    $compiler "$obtainedSource" "$obtainedTarget"
done