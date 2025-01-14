#!/bin/bash
## INSTRUCTIONS
# This batch file is used for train compass in the ModelNet dataset. It is based on https://github.com/charlesq34/pointnet
#
# First download ModelNet dataset from: https://shapenet.cs.stanford.edu/media/modelnet40_ply_hdf5_2048.zip
# For more information about this dataset please refer to: https://github.com/charlesq34/pointnet
#
# Create files named train.csv and test.csv
# We adopt files ply_data_train[0:4].h5 for train and ply_data_test[0:1].h5 for test
#
# Train your own network by using train_compass_ModelNet.sh or download the pretrained weights
#
# If you find this work useful please cite

data_path="data/modelnet40"
n_epocs=150
dataset_type="modelnet40" # or shapenet
nm_train="classification_compass"
date_time=`date +%Y-%m-%d_%H-%M`
output_folder="logs/PointNet/$nm_train-$date_time/"
feature_transform=0 #use feature t-net on PointNet architecture
AR=0 #use arbitrary rotations
rotate_axis='all' #define augmentation mode
debug=0

# set path for the compass pre-trained weights
checkpoint=25200
train_name="2020-05-26_09-39-Train_btw24_near_sonic_3laySO3_ModelNet_no_augmentation"
# To enable test mode, define the pre-trained classifier weights path and set --path_pointnet parameter
path_pointnet="logs/PointNet/classification_compass-2021-09-24_16-26/cls_model_149.pth"

file_train="$data_path/train.csv"
file_test="$data_path/test.csv"
path_lrf=pretrained_models/modelnet40/lrf_layer.pkl
path_s2=pretrained_models/modelnet40/s2_layer.pkl
python apps/train_classification_pointnet.py --dataset $data_path --nepoch=$n_epocs --dataset_type $dataset_type \
                                                --outf $output_folder --batchSize 50 --num_points 2048 \
                                                --workers 8 --feature_transform $feature_transform \
                                                --rotate_axis $rotate_axis --debug $debug --arbitrary_rotations $AR \
                                                --path_ckp_layer_lrf $path_lrf --path_ckp_layer_s2 $path_s2 \
                                                --file_list_train $file_train --file_list_test $file_test  
                                                #--path_pointnet $path_pointnet
