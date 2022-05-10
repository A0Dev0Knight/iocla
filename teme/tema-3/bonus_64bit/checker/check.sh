#!/bin/bash

INPUTS="tests/in/"
OUTPUTS="tests/out/"
REFS="tests/ref/"

IN_EXT=".in"
OUT_EXT=".out"
REF_EXT=".ref"

TASK_SCORE=$(echo "scale=2; 5 / 3" | bc)
MAX_SCORE=5
TOTAL=0

make checker > /dev/null

echo "================ 64 bits bonus task ================="

for i in 1 2 3; do
	./checker < "${INPUTS}${i}${IN_EXT}" > "${OUTPUTS}${i}${OUT_EXT}"
	diff "${OUTPUTS}${i}${OUT_EXT}" "${REFS}${i}${REF_EXT}" > /dev/null
	if [[ $? == "0" ]]; then
		echo "Test $i					  ${TASK_SCORE}p/${TASK_SCORE}p"
		TOTAL=$(echo "scale=2; $TOTAL + $TASK_SCORE" | bc)
	else
		echo "Test $i					  0.00p/${TASK_SCORE}p"
	fi
done

echo
printf "Total score:				  %3.2fp/%3.2fp\n" ${TOTAL} ${MAX_SCORE} | tr ',' '.'

make clean > /dev/null 2>&1

echo "bonus_64bits:${TOTAL}" >> ../../.results
