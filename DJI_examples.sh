#!/bin/bash
pathDatasetDJI='/home/frejo/Master-thesis/datasets/DJI_0121' #It is necessary to change it by the dataset path

#------------------------------------
# Monocular Examples
echo "Launching DJI footage with Monocular sensor"
./Examples/Monocular/mono_DJI Vocabulary/ORBvoc.txt Examples/Monocular/AGZ.yaml "$pathDatasetDJI"/images/ "$pathDatasetDJI"/DJI_0121.txt

# Monocular Inertial Examples
#echo "Launching DJI footage with Monocular Inertial sensor"
#./Examples/Monocular-Inertial/mono_inertial_DJI Vocabulary/ORBvoc.txt Examples/Monocular-Inertial/AGZ.yaml "$pathDatasetDJI"/images/ ./Examples/Monocular-Inertial/DJI_TimeStamps/DJI.txt ./Examples/Monocular-Inertial/DJI_IMU/DJI.txt
