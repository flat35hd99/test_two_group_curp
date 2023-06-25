#!/bin/bash

prefix=$PREFIX_TEST_TGC

for test_type in "normal_dimer" "normal_inter" "test";do
    jsub \
        --mailflag n `# Don't send mails` \
        -N "ttgc_5_${i}" \
        -v "test_type=${test_type}" \
        $prefix/job.sh
done
