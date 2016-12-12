#!/bin/bash

function error {
    echo "Incorrect number of parameters, expecting number"
    exit 1
}

[ "$#" -eq 1 ] || error

filename=${1}.sh

cat > $filename << EOF
#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting number"
    exit 1
}

[ "\$#" -eq 1 ] || error

EOF

chmod 755 $filename
