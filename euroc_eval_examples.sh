#!/bin/bash
pathDatasetEuroc='/Datasets/EuroC' #Example, it is necesary to change it by the dataset path

 
for i in {1..10}
do
    echo "Launching MH01 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH01 ./Examples/Monocular/EuRoC_TimeStamps/MH01.txt MH01_mono_1
    echo "------------------------------------"
    echo "Evaluation of MH01 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH01_GT.txt f_MH01_mono_$i.txt --plot MH01_mono_$i.pdf --result MH01_data_$i.txt --verbose

    echo "Launching MH02 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH02 ./Examples/Monocular/EuRoC_TimeStamps/MH02.txt MH02_mono_$i
    echo "------------------------------------"
    echo "Evaluation of MH02 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH02_GT.txt f_MH02_mono_$i.txt --plot MH02_mono.pdf --result MH02_data_$i.txt --verbose

    echo "Launching MH03 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH03 ./Examples/Monocular/EuRoC_TimeStamps/MH03.txt MH03_mono_$i
    echo "------------------------------------"
    echo "Evaluation of MH03 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH03_GT.txt f_MH03_mono_$i.txt --plot MH03_mono.pdf --result MH03_data_$i.txt --verbose

    echo "Launching MH04 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH04 ./Examples/Monocular/EuRoC_TimeStamps/MH04.txt MH04_mono_$i
    echo "------------------------------------"
    echo "Evaluation of MH04 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH04_GT.txt f_MH04_mono_$i.txt --plot MH04_mono.pdf --result MH04_data_$i.txt --verbose

    echo "Launching MH05 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH05 ./Examples/Monocular/EuRoC_TimeStamps/MH05.txt MH05_mono_$i
    echo "------------------------------------"
    echo "Evaluation of MH05 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH05_GT.txt f_MH05_mono_$i.txt --plot MH05_mono.pdf --result MH05_data_$i.txt --verbose

    echo "Launching V101 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V101 ./Examples/Monocular/EuRoC_TimeStamps/V101.txt V101_mono_$i
    echo "------------------------------------"
    echo "Evaluation of V101 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V101_GT.txt f_V101_mono_$i.txt --plot V101_mono.pdf --result V101_data_$i.txt --verbose

    echo "Launching V102 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V102 ./Examples/Monocular/EuRoC_TimeStamps/V102.txt V102_mono_$i
    echo "------------------------------------"
    echo "Evaluation of V102 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V102_GT.txt f_V102_mono_$i.txt --plot V102_mono.pdf --result V102_data_$i.txt --verbose

    echo "Launching V103 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V103 ./Examples/Monocular/EuRoC_TimeStamps/V103.txt V103_mono_$i
    echo "------------------------------------"
    echo "Evaluation of V103 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V103_GT.txt f_V103_mono_$i.txt --plot V103_mono.pdf --result V103_data_$i.txt --verbose

        echo "Launching V201 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V201 ./Examples/Monocular/EuRoC_TimeStamps/V201.txt V201_mono_$i
    echo "------------------------------------"
    echo "Evaluation of V201 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V201_GT.txt f_V201_mono_$i.txt --plot V201_mono.pdf --result V201_data_$i.txt --verbose

    echo "Launching V202 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V202 ./Examples/Monocular/EuRoC_TimeStamps/V202.txt V202_mono_$i
    echo "------------------------------------"
    echo "Evaluation of V202 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V202_GT.txt f_V202_mono_$i.txt --plot v_mono.pdf --result V202_data_$i.txt --verbose

    echo "Launching V203 with Monocular sensor: session $i"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V203 ./Examples/Monocular/EuRoC_TimeStamps/V203.txt V203_mono_$i
    echo "------------------------------------"
    echo "Evaluation of V203 trajectory with Monocular sensor: session $i"
    python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V203_GT.txt f_V203_mono_$i.txt --plot V203_mono.pdf --result V203_data_$i.txt --verbose
done

# Gistad smooth sequences and speed tests 
pathDatasetGistad='/Datasets/Gistad_smooth' #Example, it is necesary to change it by the dataset path

for i in {1..10}
do
     echo "Launching Gistad speed with Monocular sensor"
     ./Examples/Monocular/mono_AGZ ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/GISTAD.yaml "$pathDatasetGistad"/images "$pathDatasetGistad"/DJI_0277_nano.txt
done

for i in {1..10}
do
    echo "Launching Gistad smooth with Monocular sensor"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/GISTAD.yaml "$pathDatasetGistad"/images "$pathDatasetGistad"/DJI_0275_nano.txt gistad_smooth_mono_ORB_5
done

for i in {1..10}
do

    echo "Launching Gistad speed with Monocular sensor"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/3ms/GISTAD.yaml "$pathDatasetGistad"/3ms/images "$pathDatasetGistad"/3ms/DJI_0279_nano.txt gistad_speed3_mono_ORB_$i
done

for i in {1..10}
do

    echo "Launching Gistad speed with Monocular sensor"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/5ms/GISTAD.yaml "$pathDatasetGistad"/5ms/images "$pathDatasetGistad"/5ms/DJI_0279_nano.txt gistad_speed5_mono_ORB_$i
done


for i in {1..10}
do

    echo "Launching Gistad speed with Monocular sensor"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/7ms/GISTAD.yaml "$pathDatasetGistad"/7ms/images "$pathDatasetGistad"/7ms/DJI_0279_nano.txt gistad_speed7_mono_ORB_$i
done


for i in {1..10}
do

    echo "Launching Gistad speed with Monocular sensor"
    ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/9ms/GISTAD.yaml "$pathDatasetGistad"/9ms/images "$pathDatasetGistad"/9ms/DJI_0279_nano.txt gistad_speed9_mono_ORB_$i
done


for i in {1..10}
do

    echo "Launching Gistad speed with Monocular sensor"
     ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt "$pathDatasetGistad"/12ms/GISTAD.yaml "$pathDatasetGistad"/12ms/images "$pathDatasetGistad"/12ms/DJI_0279_nano.txt gistad_speed12_mono_ORB_$i
done

