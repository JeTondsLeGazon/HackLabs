#! /bin/bash

function check() {
    OUTPUT_STRING=""
    TEST_STRING='Financial Status: approved'
    TEST_FILE="/home/${USER_NAME}/clients/555666777.txt"
    OUTPUT_STRING=$(sshpass -p "${USER_PASSWD}" ssh ${USER_NAME}@172.18.0.11 \
    "cat '${TEST_FILE}' | grep -i '${TEST_STRING}' || echo 'NOT '")
    OUTPUT_STRING=$OUTPUT_STRING'PASSED'
    echo "$OUTPUT_STRING"
}

(source ./users/creds.env; check)
