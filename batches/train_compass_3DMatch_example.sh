#!/bin/bash

date=`date +%Y-%m-%d`
nm_train="Compass_3DMatch"
dir_ds="data/3DMatch" #path to the dataset
date_time=`date +%Y-%m-%d_%H-%M`
dir_log="logs/3DMatch/$date_time-$nm_train" #path to save training files
file_train="$dir_ds/compass_train.csv"
file_validation="$dir_ds/compass_valid.csv"

echo python3 apps/train_compass.py  --config_file configs/train_3dm.yaml \
     --name_train $nm_train --path_log $dir_log --path_ds $dir_ds \
     --name_file_folder_train $file_train \
     --name_file_folder_validation $file_validation
