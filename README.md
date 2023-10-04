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

Calculate the readlength of different samples and make a plot with R using package GGPLOT2
```
./read_lengths.sh
```

# Day3
![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/c165216a-8338-4012-bdaf-7f7603576b86)

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/b7d5c94f-1d0d-4e40-b870-c76724b8fba8)

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/13e03c45-ca03-4d57-8a43-16f1c86b82c6)


![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/406bab5f-8511-4eab-bc3c-229786cc0641)


Run euka on all the trimmed fastq files and check the results
```
~/course/data/vgan/bin/vgan euka -fq1 <(zcat ~/course/wdir/day2/mapping/*.vs.fq.gz) -o all_files -t 5 --euka_dir euka_dir/
less all_files_abundance.tsv | grep yes
```
The results shows 

```
Bovidae yes     108     1
```



