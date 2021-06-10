#!/bin/bash
pathDatasetEuroc='/home/frejo/Master-thesis/datasets/EuRoC' #Example, it is necesary to change it by the dataset path

echo "Launching MH02 with Monocular sensor"
./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH02 ./Examples/Monocular/EuRoC_TimeStamps/MH02.txt dataset-MH02_mono
echo "------------------------------------"
echo "Evaluation of MH02 trajectory with Monocular sensor"
python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH02_GT.txt kf_dataset-MH02_mono.txt --plot MH02_mono.pdf --result MH02_data.txt --verbose

# echo "Launching MH05 with Monocular sensor"
# ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/MH05 ./Examples/Monocular/EuRoC_TimeStamps/MH05.txt dataset-MH05_mono
# echo "------------------------------------"
# echo "Evaluation of MH05 trajectory with Monocular sensor"
# python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/MH05_GT.txt f_dataset-MH05_mono.txt --plot MH05_mono.pdf --result MH05_data.txt --verbose

# echo "Launching V201 with Monocular sensor"
# ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V201 ./Examples/Monocular/EuRoC_TimeStamps/V201.txt dataset-V201_mono
# echo "------------------------------------"
# echo "Evaluation of V201 trajectory with Monocular sensor"
# python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V201_GT.txt f_dataset-V201_mono.txt --plot V201_mono.pdf --result V201_data.txt --verbose

# echo "Launching V202 with Monocular sensor"
# ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V202 ./Examples/Monocular/EuRoC_TimeStamps/V202.txt dataset-V202_mono
# echo "------------------------------------"
# echo "Evaluation of V202 trajectory with Monocular sensor"
# python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V202_GT.txt f_dataset-V202_mono.txt --plot V202_mono.pdf --result V202_data.txt --verbose

# echo "Launching V203 with Monocular sensor"
# ./Examples/Monocular/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/EuRoC.yaml "$pathDatasetEuroc"/V203 ./Examples/Monocular/EuRoC_TimeStamps/V203.txt dataset-V203_mono
# echo "------------------------------------"
# echo "Evaluation of V203 trajectory with Monocular sensor"
# python evaluation/evaluate_ate_scale.py evaluation/Ground_truth/EuRoC_left_cam/V203_GT.txt f_dataset-V203_mono.txt --plot V203_mono.pdf --result V203_data.txt --verbose




