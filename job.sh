#!/bin/sh
#PBS -l select=1:ncpus=4:mpiprocs=4:ompthreads=1:jobtype=core
#PBS -l walltime=1:00:00

prefix=$PREFIX_TEST_TGC

if [ "$PBS_O_WORKDIR" ]; then
  cd ${PBS_O_WORKDIR}
fi

module purge
source $prefix/util/load_curp_ims

set -xeu

output=$prefix/output/${test_type}_${PBS_JOBID}
work=/lwork/users/$USER/$PBS_JOBID

mkdir -p $output

cd $work
cp $prefix/inputs/* .
sed -e "s|TEST_TYPE|${test_type}|g" template.cfg > config.cfg

mpirun -np 4 curp compute config.cfg > $output/flux.log

cp flux_grp.nc $output/flux.nc
