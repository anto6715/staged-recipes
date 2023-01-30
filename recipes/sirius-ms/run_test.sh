#!/usr/bin/env bash

echo "#### TEST ENV infos"
echo "PREFIX = $PREFIX"
echo "PREFIX = ${PREFIX}"
echo "PREFIX = $(printenv PREFIX)"
echo "CONDA_PREFIX = $CONDA_PREFIX"
echo "CONDA_PREFIX = ${CONDA_PREFIX}"
echo "CONDA_PREFIX = $(printenv CONDA_PREFIX)"
echo "LD_RUN_PATH = $LD_RUN_PATH"
echo "LD_RUN_PATH = ${LD_RUN_PATH}"
echo "LD_RUN_PATH = $(printenv LD_RUN_PATH)"


echo "#### Simple Sirius version test"
sirius --version

echo "#### Download test data"
wget https://bio.informatik.uni-jena.de/wp/wp-content/uploads/2021/10/Kaempferol.ms

echo "#### Run SIRIUS ILP solver Test"
sirius -i Kaempferol.ms -o test-out sirius

echo "#### Check SIRIUS ILP solver Test results"
if [ ! -f "test-out/1_Kaempferol_Kaempferol/trees" ]; then
  echo Framgentation tree test failed!
  exit 1
fi