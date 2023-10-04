# Day1

Go to the wokring directory and make a "mirror" link to the files 

```
cd ~/course/wdir/day2/mapping/
ln -s ~/course/data/day2/fastq/* .
```

and then run  the bash script with 

```
nice -19 nohup ./assignment-2.sh > log.out &
```
# Day2

Run ngsLCA before metaDMG

```
for i in $(ls *.sort.bam | awk -F "." '{print $1}')
do
echo $i
metaDMG-cpp lca -bam ${i}.sort.bam -names ~/course/data/shared/mapping/taxonomy/names.dmp -nodes ~/course/data/shared/mapping/taxonomy/nodes.dmp -acc2tax ~/course/data/shared/mapping/taxonomy/acc2taxid.map.gz -weighttype 1 -fix_ncbi 0 -out ${i}
```


Calculate the readlength of different samples and make a plot with R using package GGPLOT2
```
./read_lengths.sh
```

# Day3
## Species abundance
We used the provided scripts from the course homepage to generate these plots: 

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/c165216a-8338-4012-bdaf-7f7603576b86)

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/b7d5c94f-1d0d-4e40-b870-c76724b8fba8)

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/13e03c45-ca03-4d57-8a43-16f1c86b82c6)

We set the LR3 to be 5, since we would like to avoid the impact from non-ancient sequences, however in the end, MAP_significance of 5 could be too high.

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/8f9493cc-84a5-4f5f-9443-c4fcffe0bfcd)

## euka 
Run euka on all the trimmed fastq files and check the results
```
~/course/data/vgan/bin/vgan euka -fq1 <(zcat ~/course/wdir/day2/mapping/*.vs.fq.gz) -o all_files -t 5 --euka_dir euka_dir/
less all_files_abundance.tsv | grep yes
```
The results shows 

```
Bovidae yes     108     1
```

## PCA & f-statistics


