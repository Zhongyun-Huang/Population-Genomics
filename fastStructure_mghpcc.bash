module load fastStructure/v1.0-4-ge47212f 
module load python/2.7.9
module load python/2.7.9_packages/matplotlib/1.4.3
python /share/pkg/fastStructure/v1.0-4-ge47212f/structure.py -K 1 --input=/home/zh70a/data/strict_drop_ZFS_struc --output=/home/zh70a/data/fast_Stru_ZFS --format=str ### Duplicate this line with different Ks####
python /share/pkg/fastStructure/v1.0-4-ge47212f/chooseK.py --input=/home/zh70a/data/fast_Stru_ZFS ####Look at the output, and will get a range of Ks to use
python /share/pkg/fastStructure/v1.0-4-ge47212f/distruct.py -K 6 --input=fast_Stru_ZFS --popfile=pop_only_file.txt --output=ZFS_K6_rep1_popfile.pdf ### Had to use Xwin to make the pdf file show####