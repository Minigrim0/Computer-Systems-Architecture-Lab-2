#!/bin/bash

source gpgpu-sim_distribution/setup_environment

mkdir -p sim_480
mkdir -p sim_2060

pushd sim_480
# Copy GPU files & executable
cp ../gpgpu-sim_distribution/configs/tested-cfgs/SM2_GTX480/* .
cp ../is2202_labs_apps-1/gemm/gemm.gpu .
popd

pushd sim_2060
# Copy GPU files & executable
cp ../gpgpu-sim_distribution/configs/tested-cfgs/SM75_RTX2060/* .
cp ../is2202_labs_apps-1/gemm/gemm.gpu .
popd

mkdir -p results

# Run tests
for N in $(seq 32 10 512);do
    for DIR in sim_480 sim_2060;do
        echo "Running Size $N for $DIR";
        pushd $DIR;
            mkdir -p ../results/$DIR
            ./gemm.gpu $N > ../results/$DIR/stats-$N.txt;
        popd;
    done;
done;
