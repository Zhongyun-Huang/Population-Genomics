#!/bin/bash

#BSUB -n 1
#BSUB -R rusage[mem=10000]
#BSUB -q long
#BSUB -W 200:00
#BSUB -o "/home/zh70a/data"
#BSUB -e "/home/zh70a/data"

#Shell file for Structure software on Cluster
module load Structure/2.3.4
structure -K 1 -o project_name_K1 >log_project_name_K1
structure -K 2 -o project_name_K2 >log_project_name_K2
structure -K 3 -o project_name_K3 >log_project_name_K3
structure -K 4 -o project_name_K4 >log_project_name_K4
structure -K 5 -o project_name_K5 >log_project_name_K5
structure -K 6 -o project_name_K6 >log_project_name_K6
structure -K 7 -o project_name_K7 >log_project_name_K7
structure -K 8 -o project_name_K8 >log_project_name_K8
structure -K 9 -o project_name_K9 >log_project_name_K9

