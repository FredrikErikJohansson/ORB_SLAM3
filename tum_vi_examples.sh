#!/bin/bash
pathDatasetTUM_VI='/Datasets/TUM_MONO' #Example, it is necesary to change it by the dataset path

#------------------------------------
# Monocular Examples for TUM monoVO sequences
for i in {1..10..1}
do
    echo "Launching sequence_45 session $i"
    ./Examples/Monocular/mono_tum ./Vocabulary/ORBvoc.txt ./Examples/Monocular/TUM1.yaml "$pathDatasetTUM_VI"/sequence_45 sequence_45_mono_ORB

    echo "Launching sequence_46 session $i"
    ./Examples/Monocular/mono_tum ./Vocabulary/ORBvoc.txt ./Examples/Monocular/TUM1.yaml "$pathDatasetTUM_VI"/sequence_46 sequence_46_mono_ORB_$i

    echo "Launching sequence_47 session $i"
    ./Examples/Monocular/mono_tum ./Vocabulary/ORBvoc.txt ./Examples/Monocular/TUM1.yaml "$pathDatasetTUM_VI"/sequence_47 sequence_47_mono_ORB_$i

    echo "Launching sequence_48 session $i"
    ./Examples/Monocular/mono_tum ./Vocabulary/ORBvoc.txt ./Examples/Monocular/TUM1.yaml "$pathDatasetTUM_VI"/sequence_48 sequence_48_mono_ORB_$i

    echo "Launching sequence_49 session $i"
    ./Examples/Monocular/mono_tum ./Vocabulary/ORBvoc.txt ./Examples/Monocular/TUM1.yaml "$pathDatasetTUM_VI"/sequence_49 sequence_49_mono_ORB_$i

    echo "Launching sequence_50 session $i"
    ./Examples/Monocular/mono_tum ./Vocabulary/ORBvoc.txt ./Examples/Monocular/TUM1.yaml "$pathDatasetTUM_VI"/sequence_50 sequence_50_mono_ORB_$i
done
