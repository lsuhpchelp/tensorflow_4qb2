#!/bin/bash -x

export PYTHON_BIN_PATH=/project/fchen14/anaconda3/bin/python
export PYTHON_LIB_PATH=/project/fchen14/anaconda3/lib/python3.5/site-packages

export TF_NEED_GCP=0
export TF_NEED_HDFS=0
export TF_NEED_OPENCL=0
export TF_NEED_CUDA=1

export GCC_HOST_COMPILER_PATH=`which gcc`
export TF_CUDA_VERSION="7.5"
export CUDA_TOOLKIT_PATH=/usr/local/packages/cuda/7.5
export TF_CUDNN_VERSION="5.1"
export CUDNN_INSTALL_PATH=$CUDA_TOOLKIT_PATH
export TF_CUDA_COMPUTE_CAPABILITIES="3.5,5.2"

export TEST_TMPDIR=/work/fchen14/bazelcache
rm -rf $TEST_TMPDIR/*

./configure

bazel build -c opt --config=cuda --verbose_failures //tensorflow/tools/pip_package:build_pip_package
