#!/bin/bash -l

set -e

export GTCMAKE_GT_ENABLE_PYUTILS=ON
export GTRUN_NO_SLURM=true
export GTRUN_BUILD_COMMAND="make -j $(nproc)"
export CTEST_PARALLEL_LEVEL="$(nproc)"
export OMP_NUM_THREADS="$(nproc)"

build_dir=/gridtools-build
install_dir=/gridtools-install

if [[ -n "$CUDACXX" ]]; then
    export GTCMAKE_GT_ENABLE_BACKEND_CUDA=ON
    export GTCMAKE_GT_ENABLE_BACKEND_X86=OFF
    export GTCMAKE_GT_ENABLE_BACKEND_MC=OFF
    export GTCMAKE_GT_ENABLE_BACKEND_NAIVE=OFF
    export GTCMAKE_GT_EXAMPLES_FORCE_CUDA=ON
else
    export GTCMAKE_GT_ENABLE_BACKEND_CUDA=OFF
    export GTCMAKE_GT_ENABLE_BACKEND_X86=ON
    export GTCMAKE_GT_ENABLE_BACKEND_MC=ON
    export GTCMAKE_GT_ENABLE_BACKEND_NAIVE=ON
fi

if [[ -z "$build_type" ]]; then
    build_type=release
fi
if [[ -z "$float_type" ]]; then
    float_type=double
fi
if [[ -z "$grid_type" ]]; then
    grid_type=structured
fi

echo "${build_type^^}. ${float_type^^}. ${grid_type^^}" | cowsay
python3 /gridtools/pyutils/driver.py -vv build -b $build_type -p $float_type -g $grid_type -o $build_dir -i $install_dir -t perftests

if [[ -z "$CUDACXX" ]]; then
    $build_dir/pyutils/driver.py -vv test --build-examples --perftests-only
fi