#!/bin/bash

set -x

mkdir -p bin

fasm ./fasm/source/linux/fasm.asm

mv ./fasm/source/linux/fasm bin

for i in $(find t -name '*.asm'); do

    ./bin/fasm $i
done

if [ $# -eq 2 ]; then

    odin build src -out:sim8086.bin -o:speed -reloc-mode:static && echo "OK"

elif [ $# -eq 1 ]; then
    
    odin build src -debug -out:sim8086.bin && echo "OK"
else

    odin build src -out:sim8086.bin && echo "OK"

fi

mv ./sim8086.bin ./bin
