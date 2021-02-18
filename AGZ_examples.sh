#!/bin/bash
pathDatasetAGZ='/home/fredrik/Projects/datasets/AGZ' #Example, it is necesary to change it by the dataset path

#------------------------------------
# Monocular Examples
echo "Launching AGZ with Monocular sensor"
./Examples/Monocular/mono_AGZ Vocabulary/ORBvoc.txt Examples/Monocular/AGZ.yaml "$pathDatasetAGZ" Examples/Monocular/AGZ_TimeStamps/agz.txt

# Monocular Inertial Examples
#echo "Launching AGZ with Monocular Inertial sensor"
#./Examples/Monocular-Inertial/mono_inertial_AGZ Vocabulary/ORBvoc.txt Examples/Monocular-Inertial/AGZ.yaml "$pathDatasetAGZ" Examples/Monocular-Inertial/AGZ_TimeStamps/#agz.txt Examples/Monocular-Inertial/AGZ_IMU/agz.txt
