#!/bin/bash

for IMG in *puml
do
    BNAME=$(basename $IMG .puml)
    echo -n "$BNAME.svg "
    docker run --rm --user 1026 -v $(pwd):/workspace plantuml/plantuml -progress -tsvg /workspace/${IMG}
    echo
    echo -n "$BNAME.png "
    docker run --rm --user 1026 -v $(pwd):/workspace plantuml/plantuml -progress -tpng /workspace/${IMG}
    echo
    mv ${BNAME}.svg vector/
    git add vector/${BNAME}.svg
    mv ${BNAME}.png raster/
    git add raster/${BNAME}.png
done
