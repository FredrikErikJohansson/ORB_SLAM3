#!/bin/bash
pathDatasetAGZ='/home/frejo/Master-thesis/datasets' #Example, it is necesary to change it by the dataset path

#------------------------------------
# Monocular Examples
# echo "Launching gidsta_hard with Monocular sensor"
# ./Examples/Monocular/mono_AGZ Vocabulary/ORBvoc.txt Examples/Monocular/DJI.yaml "$pathDatasetAGZ"/gistad_hard/images/ Examples/Monocular/AGZ_TimeStamps/DJI_0273.txt

echo "Launching gidsta_smooth with Monocular sensor"
./Examples/Monocular/mono_AGZ Vocabulary/ORBvoc.txt Examples/Monocular/DJI.yaml "$pathDatasetAGZ"/gistad_smooth/images/ Examples/Monocular/AGZ_TimeStamps/DJI_0275.txt

# echo "Launching gidsta_ortho with Monocular sensor"
# ./Examples/Monocular/mono_AGZ Vocabulary/ORBvoc.txt Examples/Monocular/DJI.yaml "$pathDatasetAGZ"/gistad_ortho/images/ Examples/Monocular/AGZ_TimeStamps/DJI_0277.txt

# ./Examples/Monocular/mono_AGZ Vocabulary/ORBvoc.txt Examples/Monocular/TUM_512.yaml "$pathDatasetAGZ"/TUM-mono/sequence_45/images/ Examples/Monocular/AGZ_TimeStamps/sequence_45.txt

# Monocular Inertial Examples
#echo "Launching AGZ with Monocular Inertial sensor"
#./Examples/Monocular-Inertial/mono_inertial_AGZ Vocabulary/ORBvoc.txt Examples/Monocular-Inertial/AGZ.yaml "$pathDatasetAGZ"/MAV_Images/ Examples/Monocular-Inertial/AGZ_TimeStamps/agz.txt Examples/Monocular-Inertial/AGZ_IMU/agz.txt


# Monocular Examples
#echo "Launching AGZ with Monocular sensor"
#./Examples/Monocular/mono_AGZ Vocabulary/ORBvoc.txt Examples/Monocular/AGZ.yaml "$pathDatasetAGZ"/MAV_Images/ Examples/Monocular/AGZ_TimeStamps/agz.txt
